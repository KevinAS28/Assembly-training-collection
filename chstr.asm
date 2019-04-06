section .data
msg db "Assembly+is+here", 0xa
len equ $-msg
rpl db "Just"
len1 equ $-rpl
section .bss
result resb 5

section .text
global _start
_start:

;dari syscall aja, args rw itu (char *)
;mungkin section .data itu char * //ya angka juga sih akhirnya
;general purpose register sangkaan itu kayak (void *) atau hanya angka ya, karena semua juga angka

mov ecx, rpl
mov ebx, dword [msg] ;ga usah pake size sih sebenernya.
mov ebx, [ecx]
mov [msg], ebx

mov ecx, rpl
mov ebx, [msg]
mov ebx, [ecx]
mov [msg+4], ebx

output:
mov ecx, msg
mov eax, 4
mov ebx, 1
mov edx, len
int 0x80

exit:
mov eax, 1
mov ebx, 0
int 0x80