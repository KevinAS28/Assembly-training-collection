
section .data
msg db "kevin agusto"
len equ $-msg

section .text
global _start

testt:
mov eax, 4
mov ebx, 1
mov ecx, msg
mov edx, len
int 0x80
ret

_start:

jmp testt
jmp exit

exit:
mov eax, 1
mov ebx, 0
int 0x80


