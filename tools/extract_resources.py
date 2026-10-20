#!/usr/bin/env python3
"""Extract the resources of your own winmine.exe and generate a buildable winmine.rc.

usage: python extract_resources.py <winmine.exe> <output-dir>

Writes into <output-dir>: winmine.rc, app.ico, manifest.xml, bitmap_<id>.bmp, wave_<id>.wav.
Requires: pip install pefile
"""
import os
import struct
import sys

import pefile

RT_BITMAP, RT_MENU, RT_DIALOG, RT_STRING = 2, 4, 5, 6
RT_ACCELERATOR, RT_ICON, RT_GROUP_ICON, RT_MANIFEST = 9, 3, 14, 24
WAVE = "WAVE"


def die(msg):
    sys.exit("error: " + msg)


def load(path):
    try:
        pe = pefile.PE(path)
    except (OSError, pefile.PEFormatError) as e:
        die(f"cannot read {path} as a PE file: {e}")
    if not hasattr(pe, "DIRECTORY_ENTRY_RESOURCE"):
        die("the file contains no resources")
    return pe


def collect(pe):
    """Return {type: {id: bytes}}; named types use their name as key."""
    out = {}
    for t in pe.DIRECTORY_ENTRY_RESOURCE.entries:
        key = t.id if t.name is None else t.name.decode() if isinstance(t.name, bytes) else str(t.name)
        for r in t.directory.entries:
            rid = r.id if r.name is None else str(r.name)
            d = r.directory.entries[0].data.struct
            out.setdefault(key, {})[rid] = pe.get_data(d.OffsetToData, d.Size)
    return out


def escape(s):
    return (s.replace("\\", "\\\\").replace('"', '""').replace("\r", "\\r")
             .replace("\n", "\\n").replace("\t", "\\t"))


def read_sz(buf, o):
    s = ""
    while True:
        c = struct.unpack_from("<H", buf, o)[0]
        o += 2
        if c == 0:
            return s, o
        s += chr(c)


def dib_to_bmp(dib):
    hdr = struct.unpack_from("<I", dib, 0)[0]
    bpp = struct.unpack_from("<H", dib, 14)[0]
    ncol = struct.unpack_from("<I", dib, 32)[0] or (1 << bpp if bpp <= 8 else 0)
    off = 14 + hdr + 4 * ncol
    return b"BM" + struct.pack("<IHHI", 14 + len(dib), 0, 0, off) + dib


def build_ico(group, icons):
    _, _, n = struct.unpack_from("<HHH", group, 0)
    ents = [struct.unpack_from("<BBBBHHIH", group, 6 + 14 * i) for i in range(n)]
    head = struct.pack("<HHH", 0, 1, n)
    body = b""
    off = 6 + 16 * n
    for e in ents:
        img = icons[e[7]]
        head += struct.pack("<BBBBHHII", e[0], e[1], e[2], e[3], e[4], e[5], len(img), off + len(body))
        body += img
    return head + body


def menu_rc(m):
    skip = struct.unpack_from("<HH", m, 0)[1]

    def parse(o, ind):
        out = []
        while True:
            f = struct.unpack_from("<H", m, o)[0]
            o += 2
            pad = " " * ind
            if f & 0x10:
                s, o = read_sz(m, o)
                out.append(f'{pad}POPUP "{escape(s)}"\n{pad}BEGIN')
                sub, o = parse(o, ind + 4)
                out += sub
                out.append(pad + "END")
            else:
                i = struct.unpack_from("<H", m, o)[0]
                o += 2
                s, o = read_sz(m, o)
                out.append(pad + ("MENUITEM SEPARATOR" if s == "" and i == 0
                                  else f'MENUITEM "{escape(s)}", {i}'))
            if f & 0x80:
                return out, o

    lines, _ = parse(4 + skip, 4)
    return "BEGIN\n" + "\n".join(lines) + "\nEND"


def accel_rc(a):
    rows = []
    for i in range(0, len(a), 8):
        _, key, cmd = struct.unpack_from("<HHH", a, i)
        k = f"VK_F{key - 0x6F}" if 0x70 <= key <= 0x7B else str(key)
        rows.append(f"    {k}, {cmd}, VIRTKEY")
    return "BEGIN\n" + "\n".join(rows) + "\nEND"


CLASSES = {0x80: "BUTTON", 0x81: "EDIT", 0x82: "STATIC", 0x83: "LISTBOX", 0x84: "SCROLLBAR", 0x85: "COMBOBOX"}


def dialog_rc(rid, d):
    style, _ex, count, x, y, cx, cy = struct.unpack_from("<IIHhhhh", d, 0)
    o = 18

    def value(o):
        w = struct.unpack_from("<H", d, o)[0]
        if w == 0xFFFF:
            return struct.unpack_from("<H", d, o + 2)[0], o + 4, True
        if w == 0:
            return "", o + 2, False
        s, o = read_sz(d, o)
        return s, o, False

    _, o, _ = value(o)
    _, o, _ = value(o)
    title, o, _ = value(o)
    font = ""
    if style & 0x40:
        size = struct.unpack_from("<H", d, o)[0]
        face, o, _ = value(o + 2)
        font = f'FONT {size}, "{face}"'
    out = [f"{rid} DIALOG {x}, {y}, {cx}, {cy}", f"STYLE 0x{style & ~0x40:08X}",
           f'CAPTION "{escape(title)}"', font, "BEGIN"]
    for _ in range(count):
        o = (o + 3) & ~3
        st, ex, ix, iy, w, h, cid = struct.unpack_from("<IIhhhhH", d, o)
        o += 18
        cls, o, is_ord = value(o)
        text, o, text_ord = value(o)
        o += 2 + struct.unpack_from("<H", d, o)[0]
        cname = CLASSES.get(cls, cls) if is_ord else cls
        t = str(text) if text_ord else f'"{escape(text)}"'
        extra = f", 0x{ex:X}" if ex else ""
        out.append(f'    CONTROL {t}, {cid}, "{cname}", 0x{st:08X}, {ix}, {iy}, {w}, {h}{extra}')
    out.append("END")
    return "\n".join(line for line in out if line)


def strings_rc(blocks):
    rows = []
    for block_id, b in sorted(blocks.items()):
        o = 0
        for k in range(16):
            n = struct.unpack_from("<H", b, o)[0]
            o += 2
            if n:
                rows.append(f'    {(block_id - 1) * 16 + k}, "{escape(b[o:o + 2 * n].decode("utf-16le"))}"')
            o += 2 * n
    return "STRINGTABLE\nBEGIN\n" + "\n".join(rows) + "\nEND"


def main():
    if len(sys.argv) != 3:
        sys.exit(__doc__)
    exe, out = sys.argv[1], sys.argv[2]
    res = collect(load(exe))
    for needed in (RT_BITMAP, RT_MENU, RT_DIALOG, RT_STRING, RT_GROUP_ICON, WAVE):
        if needed not in res:
            die(f"resource type {needed!r} not found; is this the Windows Minesweeper winmine.exe?")
    os.makedirs(out, exist_ok=True)

    def write(name, data):
        with open(os.path.join(out, name), "wb") as f:
            f.write(data)

    rc = ["#include <windows.h>\n"]
    group_id, group = next(iter(res[RT_GROUP_ICON].items()))
    write("app.ico", build_ico(group, res[RT_ICON]))
    rc.append(f'{group_id} ICON "app.ico"')
    for rid, dib in sorted(res[RT_BITMAP].items()):
        write(f"bitmap_{rid}.bmp", dib_to_bmp(dib))
        rc.append(f'{rid} BITMAP "bitmap_{rid}.bmp"')
    for rid, wav in sorted(res[WAVE].items()):
        write(f"wave_{rid}.wav", wav)
        rc.append(f'{rid} WAVE "wave_{rid}.wav"')
    rc.append(strings_rc(res[RT_STRING]))
    for rid, m in res[RT_MENU].items():
        rc.append(f"{rid} MENU\n" + menu_rc(m))
    for rid, a in res.get(RT_ACCELERATOR, {}).items():
        rc.append(f"{rid} ACCELERATORS\n" + accel_rc(a))
    for rid, d in sorted(res[RT_DIALOG].items()):
        rc.append(dialog_rc(rid, d))
    if RT_MANIFEST in res:
        mid, man = next(iter(res[RT_MANIFEST].items()))
        write("manifest.xml", man)
        rc.append(f'{mid} 24 "manifest.xml"')
    with open(os.path.join(out, "winmine.rc"), "w", encoding="utf-8") as f:
        f.write("\n\n".join(rc) + "\n")
    print(f"wrote {os.path.join(out, 'winmine.rc')} and its assets")


if __name__ == "__main__":
    main()
