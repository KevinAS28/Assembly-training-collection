section .data
a db "test"
la equ $-a
co0 db "condition 0", 0xa
lc0 equ $-co0
co1 db "condition 1", 0xa
lc1 equ $-co1
co2 db "condition 2", 0xa
lc2 equ $-co2

section .bss
b resb 0

section .text
global _start
_start:

jmp exit

mov eax, a
mov ebx, b
cmp eax, ebx
je c1

c0:
mov eax, 4
mov ebx, 1
mov ecx, co0
mov edx, lc0
int 0x80
jmp exit

c1:
mov eax, 4
mov ebx, 1
mov ecx, co1
mov edx, lc1
int 0x80
jmp exit

c2:
mov eax, 4
mov ebx, 1
mov ecx, co2
mov edx, lc2
int 0x80
jmp exit

exit:
mov eax, 1
mov ebx, 0
int 0x80