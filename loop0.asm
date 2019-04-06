section .data
batas db 24
mulai db '0'

sys equ 4
FDO equ 1
%define yay "kevin"
msg db "sys_call"
lenmsg equ $-msg
newline db 0xa

section .bss
section .text
global _start

tes:
mov eax, 4
mov ebx, 1
mov ecx, mulai
mov edx, 1
int 128

mov eax, 4
mov ebx, 1
mov ecx, msg
mov edx, lenmsg
int 0x80

jmp exit

_start:
ulang:
cmp [mulai], byte '0'
;add [mulai], byte 1
je tes

exit:
mov eax, 1
mov ebx, 0
int 0x80