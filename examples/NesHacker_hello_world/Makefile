BIN_DIR = bin
BUILD_DIR = build
SRC_DIR = src

all: $(BIN_DIR)/hello_world.nes

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/hello_world.o: $(SRC_DIR)/hello_world.s | $(BUILD_DIR)
	../../common/utilities/cc65/ca65 $(SRC_DIR)/hello_world.s -o $(BUILD_DIR)/hello_world.o

$(BIN_DIR)/hello_world.nes: $(BUILD_DIR)/hello_world.o | $(BIN_DIR)
	../../common/utilities/cc65/ld65 -C cfg/nes.cfg -o $(BIN_DIR)/hello_world.nes $(BUILD_DIR)/hello_world.o

clean:
	rm -r -f $(BIN_DIR) $(BUILD_DIR)

make: *** No rule to make target 'build/hello_world.o', needed by 'bin/hello_world.nes'.  Stop.

