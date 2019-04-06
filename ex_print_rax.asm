section .data
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
ret

no:
mov rsi, n
mov rdx, 3
call print
ret

;11011111110 1790
;   10110011 179
;      10001 17
;          1 1s

;100 + 700 + 90 + 0
;1790 - 90 = 1
_start:
mov rax, 10101010b ;1790
lea rsi, [text+rax]
mov rdx, 1
call print
jmp exit

exit:
mov rax, 60
mov rdi, 0
syscall