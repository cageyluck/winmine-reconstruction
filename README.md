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
| `tools/extract_resources.py` | Extracts resources from your own `winmine.exe` and generates `winmine.rc` |
| `Makefile` | Extracts resources, compiles and links the project |
| `tools/wm_disasm.py` | Script that produced the disassembly (needs `pefile` and `capstone`; usage: `python tools/wm_disasm.py winmine.exe out.asm`) |

## Notes on the reconstruction

- There are no symbols in the binary, so all function and variable names are guesses.
- The CRT startup code at the entry point is not reconstructed; the build uses the toolchain's own startup.
- Board cells are one byte: bit 7 = mine, bit 6 = revealed, bits 0-4 = display index.

## Building

The repository contains no Microsoft resources. You supply your own `winmine.exe`
(Windows Minesweeper, 32-bit Unicode build); the build extracts the menu, dialogs, bitmaps,
sounds and icon from it and generates `winmine.rc`.

Requirements: [Zig](https://ziglang.org/) (used as C compiler and resource compiler),
Python 3 with `pefile`, and `make`.

```
pip install pefile
make EXE=path/to/winmine.exe
```

The result is `build/winmine_rebuilt.exe`. Individual steps:

| Command | Effect |
| --- | --- |
| `make resources EXE=...` | only extract the resources and write `build/res/winmine.rc` |
| `make disasm EXE=...` | write a disassembly to `build/winmine_disassembly.asm` (needs `capstone`) |
| `make clean` | remove `build/` |

If Zig is not on your PATH, pass it explicitly, e.g. `make ZIG="python3 -m ziglang" EXE=...`.
Without `make`, run `python tools/extract_resources.py winmine.exe build/res`, compile the `.rc`
with `zig rc`, and link as shown in the `Makefile`.

## Legal

Only `tools/wm_disasm.py`, `tools/extract_resources.py`, the `Makefile` and this README are under the MIT License (see `LICENSE`). The reconstructed
source and the disassembly are derived from Microsoft's program and are not licensed by the author.

Windows Minesweeper is a Microsoft product. This repository contains no Microsoft binaries
or assets. It is not affiliated with or endorsed by Microsoft.
