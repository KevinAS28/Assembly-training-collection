section .data
char db 0
codes db "0123456789"
section .text
global _start

divide:
;8003/100
mov rdx, 0        ; clear dividend
;mov rax, 0x8003   ; dividend
mov rcx, 10    ; divisor
div rcx           ; rAX = 0x80, rDX = 0x3
ret            

printcharacter:
push rcx
mov [char], rax
mov rax, 1
mov rdi, 1
mov rsi, char
mov rdx, 1
syscall
pop rcx
ret

_start:

exit:
mov rax, 60
mov rdi, 0
syscall