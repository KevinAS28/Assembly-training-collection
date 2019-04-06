section .data
section .bss
section .text
global _start
_start:

mov cr4
mov eax, 1
mov ebx, 0
int 0x80