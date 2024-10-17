all: hello_world.nes

build: hello_world.nes

hello_world.o: src/hello_world.s
	../../common/utilities/cc65/ca65 src/hello_world.s -o hello_world.o

hello_world.nes: hello_world.o
	../../common/utilities/cc65/ld65 -C cfg/nes.cfg -o hello_world.nes hello_world.o

clean:
	rm -f *.o *.nes
