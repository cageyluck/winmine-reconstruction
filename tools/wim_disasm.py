import sys
import pefile, capstone

if len(sys.argv) != 3:
    sys.exit('usage: python wm_disasm.py <winmine.exe> <output.asm>')
pe=pefile.PE(sys.argv[1])
base=pe.OPTIONAL_HEADER.ImageBase
imp={}
for e in pe.DIRECTORY_ENTRY_IMPORT:
    for i in e.imports:
        imp[i.address]=(e.dll.decode().split('.')[0]+'!'+(i.name.decode() if i.name else 'ord%d'%i.ordinal))
t=[s for s in pe.sections if s.Name.startswith(b'.text')][0]
code=t.get_data()[:t.Misc_VirtualSize]; va0=base+t.VirtualAddress
md=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_32); md.detail=True
def inrange(a): return va0<=a<va0+len(code)
entry=base+pe.OPTIONAL_HEADER.AddressOfEntryPoint
funcs=set([entry]); todo=[entry]; seen={}
while todo:
    a=todo.pop()
    while inrange(a) and a not in seen:
        i=next(md.disasm(code[a-va0:a-va0+16],a),None)
        if not i: break
        seen[a]=i
        m=i.mnemonic
        tgt=None
        if i.op_str.startswith('0x') and (m=='call' or m.startswith('j')): tgt=int(i.op_str,16)
        if m=='call' and tgt and inrange(tgt):
            if tgt not in funcs: funcs.add(tgt); todo.append(tgt)
        elif m.startswith('j') and tgt and inrange(tgt): todo.append(tgt)
        if m in('ret','jmp') and not (m=='jmp' and tgt is None and False): 
            break
        a+=i.size
    # also handle jump tables later
print(len(seen),'insns',len(funcs),'funcs')
# jump tables: scan for  jmp dword ptr [reg*4+0x...]
import struct
extra=[]
for a,i in list(seen.items()):
    if i.mnemonic=='jmp' and '*4' in i.op_str:
        tb=int(i.op_str.split('+')[-1].rstrip(']'),16)
        for k in range(64):
            off=tb-va0+4*k
            if off<0 or off+4>len(code): break
            v=struct.unpack('<I',code[off:off+4])[0]
            if not inrange(v): break
            extra.append(v)
todo=list(set(extra))
while todo:
    a=todo.pop()
    while inrange(a) and a not in seen:
        i=next(md.disasm(code[a-va0:a-va0+16],a),None)
        if not i: break
        seen[a]=i; m=i.mnemonic; tgt=None
        if i.op_str.startswith('0x') and (m=='call' or m.startswith('j')): tgt=int(i.op_str,16)
        if m=='call' and tgt and inrange(tgt) and tgt not in funcs: funcs.add(tgt); todo.append(tgt)
        elif m.startswith('j') and tgt and inrange(tgt): todo.append(tgt)
        if m in('ret','jmp'): break
        a+=i.size

def scan_imm():
    new=[]
    for a,i in list(seen.items()):
        for m in re.finditer(r'0x([0-9a-f]{7,8})',i.op_str):
            v=int(m.group(1),16)
            if inrange(v) and v not in seen and i.mnemonic in('push','mov','lea') and v>=va0+0x1000-0x1000+0x600:
                new.append(v)
    return new
import re
for _ in range(6):
    new=set(scan_imm())
    if not new: break
    for v in new: funcs.add(v)
    todo=list(new)
    while todo:
        a=todo.pop()
        while inrange(a) and a not in seen:
            i=next(md.disasm(code[a-va0:a-va0+16],a),None)
            if not i: break
            seen[a]=i; m=i.mnemonic; tgt=None
            if i.op_str.startswith('0x') and (m=='call' or m.startswith('j')): tgt=int(i.op_str,16)
            if m=='call' and tgt and inrange(tgt) and tgt not in funcs: funcs.add(tgt); todo.append(tgt)
            elif m.startswith('j') and tgt and inrange(tgt): todo.append(tgt)
            if m in('ret','jmp'): break
            a+=i.size
print(len(seen),'insns',len(funcs),'funcs after imm scan')
out=[]
for a in sorted(seen):
    i=seen[a]
    if a in funcs: out.append(f'\n; ===== sub_{a:X} =====')
    op=i.op_str
    for ad,n in imp.items():
        op=op.replace(f'[{ad:#x}]',f'[{n}]')
    out.append(f'{a:X}: {i.mnemonic} {op}')
open(sys.argv[2],'w').write('\n'.join(out))
