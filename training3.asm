section .data
string db "kevin agusto"
len equ $-string

section .bss

section .text
global _start
_start:

mov eax, 4
mov ebx, 1
mov ecx, string
mov edx, len
int 0x80

mov eax, 0x01
mov ebx, 0x0
int 200o