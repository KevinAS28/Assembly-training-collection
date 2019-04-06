section .data
pes db "cuy: "
len0 equ $-pes

pes1 db 65, 97, 48, 0xa
len1 equ $-pes1

section .bss
msg resb 5
section .text
global _start
_start:

mov eax, 4
mov ebx, 1
mov edx, len0
mov ecx, pes
int 0x80

mov eax, 3
mov ebx, 0
mov edx, 5
mov ecx, msg
int 128

mov eax, 4
mov ebx, 1
mov edx, 5
mov ecx, msg
int 0x80

mov eax, 4
mov ebx, 1
mov ecx, pes1
add ecx, 1
mov edx, len1
int 200o

mov eax, 1
mov ebx, 0
int 0x80