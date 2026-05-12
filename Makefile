SRCS = $(wildcard *.asm)
ELFS = $(patsubst %.asm,%,$(SRCS))
ASSEMBLER = fasm
AFLAGS = 
BIN_DIRS = $(PWD)/bin

SUBDIRS = foo bar baz

all: $(ELFS) 

%:%.asm
	$(ASSEMBLER) $(AFLAGS) $<
	chmod +x $@
	mv $@ $(BIN_DIRS)/

clean:
	-rm -f $(BIN_DIRS)/$(ELFS)

echo: 
	@echo $(PWD)


subdirs:
	for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir; \
	done

.PHONY: all clean echo subdirs

