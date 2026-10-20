# winmine-reconstruction

A hand-made C reconstruction of `winmine.exe` (Windows Minesweeper, 32-bit, Unicode build),
produced by reading a full disassembly of the binary. It is intended for analysis and learning.

> **Status:** the code compiles and links, but it has not been run or compared against the
> original. Behavior may differ, especially in the window drawing and sizing code
> (`DrawBorder`, `AdjustWindow`) and in the mouse tracking code (`FLocalButton`, `TrackMouse`).

## Contents

| File | Description |
| --- | --- |
| `src/winmine_reconstructed.c` | Reconstructed source: game logic, drawing, settings (registry and legacy INI), sound, help, dialogs |
| `analysis/winmine_disassembly.asm` | Recursive-descent disassembly of the code section, with import names |
| `tools/wm_disasm.py` | Script that produced the disassembly (needs `pefile` and `capstone`; usage: `python tools/wm_disasm.py winmine.exe out.asm`) |

## Notes on the reconstruction

- There are no symbols in the binary, so all function and variable names are guesses.
- The CRT startup code at the entry point is not reconstructed; the build uses the toolchain's own startup.
- Board cells are one byte: bit 7 = mine, bit 6 = revealed, bits 0-4 = display index.

## Building

The resources (menu, dialogs, bitmaps, sounds, icon) are not part of this repository.
Provide your own `winmine.rc`, then build, for example with Zig as a MinGW-style cross compiler:

```
zig cc -target x86-windows-gnu -O1 -Wl,--subsystem,windows src/winmine_reconstructed.c winmine.rc -o winmine_rebuilt.exe -lcomctl32 -lshell32 -lwinmm -ladvapi32 -luser32 -lgdi32
```

Any other Windows toolchain (MSVC, MinGW-w64) works too. Link `comctl32`, `shell32`, `winmm`, `advapi32`, `user32` and `gdi32`.

## Legal

Only `tools/wm_disasm.py` and this README are under the MIT License (see `LICENSE`). The reconstructed
source and the disassembly are derived from Microsoft's program and are not licensed by the author.

Windows Minesweeper is a Microsoft product. This repository contains no Microsoft binaries
or assets. It is not affiliated with or endorsed by Microsoft.
