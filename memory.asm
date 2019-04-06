section .data
arr db 97, 98, 99, 0xa


section .text
global _start
_start:

mov eax, 4
mov ebx, 1
mov ecx, arr
mov edx, 4
int 0x80

keluar:
mov eax, 1
mov ebx, 0
int 10000000b
