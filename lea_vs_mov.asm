section .data
text0 db "print('im noob')", 10
%assign len0 $-text0
text1 db "print('im very noob')", 10
len1 db $-text1
angka0 db 0x1
%define angka 1

global _start
section .text
print0:
mov rax, 1
mov rdi, 1
mov rsi, text0
mov rdx, len0
syscall
jmp exit

print1:
mov rax, 1
mov rdi, 1
mov rsi, text1
mov rdx, [len1]
syscall
jmp exit


print:
mov rax, 1
mov rdi, 1
syscall
ret

_start:
;1
; lea rbx, [text0+angka]
; mov rax, text0+angka
; ;mov rax, text0+angka is the same like this code below
; ; mov rax, text0
; ; add rax, angka

; cmp rax, rbx
; je print0
; jne print1

mov rax, 1

;okay i think, with mov, we cant directly using rax as addition
; mov rsi, text0
; add rsi, [angka0]
; add [angka0], byte 1

;but fine with lea
lea rsi, [text0+rax]
mov rdx, 1
call print
jmp exit


exit:
mov rax, 60
mov rdi, 0
syscall