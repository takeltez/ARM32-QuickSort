TARGET = quicksort

CC = gcc

PREF_SRC = src/
PREF_OBJ = build/
PREF_BIN = bin/

SRC = $(wildcard $(PREF_SRC)*.s)
OBJ = $(patsubst $(PREF_SRC)%.s, $(PREF_OBJ)%.o, $(SRC))

.PHONY: all install dir rdir clean

all: dir $(TARGET) install

$(TARGET): $(OBJ)
	$(CC) $(OBJ) -o $(TARGET)

$(PREF_OBJ)%.o: $(PREF_SRC)%.s
	$(CC) -c $< -o $@ -I$(PREF_SRC)

install:
	install $(TARGET) $(PREF_BIN)
	rm -f $(TARGET)

dir:
	mkdir -p $(PREF_BIN)
	mkdir -p $(PREF_OBJ)

rdir:
	rm -rf $(PREF_BIN)
	rm -rf $(PREF_OBJ)

clean:
	rm -f $(PREF_BIN)$(TARGET)
	rm -f $(PREF_OBJ)*.o
