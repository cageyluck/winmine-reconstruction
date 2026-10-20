# Build the reconstruction from your own copy of winmine.exe.
#
#   make EXE=path/to/winmine.exe
#
# Variables (override on the command line):
#   EXE     your winmine.exe (Windows Minesweeper, 32-bit Unicode build)
#   ZIG     Zig executable, used as the C compiler and resource compiler (default: zig)
#   PYTHON  Python 3 interpreter with pefile (and capstone for `make disasm`)

EXE    ?= winmine.exe
ZIG    ?= zig
PYTHON ?= python3

BUILD  := build
RES    := $(BUILD)/res
TARGET := $(BUILD)/winmine_rebuilt.exe
SRC    := src/winmine_reconstructed.c

CFLAGS  := -target x86-windows-gnu -O1 -Wall
LDFLAGS := -Wl,--subsystem,windows
LIBS    := -lcomctl32 -lshell32 -lwinmm -ladvapi32 -luser32 -lgdi32

.PHONY: all resources disasm clean

all: $(TARGET)

resources: $(RES)/winmine.rc

$(RES)/winmine.rc: $(EXE) tools/extract_resources.py
	$(PYTHON) tools/extract_resources.py "$(EXE)" $(RES)

$(RES)/winmine.res: $(RES)/winmine.rc
	cd $(RES) && $(ZIG) rc winmine.rc winmine.res

$(TARGET): $(SRC) $(RES)/winmine.res
	$(ZIG) cc $(CFLAGS) $(LDFLAGS) $(SRC) $(RES)/winmine.res -o $@ $(LIBS)

disasm: $(EXE)
	mkdir -p $(BUILD)
	$(PYTHON) tools/wm_disasm.py "$(EXE)" $(BUILD)/winmine_disassembly.asm

clean:
	rm -rf $(BUILD)
