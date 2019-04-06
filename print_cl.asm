section .data
var db "0"
var1 db "K"
nwl db 0xa
section .text
global _start
newline:
push rax
push rdi
push rsi
push rdx
mov rax, 1
mov rdi, 1
mov rsi, nwl
mov rdx, 1
syscall
pop rdx
pop rsi
pop rdi
pop rax
ret

print_cl:
push rcx
push rax
push rdi
push rsi
push rdx

mov rcx, 00000001000000010000000100000001b
mov rax, 0b
mov al, cl
add [var], rax
mov rsi, var
mov rax, 1
mov rdi, 1
mov rdx, 1
syscall 

pop rdx
pop rsi
pop rdi
pop rax
pop	 rcx
ret

_start:
mov rax, 1
mov rdi, 1
mov rsi, var1
mov rdx, 1
call print_cl
call newline
syscall

exit:
mov rax, 60
mov rdi, 0
syscall