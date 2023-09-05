CC      := gcc-9
AS      := gcc-9
ODIR    := build
SDIR    := source
IDIRS   := -I. -Iinclude
LDIRS   := -L. -Llib

ifeq ($(PERSIST),0)
        PERSISTENT :=
        TARGET = ftps5-np.elf
else
        PERSISTENT := -DPERSISTENT
        TARGET = ftps5-p.elf
endif

CFLAGS  := $(PERSISTENT) $(IDIRS) -s -std=gnu11 -fno-builtin -fno-exceptions -fno-asynchronous-unwind-tables -nostartfiles -nostdlib -Wall -m64 -fPIC -mcmodel=small -nostartfiles
SFLAGS  := -fno-builtin -nostartfiles -nostdlib -fPIC -mcmodel=small
LFLAGS  := $(LDIRS) -Xlinker -T linker.x -Wl,--build-id=none
CFILES  := $(wildcard $(SDIR)/*.c)
SFILES  := $(wildcard $(SDIR)/*.s)
OBJS    := $(patsubst $(SDIR)/%.c, $(ODIR)/%.o, $(CFILES)) $(patsubst $(SDIR)/%.s, $(ODIR)/%.o, $(SFILES))

LIBS :=

$(TARGET): $(ODIR) $(OBJS)
	$(CC) crt0.s $(ODIR)/*.o -o $(TARGET) $(CFLAGS) $(LFLAGS) $(LIBS)

$(ODIR)/%.o: $(SDIR)/%.c
	$(CC) -c -o $@ $< $(CFLAGS)

$(ODIR)/%.o: $(SDIR)/%.s
	$(AS) -c -o $@ $< $(SFLAGS)

$(ODIR):
	@mkdir $@

.PHONY: clean all

clean:
	rm -f ./*.elf $(ODIR)/*.o
