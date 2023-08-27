#include <stdarg.h>
#include <stdio.h>
#include <stdint.h>
#include <inttypes.h>
#include <stdlib.h>
#include <dirent.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/stat.h>
#include <sys/fcntl.h>
#include <netinet/in.h>
#include <stddef.h>
#include <unistd.h>
#include <string.h>
#include <time.h>
#include <dirent.h>
#include <sys/mman.h>
#include <sys/syscall.h>
#include <orbis/libkernel.h>
#include <orbis/libSceNet.h>
#include <orbis/libSceLibcInternal.h>

#define SCE_NET_SOCKET_ABORT_FLAG_RCV_PRESERVATION 0x00000001
#define SCE_NET_SOCKET_ABORT_FLAG_SND_PRESERVATION 0x00000002
#define SCE_NET_SO_REUSEADDR 0x00000004
#define SCE_NET_ERROR_EINTR 0x80410104
#define SCE_NET_SOL_SOCKET 0xffff
#define UNUSED(x) (void)(x)

#define MNT_UPDATE 0x0000000000010000ULL

#define IP(a, b, c, d) (((a) << 0) + ((b) << 8) + ((c) << 16) + ((d) << 24))

#define PS4_IP "192.168.1.24"
#define PS4_PORT 1337

extern int netdbg_sock;

extern long f_syscall(unsigned long n, ...);

typedef int dlsym_t(int, const char*, void*);

struct payload_args
{
    dlsym_t* dlsym;
    int *rwpipe;
    int *payloadout;
};

#define debug(...) \
	do { \
		char debug_buffer[512]; \
		int size = f_sprintf(debug_buffer, ##__VA_ARGS__); \
		f_sceNetSend(netdbg_sock, debug_buffer, size, 0); \
	} while(0)

#define DEBUG(...) debug(__VA_ARGS__)
#define INFO(...) debug(__VA_ARGS__)
