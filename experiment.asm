section .data
var0 db 1, 2, 0
var1 dq 0xabc, 0xd
var2 dq -1
var3 dq -2
text db "0123456789abcdef"
y db "yes"
n db "no"
section .bss
section .text
global _start


print:
push rcx
push rax
push rdi
mov rax, 1
mov rdi, 1
syscall
pop rdi
pop rax
pop rcx
ret

yes:
mov rsi, y
mov rdx, 3
call print
jmp exit
;ret

no:
mov rsi, n
mov rdx, 3
call print
jmp exit
;ret


divide:
;8003/100
mov rdx, 0        ; clear dividend
;mov rax, 0x8003   ; dividend
;mov rcx, 10    ; divisor
div rcx           ; rAX = 0x80, rDX = 0x3
ret            

_start:
;bagi nol = floating point exception
; mov rax, 4
; mov rcx, 0
; call divide
; add rax, 0x30
; mov [var3], rax
; mov rsi, var3
; mov rdx, 1
; call print
jmp exit
exit:
mov rax, 60
mov rdi, 0
syscall