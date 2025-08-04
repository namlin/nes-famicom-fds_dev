BIN_DIR = bin
BUILD_DIR = build
SRC_DIR = src

all: $(BIN_DIR)/hello_world.nes

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/hello_world.o: $(SRC_DIR)/hello_world.s | $(BUILD_DIR)
	ca65 $(SRC_DIR)/hello_world.s -o $(BUILD_DIR)/hello_world.o

$(BIN_DIR)/hello_world.nes: $(BUILD_DIR)/hello_world.o | $(BIN_DIR)
	ld65 -C cfg/nes.cfg -o $(BIN_DIR)/hello_world.nes $(BUILD_DIR)/hello_world.o

clean:
	rm -r -f $(BIN_DIR) $(BUILD_DIR)

