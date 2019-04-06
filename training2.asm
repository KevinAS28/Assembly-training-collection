section .bss
tampungan resb 5

section .data

msg db "kevin agusto = "

zzz db "Computer", 0xa
%assign length $-msg



MY_TABLE TIMES 10 DW 0  ; Allocates 10 words (2 bytes) each initialized to 0

test0 equ 10
test1 equ 20

STDOUT equ 1
STDIN equ 0

SYSWRITE equ 4
SYSREAD equ 3

%assign SYS_EXIT 1
%assign test2 200

section .text

global _start

_start:

mov eax, 4
mov ebx, 1
mov ecx, msg
mov edx, length
int 0x80

mov eax, 1
mov ebx, 0
int 0x80