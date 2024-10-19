# Directories:
BIN_DIR = bin
BUILD_DIR = build
SRC_DIR = src

all: $(BIN_DIR)/SpaceGame.nes

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

$(BUILD_DIR)/main.o: src/main.asm | $(BUILD_DIR)
	../../common/utilities/cc65/ca65 $(SRC_DIR)/main.asm -o $(BUILD_DIR)/main.o

$(BUILD_DIR)/reset.o: src/reset.asm | $(BUILD_DIR)
	../../common/utilities/cc65/ca65 src/reset.asm -o $(BUILD_DIR)/reset.o

$(BIN_DIR)/SpaceGame.nes: $(BUILD_DIR)/main.o $(BUILD_DIR)/reset.o | $(BIN_DIR)
	../../common/utilities/cc65/ld65 $(BUILD_DIR)/*.o -C cfg/nes.cfg -o $(BIN_DIR)/SpaceGame.nes

clean:
	rm -f -r $(BUILD_DIR) $(BIN_DIR)
