section .data
pesan db "input: "
len equ $ - pesan
pesann db "what you type is: "

lenn equ $ - pesann
section .bss
angka db 5

section .text
global _start

_start:

;print text
mov eax, 4
mov ebx, 1
mov ecx, pesan
mov edx, len
int 0x80

;input
mov eax, 3
mov ebx, 0
mov ecx, angka
mov edx, 5
int 0x80

;print text
mov eax, 4
mov ebx, 1
mov ecx, pesann
mov edx, lenn
int 0x80

;print text
mov eax, 4
mov ebx, 1
mov ecx, angka
mov edx, 10
int 0x80

exit:

mov eax, 1 ;panggil sys call exit
mov ebx, 0 ;return code 0 - its fine
;int 0x80
int 10000000b
