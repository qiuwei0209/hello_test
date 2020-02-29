
# CROSS_COMPILE := arm-hisiv400-linux-

CC 		:=  $(CROSS_COMPILE)gcc
CPP 	:=  $(CROSS_COMPILE)g++
AR      :=  $(CROSS_COMPILE)ar
STRIP   :=  $(CROSS_COMPILE)strip

TARGET := $(notdir $(CURDIR))
SOURCES := $(wildcard *.c)
HEADS := $(wildcard *.h)

OBJECTS  := $(SOURCES:%.c=%.o)

CFLAGS = -g -Wall -O2
CFLAGS += -Werror -Wno-unused-variable -Wno-unused-but-set-variable -Wno-unused-label -Wno-unused-function -Wno-uninitialized
CFLAGS += -I./

LDFLAGS := 


.PHONY: all clean

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CPP) $(OBJECTS) $(LDFLAGS) -o $@

%.o: %.c $(HEADS)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	-rm -f $(TARGET) $(OBJECTS) $(OBJECTS1) *.elf *.gdb *.o *.pre
