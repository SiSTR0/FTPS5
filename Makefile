CC      := gcc
AS      := gcc
ODIR    := build
SDIR    := source
IDIRS   := -I. -Iinclude
LDIRS   := -L. -Llib

PERSIST ?= 1

ifeq ($(PERSIST),0)
        PERSISTENT :=
else
        PERSISTENT := -DPERSISTENT
endif

CFLAGS  := $(PERSISTENT) $(IDIRS) -s -std=gnu11 -fno-builtin -fno-exceptions -fno-asynchronous-unwind-tables -nostartfiles -nostdlib -Wall -m64 -fPIC -mcmodel=small -nostartfiles
SFLAGS  := -fno-builtin -nostartfiles -nostdlib -fPIC -mcmodel=small
LFLAGS  := $(LDIRS) -Xlinker -T linker.x -Wl,--build-id=none
CFILES  := $(wildcard $(SDIR)/*.c)
SFILES  := $(wildcard $(SDIR)/*.s)
OBJS    := $(patsubst $(SDIR)/%.c, $(ODIR)/%.o, $(CFILES)) $(patsubst $(SDIR)/%.s, $(ODIR)/%.o, $(SFILES))

LIBS :=

all: ftps5-np.elf ftps5-p.elf

ftps5-np.elf: $(ODIR) $(OBJS)
	$(CC) crt0.s $(ODIR)/*.o -o $@ $(CFLAGS) $(LFLAGS) $(LIBS)

ftps5-p.elf: $(ODIR) $(OBJS)
	$(CC) crt0.s $(ODIR)/*.o -o $@ $(CFLAGS) $(LFLAGS) $(LIBS)

$(ODIR)/%.o: $(SDIR)/%.c
	$(CC) -c -o $@ $< $(CFLAGS)

$(ODIR)/%.o: $(SDIR)/%.s
	$(AS) -c -o $@ $< $(SFLAGS)

$(ODIR):
	@mkdir $@

.PHONY: clean all

clean:
	rm -f $(shell basename $(CURDIR)).elf $(TARGET) $(ODIR)/*.o
