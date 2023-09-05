# FTPS5
FTP server for [PS5-IPV6-Kernel-Exploit](https://github.com/Cryptogenic/PS5-IPV6-Kernel-Exploit): Original source

# Supported Firmares
3.00, 3.10, 3.20, 3.21, 4.00, 4.02, 4.03, 4.50, 4.51

# Building
- Needs gcc 9 installed.
- Use ./build.sh To build Both
- Use make To Build ftps5-p.elf

# Custom commands:

- MTRW: Remount /system and /system_ex partitions with read-write access

## Known issue
Forking webkit process causes a kernel panic when the console is shut down.

Use FTPS5-NP.elf to avoid it but persistence will be lost.

## Credits:

- [xerpi](https://github.com/xerpi): Original source
- [bigboss](https://github.com/psxdev): Source improvement
- [ChendoChap](https://github.com/ChendoChap): Fixing loader
- [SpecterDev](https://github.com/Cryptogenic): Fixing code
- [SiSTRo](https://github.com/SiSTR0): Fixing code
- [John Törnblom](https://github.com/john-tornblom): Syscall check bypass trick
