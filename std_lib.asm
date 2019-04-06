section .data
string db "kevin", 0
nwl db 0xa
decimal db "0123456789", 0
y db "yes", 0
n db "nop", 0
chr db 0
read db 0
ascii db 0
section .text
global _start

exit:
mov rdi, rax
mov rax, 60
syscall
ret


divideten:
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

strlen:
push rbx
mov rbx, -1
.loop0:
add rbx, 1
cmp [rax+rbx], byte 0
jnz .loop0
mov rax, rbx
pop rbx
ret

print:
push rax
push rdi
push rsi
push rdx
push rcx

mov rdi, rax
call strlen
mov rdx, rax
mov rax, 1
mov rsi, rdi
mov rdi, 1
syscall

pop rcx
pop rdx
pop rsi
pop rdi
pop rax
ret


print_chr:
push rax
push rdi
push rsi
push rdx
push rcx

mov rsi, rax
mov rdx, 1
mov rax, 1
mov rdi, 1
syscall

pop rcx
pop rdx
pop rsi
pop rdi
pop rax
ret

println:
push rax
mov rax, nwl
call print_chr
pop rax
ret

printascii:
	mov [ascii], rax
	mov rax, ascii
	call print_chr
ret

print_uint:
         ;mov    rcx, 10        ;  digit count to produce
         xor rbx, rbx
.loop0:
	    call   divideten
        inc rbx
        push rax
        mov    rax, rdx	
        cmp rax, 0
        jnz .loop0
.loop1:
		pop rax
        add rax, 0x30
        call printascii	
		dec rbx
		cmp rbx, 0
		jnz .loop1
ret


print_int:
cmp rax, 0
jge .calluint
push rax
mov rax, 45
call printascii
pop rax
; imul rax, rax, -1 ;bisa sih cuma pen lagi
mov rbx, -1
imul rax, rbx
.calluint:
call print_uint
ret

read_buff:
mov rdx, rax
push rcx
mov rax, 0
mov rdi, 0
mov rsi, read
syscall
mov rax, rsi
pop rcx
ret

cmpstr:


_start:
mov rax, 60 
mov rdx, 0 ;exit ccode
call exit