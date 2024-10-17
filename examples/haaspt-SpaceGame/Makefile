all: SpaceGame.nes

build: SpaceGame.nes

main.o: src/main.asm
	../../common/utilities/cc65/ca65 src/main.asm

reset.o: src/reset.asm
	../../common/utilities/cc65/ca65 src/reset.asm

SpaceGame.nes: main.o reset.o
	../../common/utilities/cc65/ld65 *.o -C cfg/nes.cfg -o bin/SpaceGame.nes

clean:
	rm -f *.o *.nes
