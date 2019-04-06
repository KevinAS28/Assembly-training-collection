segment .data
pesan db "a"
segment .text
global _start
print_rcx:
mov rax, 1
mov rdi, 1
mov rsi, rcx
mov rdx, 1
syscall
ret

exit:
mov rax, 60
mov rdi, 0
syscall

_start:
mov rcx, pesan
call print_rcx
call print_rcx
call exit