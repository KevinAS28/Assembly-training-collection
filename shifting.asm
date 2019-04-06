section .data
num db 4
num1 db 1001b
codes db '0123456789ABCDEF'

section .text
global _start
_start:

; sar byte [num1], 001b
; mov rax, 1
; mov rdi, 1
; add [num1], byte 48
; mov rsi, num1
; mov rdx, 6
; syscall
mov rax, 0x1122334455667788
sar rax, 60
and rax, 0xf
mov [codes], rax
add [codes], byte 48
mov rsi, codes
;lea rsi, [codes+rax]
mov rax, 1
mov rdi, 1
mov rdx, 1
syscall

exit:
mov rax, 60
mov rdi, 0
syscall