section .data
a0 db "55"
coy equ $-a0
a1 db "44"
ccoy equ $-a1
section .bss
res resb 0
section .text
global _start
_start:
sub ah, ah
mov ax, [a0]
add ax, [a1]
aaa
or ax, 3030h
mov [res], ax

mov ecx, res
mov eax, 4
mov ebx, 1
mov edx, 3
int 0x80

exit:
mov eax, 1
mov ebx, 0
int 0x80