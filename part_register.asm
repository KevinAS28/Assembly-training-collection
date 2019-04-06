section .data

msg0 db "yes"
msg1 db "nah"

section .text
global _start

print:
mov rax, 1
mov rdi, 1
syscall
ret

y:
mov rsi, msg0
mov rdx, 3
call print
jmp exit

n:
mov rsi, msg1
mov rdx, 3
call print
jmp exit

_start:
    mov rax, 011111111b
    mov rbx, 111111111b
    cmp al, bl ;yes
    ;cmp ah, bh ;no
    je y
    jne n
    jmp exit

exit:
mov rax, 60
mov rdi, 0
syscall