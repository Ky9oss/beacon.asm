SRCS = $(wildcard *.asm)
BINS = $(patsubst %.asm,%.bin,$(SRCS))
ASSEMBLER = fasm
AFLAGS = 
BIN_DIRS = $(PWD)/../bin

all: $(BINS) 

%.bin:%.asm
	$(ASSEMBLER) $(AFLAGS) $<
	mv $@ $(BIN_DIRS)/

clean:
	-rm -f $(BIN_DIRS)/$(BINS)

.PHONY: all clean

