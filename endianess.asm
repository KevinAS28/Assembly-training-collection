section .data
demo1 dq 0x1122334455667788
demo2 db 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88
newline_char db 10
codes db '0123456789abcdef'
y db "yes"
n db "no"
section .text                       
global _start                                                            

print_demo2:
    mov rax, 1
    mov rdi, rax
    mov rdx, rdi
    mov rcx, 0
    mov r13, 64
    .loop0:
    push rcx
    mov r10, [demo2]
    sar r10, cl
    and r10, 1111b
    lea rsi, [codes+r10]
    syscall
    pop rcx
    add rcx, byte 8
    cmp rcx, r13
    jne .loop0
    ret

print_newline:
    mov rax, 1            ; 'write' syscall identifier
    mov rdi, 1            ; stdout file descriptor
    mov rsi, newline_char ; where do we take data from
    mov rdx, 1            ; the amount of bytes to write
    syscall
    ret

print_hex:
    mov rax, rdi

    mov rdi, 1                     
    mov rdx, 1                
    mov rcx, 64           ; how far are we shifting rax?      
iterate:                            
    push rax              ; Save the initial rax value
    sub rcx, 4            
    sar rax, cl           ; shift to 60, 56, 52, ... 4, 0
                          ; the cl register is the smallest part of rcx
    and rax, 0xf          ; clear all bits but the lowest four     
    lea rsi, [codes + rax]; take a hexadecimal digit character code
    
    mov rax, 1            ;      

    push rcx              ; syscall will break rcx                
    syscall               ; rax = 1 (31) -- the write identifier,
                          ; rdi = 1 for stdout, 
                          ; rsi = the address of a character, see line 29
    pop rcx                     
    
    pop rax               ; ^ see line 24 ^
    test rcx, rcx         ; rcx = 0 when all digits are shown
    jnz iterate   
    
    ret    
yes:
mov rax, 1
mov rdi, 1
mov rsi, y
mov rdx, 3
syscall 
jmp exit
no:
mov rax, 1
mov rdi, 1
mov rsi, n
mov rdx, 3
syscall 
jmp exit
_start:
    ; call print_demo2
    mov rax, [demo2]
    sar rax, 60
    and rax, 0xf
    lea rsi, [codes+rax]
    mov rax, 1
    mov rdx, 1
    mov rdi, 1
    syscall
    jmp exit

    mov rdi, [demo1]
    call print_hex
    call print_newline

    mov rdi, [demo2]
    call print_hex
    call print_newline

    mov rax, 60
    xor rdi, rdi
    
exit:    
    mov rax, 60
    mov rdi, 0
    syscall