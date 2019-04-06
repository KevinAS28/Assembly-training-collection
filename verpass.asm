section .data
password db "123"
len0 equ $-password
success db "Password Verified", 0xa, 0xa, 0xa
len1 equ $-success
fail db "Wrong Password", 0xa
len2 equ $-fail
ask db "Enter the Password: "
len3 equ $-ask
type db "You type: "
len4 equ $-type
pass db "Password: "
len5 equ $-pass
line db "|"

section .bss
input resb 0

section .text
global _start
_start:

mov eax, 4
mov ebx, 1
mov ecx, ask
mov edx, len3
int 128

mov eax, 3
mov ebx, 0
mov ecx, input
mov edx, 4
int 128

mov ebx, input
mov edx, password
cmp ebx, edx
je suc

fai:
mov eax, 4
mov ebx, 1
mov ecx, fail
mov edx, len2
int 128
jmp exit

suc:
mov eax, 4
mov ebx, 1
mov ecx, success
mov edx, len1
int 128
jmp exit

;mov ebx, password ;ini juga bisa
; mov ebx, input
; mov [ebx], dword "ofte" ;ebx bekerja


exit:

mov eax, 4
mov ebx, 1
mov ecx, type
mov edx, len4
int 128

mov eax, 4
mov ebx, 1
mov ecx, input
mov edx, 5
int 128

mov eax, 4
mov ebx, 1
mov ecx, line
mov edx, 1
int 128

mov eax, 4
mov ebx, 1
mov ecx, pass
mov edx, len5
int 128

mov eax, 4
mov ebx, 1
mov ecx, password
mov edx, len0
int 128

mov eax, 4
mov ebx, 1
mov ecx, line
mov edx, 1
int 128

mov eax, 1
mov ebx, 0
int 0x80