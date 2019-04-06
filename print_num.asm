section .data
dataa db '0123456789'
angka db 123 ;01111011

section .text
global _start
_start:
mov rax, 1
mov rdx, rax
mov rdi, rdx
mov rcx, [128]
lea rsi, [dataa+rcx]
syscall

mov rax, 60
mov rdi, 0
syscall