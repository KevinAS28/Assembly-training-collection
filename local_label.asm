segment .text
global _start
.local:
mov rax, 1
mov rdi, 1
mov 
_start:

exit:
mov rax, 60
mov rdi, 0
syscall