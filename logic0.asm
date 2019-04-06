section .data

a db 01100001b
aa db 01100001b
b db 01100001b
z db 01111010b
l db 0xa

msg0 db "first condition", 0xa
len0 equ $-msg0
msg1 db "second condition", 0xa
len1 equ $-msg1
msg2 db "third condition", 0xa
len2 equ $-msg2x

section .bss
hasil resb 5
section .text
global _start
_start:

; mov ecx, [a]
; and ecx, [z]
; add ecx, 1
; mov [hasil], ecx
; mov ecx, hasil
; mov eax, 4
; mov ebx, 1
; mov edx, 1
; int 128
;those is working, but i want to try another things

mov eax, [b]
cmp eax, [a]
jl con1

con0:
mov eax, 4
mov ebx, 1
mov ecx, msg0
mov edx, len0
int 128
jmp lanjut

con1:
mov eax, 4
mov ebx, 1
mov ecx, msg1
mov edx, len1
int 80h
jmp lanjut

con2:
mov eax, 4
mov ebx, 1
mov ecx, msg2
mov edx, len2
int 128

lanjut:
; mov eax, 4
; mov ebx, 1
; mov ecx, l
; mov edx, 1
; int 128

mov eax, 1
mov ebx, 0
int 0x80