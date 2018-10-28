# benjamin medicke
# github.com/bmedicke

BAUD       = 115200
F_CPU      = 16000000UL
I2C_SCL    = 400000UL
MCU        = atmega328p
PORT       = /dev/cu.usbmodem*
PROGRAMMER = arduino

LIBDIR   = vendor/
BINDIR = build/


# simavr can be removed as soon as the homebrew formula is fixed.
INCLUDES = -I. -I$(LIBDIR) -isystem"/usr/local/include/simavr"

########################################################
#  nothing below this point should have to be changed  #
########################################################

AVRDUDE = avrdude
AVRSIZE = avr-size
CC      = avr-gcc
CXX     =
OBJCOPY = avr-objcopy
OBJDUMP = avr-objdump
SIMAVR  = simavr

TARGET = $(lastword $(subst /, ,$(CURDIR)))

# preprocessor flags:
CPPFLAGS = -D F_CPU=$(F_CPU) -D I2C_SCL=$(I2C_SCL) -D BAUD=$(BAUD) \
					 -D MCU=\"$(MCU)\" $(INCLUDES)
#  -D       define macro

# c compiler flags:
CFLAGS = -O3 -mmcu=$(MCU)
CFLAGS += -Wall -Werror
CFLAGS += -g3
#  -Os      optimize for size
#  -mmcu    set Model MicroControlller Unit
#  -g3      add debug symbols, no impact on .hex size
#  -Wall    enable all errors
#  -Werror  warnings are errors

# linker flags:
LDFLAGS = -Os -mmcu=$(MCU)

# c++ compiler flags:
CXXFLAGS =

# add all directories with code to the wildcard:
SOURCES = $(wildcard *.c $(LIBDIR)*.c)
OBJECTS = $(addprefix $(BINDIR), $(SOURCES:.c=.o))
HEADERS = $(SOURCES:.c=.h)

all: $(BINDIR)$(TARGET).hex

$(BINDIR)%.o: %.c Makefile
	$(CC) $(CFLAGS) $(CPPFLAGS) $< -c -o $@ # --save-temps

$(BINDIR)%.o: %.c $(HEADERS) Makefile
	$(CC) $(CFLAGS) $(CPPFLAGS) $< -c -o $@ # --save-temps

$(BINDIR)$(TARGET).elf: $(OBJECTS)
	$(CC) $(CFLAGS) $^ -o $@

$(BINDIR)%.hex: $(BINDIR)%.elf
	$(OBJCOPY) -j .text -j .data -O ihex $< $@

# targets that don't correspond to a file
.PHONY: all clean size flash simavr upload-trace \
	get-flash get-eeprom get-info dependency-graph loc format test

clean:
	rm -f *.elf *.hex *.vcd *.i *.s *.o dependency-graph.pdf build/*

size: $(BINDIR)$(TARGET).elf
	$(AVRSIZE) -C --mcu=$(MCU) $(BINDIR)$(TARGET).elf

flash: $(BINDIR)$(TARGET).hex
	$(AVRDUDE) -P $(PORT) -b $(BAUD) -p $(MCU) -c $(PROGRAMMER) \
		-U flash:w:$(BINDIR)$(TARGET).hex

simavr: $(BINDIR)$(TARGET).elf
	$(SIMAVR) $(BINDIR)$(TARGET).elf

# upload Value Change Dumps to debian VM for GTKWave.
upload-trace:
	scp *.vcd debian:Desktop

get-flash:
	$(AVRDUDE) -P $(PORT) -b $(BAUD) -p $(MCU) -c $(PROGRAMMER) \
		-U flash:r:flash.hex:i

# i don't think this works with arduino!
get-eeprom:
	$(AVRDUDE) -P $(PORT) -b $(BAUD) -p $(MCU) -c $(PROGRAMMER) \
		-U eeprom:r:eeprom.hex:i

get-info:
	$(AVRDUDE) -P $(PORT) -b $(BAUD) -p $(MCU) -c $(PROGRAMMER) -v 2>&1

dependency-graph:
	make all -Bnd | make2graph | dot -Tpdf -o dependency-graph.pdf

format:
	astyle "*.h" "*.c" --recursive --mode=c --lineend=linux

loc:
	cloc *.[c,h]

test:
	$(MAKE) flash && minicom
