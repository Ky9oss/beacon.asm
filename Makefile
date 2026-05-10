SRCS = $(wildcard *.asm)
ELFS = $(patsubst %.asm,%,$(SRCS))
ASSEMBLER = fasm
AFLAGS = 
BIN_DIRS = $(PWD)/bin

all: $(ELFS) 

%:%.asm
	$(ASSEMBLER) $(AFLAGS) $<
	chmod +x $@
	mv $@ $(BIN_DIRS)/

clean:
	-rm -f $(BIN_DIRS)/$(ELFS)

echo: 
	@echo $(PWD)

.PHONY: all clean echo

