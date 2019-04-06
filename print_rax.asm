section .data
var db "0"
codes db '0123456789ABCDEF'
;codes db 'Kevin Agusto'
nwl db 0xa
section .text
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
call newline
pop rdx
pop rsi
pop rdi
pop rax
pop  rcx
ret

global _start
_start:
    ; number 1122... in hexadecimal format
    mov rax, 0x123
    mov rdi, 1
    mov rdx, 1
    mov rcx, 12
   ; Each 4 bits should be output as one hexadecimal digit
   ; Use shift and bitwise AND to isolate them
   ; the result is the offset in 'codes' array
.loop:
    push rax
    sub rcx, 4
   ; cl is a register, smallest part of rcx
   ; rax -- eax -- ax -- ah + al
   ; rcx -- ecx -- cx -- ch + cl
    sar rax, cl   ;sini
    and rax, 1111b;sini
    lea rsi, [codes + rax]; codes is what availble
    mov rax, 1
   ; syscall leaves rcx and r11 changed
    push rcx
    syscall
    pop rcx
    pop rax
   ; test can be used for the fastest 'is it a zero?' check
   ; see docs for 'test' command
    test rcx, rcx
    jnz .loop

    mov     rax, 60 ;          invoke 'exit' system call
    xor      rdi, rdi
    syscall