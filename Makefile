CC = gcc
CFLAGS = -Wall -Wextra -Wpedantic -std=c17 -O2
LDFLAGS = -lglfw -lGLEW -lGL -lm
SRC_DIR = src
OBJ_DIR = obj
SOURCES = $(wildcard $(SRC_DIR)/*.c)
OBJECTS = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SOURCES))
EXEC = RotatingCube
INCLUDE = -Iinclude -I/usr/include/glm

all: $(EXEC)

$(EXEC): $(OBJECTS)
	$(CC) $(OBJECTS) -o $@ $(LDFLAGS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@

clean:
	rm -rf $(OBJ_DIR) $(EXEC)

.PHONY: all clean