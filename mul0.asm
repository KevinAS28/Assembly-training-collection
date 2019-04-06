section .data
ang0 db "First Number: "
lena0 equ $-ang0
ang1 db "Second Number: "
lena1 equ $-ang1
has db "Result: "
hasa equ $-has
line db 0xa
section .bss
fn resb 5
sn resb 5
res resb 5

section .text
global _start
_start:

mov eax, 4
mov ebx, 1
mov ecx, ang0
mov edx, lena0
int 128

mov eax, 3
mov ebx, 0
mov ecx, fn
mov edx, 2
int 200o

mov eax, 4
mov ebx, 1
mov ecx, 0xa
mov edx, 1
int 128

mov eax, 4
mov ebx, 1
mov ecx, ang1
mov edx, lena1
int 128

mov eax, 3
mov ebx, 0
mov ecx, sn
mov edx, 2
int 200o

mov eax, 4
mov ebx, 1
mov ecx, has
mov edx, hasa
int 128

;kenapa fn dan sn pake kotak?
;karena fn kan (const char *), pingin dikali
;ya konvert dulu ke angka biasa. 
;const char * x = "abcd"
;printf("%d\n", *x);

mov eax, [fn]
sub eax, "0"
mov ebx, [sn]
sub ebx, "0"
mul ebx
add eax, "0"
mov [res], eax

mov eax, 4
mov ebx, 1
mov ecx, res 
mov edx, 1
int 128

mov eax, 4
mov ebx, 1
mov ecx, line
mov edx, 1
int 128

mov eax, 1
mov ebx, 0
int 128