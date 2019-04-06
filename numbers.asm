; section .data
; sm db 9
; t db 7
; e db 6
; section .bss
; hasil resb 0
; section .text
; global _start
; _start:

; mov eax, 7
; mov ebx, 100
; and eax, ebx

; mov [hasil], eax
; add [hasil], byte "0"
; mov ecx, hasil
; mov eax, 4
; mov ebx, 1
; mov edx, 1
; int 0x80

; mov eax, 1
; mov ebx, 0
; int 0x80
;----------------------------------------------------------

; section .data
; ps0 db "hasil: "
; ln0 equ $-ps0

; section .bss
; rs0 resb 1

; section .text
; global _start
; _start:

; mov al, '9'
; sub al, '3'
; aas
; add al, 48
; mov [rs0], al

; mov eax, 4
; mov ebx, 1
; mov ecx, ps0
; mov edx, ln0
; int 0x80

; mov eax, 4
; mov ebx, 1
; mov ecx, rs0
; mov edx, 1
; int 0x80

; mov eax, 1
; mov ebx, 0
; int 0x80

section	.text
   global _start        ;must be declared for using gcc
	
_start:	                ;tell linker entry point
; sub    AH,AH    ; clear AH
; mov    ax, 39h
; add    ax, 39h
; aaa ; ini jadi 8d
; or ax, 30h
;39h = 111001
;39h+39h = 114d = 11100010
;aaa, setiap ada byte >= 10, tambah 6. dan akhirnya jadiin binary angka asli
;114+6 = 1110 1000 = 120
; byte ke 2, nilainya 8 tuh


sub    AH, AH    ; clear AH
mov    ax, "8"; 56 = 111000
add    ax, 38h; 56 = 111000
aaa ; ini jadi 6d
or ax, 3030h
;56d + 56d = 112d = 11100000
;112d + 6d = 11100110 = 116d
;byte terakhir = 0110
;or
;101 = 5
;011 = 3
;111 = 7 / 5 + (5-3)


   mov [res0], ax
   mov	ecx,msg	        ;message to write
   mov	ebx,1	        ;file descriptor (stdout)
   mov	eax,4	        ;system call number (sys_write)
   int	0x80	        ;call kernel

   mov	edx,4	        ;message length
   mov	ecx,res0	        ;message to write
   mov	ebx,1	        ;file descriptor (stdout)
   mov	eax,4	        ;system call number (sy  s_write)
   int	0x80	        ;call kernel
   
   mov	eax,1	        ;system call number (sys_exit)
   mov   ebx,0
   int	0x80	        ;call kernel

section	.data
msg db 'The Result is:',0xa
len equ $ - msg
section .bss
res0 resb 1
res1 resb 1