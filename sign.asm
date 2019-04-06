section .data
num db 4
num1 db 10000001b
msg0 db "cf is 1", 0xa
msg1 db "cf is 0", 0xa
num2 db $-msg1
section .text
global _start

proofing cf
sign:
mov rax, 1
mov rdi, 1
mov rsi, msg0
mov rdx, [num2]
syscall
jmp exit

unsign:
mov rax, 1
mov rdi, 1
mov rsi, msg1
mov rdx, [num2]
syscall
jmp exit

exit:
mov rax, 60
mov rdi, 0
syscall

_start:
mov eax, 1
sub eax, 2
js sign
jns unsign

