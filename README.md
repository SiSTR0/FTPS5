# FTPS5
FTP server for PS5 Webkit.

# Building

Run `make`. Requires GCC or Clang to be installed.

# Custom commands:

- MTRW: Remount /system and /system_ex partitions with read-write access

## Known issue
Forking webkit process causes a kernel panic when the console is shut down.

Build with `make PERSIST=0` to avoid it but persistence will be lost.

## Credits:

- [xerpi](https://github.com/xerpi): Original source
- [bigboss](https://github.com/psxdev): Source improvement
- [ChendoChap](https://github.com/ChendoChap): Fixing loader
- [SpecterDev](https://github.com/Cryptogenic): Fixing code
- [SiSTRo](https://github.com/SiSTR0): Fixing code
- [John Törnblom](https://github.com/john-tornblom): Syscall check bypass trick
