# Makefile ("make") configuration for iNES ROM files.
#
# Written by Greg M. Krsak <greg.krsak@gmail.com>, 2018

# Reference:
# -https://www.cs.swarthmore.edu/~newhall/unixhelp/howto_makefiles.html

# Makefile variable for the assembler:
ASSEMBLER = ../../common/utilities/cc65/ca65

# Makefile variable for the linker:
LINKER = ../../common/utilities/cc65/ld65

# Makefile variable for assembly flags:
ASMFLAGS = --cpu 6502

# Makefile variable for linker flags:
LINKFLAGS = --config config/ines.cfg

# Simply typing "make" will invoke all suggested targets to build an emulator-ready ROM.
default: universal-pre-clean assemble link emulator emulator-post-clean

# To start over from scratch, type "make clean".
clean: universal-pre-clean emulator-post-clean
	
# This target entry assembles the .s assembly language files into .o object files.
assemble: first_nes.s
	$(ASSEMBLER) $(ASMFLAGS) first_nes.s

# This target entry links the .o object files into .bin ROM files.
link: first_nes.o
	$(LINKER) first_nes.o $(LINKFLAGS)

# This target entry concatenates the .bin ROM files into a .nes iNES emulator-compatible ROM file.
emulator: bin/first_nes_hdr.bin bin/first_nes_prg.bin bin/first_nes_chr.bin
	cat bin/first_nes_hdr.bin bin/first_nes_prg.bin bin/first_nes_chr.bin > first_nes.nes

# TODO: Implement this target for making physical NES cartridges.
cart:
	echo "'cart' target is not currently implemented"

# This target entry removes any build files (.bin, .nes) associated with an NES ROM.
universal-pre-clean:
	$(RM) bin/*.bin && $(RM) first_nes.nes && $(RM) first_nes.o

# This target entry removes the files (.o, .out) not required by emulators.
emulator-post-clean:
	$(RM) first_nes.o && $(RM) a.out
