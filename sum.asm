section .data
msg0 db "kevin"
msg1 db "agusto"
section .bss
addr0 resd 1
section .text
global _start

tes0:
mov eax, 4
mov ebx, 1
mov ecx, msg0
mov edx, 5
int 0x80

tes1:
mov eax, 4
mov ebx, 1
mov ecx, msg1
mov edx, 10
int 0x80

exit:
mov eax, 1
mov ebx, 0
int 0x80
;syscall

_start:
jmp exit