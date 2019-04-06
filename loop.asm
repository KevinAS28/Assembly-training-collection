section .data
ps0 db "woi", 0xa
ln0 equ $-ps0
ps1 db "die", 0xa
ln1 equ $-ps1
section .text
global _start
_start:

mov ecx, 10
cuy:
mov eax, 4
mov ebx, 1
push ecx
mov ecx, ps1
mov edx, ln1
int 0x80
pop ecx
loop cuy

exit:
mov eax, 1
mov ebx, 0
int 128