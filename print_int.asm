section .data
char db 0
codes db "0123456789"
section .text
global _start

divide:
push rcx
;8003/100
xor rdx, rdx        ; clear dividend
;mov rax, 0x8003   ; dividend
mov rcx, 10    ; divisor
div rcx           ; rAX = 0x80, rDX = 0x3
pop rcx

;maunya quotient di rdx dan remainder rax
;sedangkan quotient ada di rax, dan remainder di rdx
push rax
push rdx
pop  rax
pop  rdx
ret            

printcharacter:
push rcx
push rdx
push rax
mov [char], rax
mov rax, 1
mov rdi, 1
mov rsi, char
mov rdx, 1
syscall
pop rax
pop rdx
pop rcx
ret
;jmp exit


_start:
; mov rax, 123
; call divide
; cmp rdx, 12
; mov rax, 97
; jz printcharacter
; jmp exit
         mov    rax, 123
         ;mov    rcx, 0        ;  digit count to produce
.loop0:
	     call   divide
         add    rax, 0x30
         call   printcharacter
         mov    rax, rdx
         cmp rax, 0
         jnz .loop0


exit:
mov rax, 60
mov rdi, 0
syscall
