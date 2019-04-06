section	.text
global _start     ;must be declared for linker (ld)
	
_start:	            ;tells linker entry point
   mov	edx,11      ;message length

   mov	ecx,msg     ;message to write
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel

   mov	eax,1       ;system call number (sys_exit)
   int	0x80        ;call kernel

section	.data
msg db 48, 52, 32, 48, 56, 32, 50, 48, 48, 49, 0Ah  ;string to be printed
len equ $ - msg     ;length of the string