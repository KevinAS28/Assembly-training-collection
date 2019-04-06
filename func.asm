	.file	"func.c"
	.text
	.globl	fintma
	.type	fintma, @function
fintma:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movss	%xmm0, -8(%rbp)
	movsd	%xmm1, -16(%rbp)
	movq	%rsi, -24(%rbp)
	cvtsi2ss	-4(%rbp), %xmm0
	addss	-8(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movapd	%xmm0, %xmm1
	addsd	-16(%rbp), %xmm1
	cvtsi2sdq	-24(%rbp), %xmm0
	addsd	%xmm1, %xmm0
	cvttsd2si	%xmm0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	fintma, .-fintma
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movsd	.LC0(%rip), %xmm0
	movl	$4, %esi
	movapd	%xmm0, %xmm1
	movss	.LC1(%rip), %xmm0
	movl	$1, %edi
	call	fintma
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1074266112
	.align 4
.LC1:
	.long	1073741824
	.ident	"GCC: (Debian 8.2.0-9) 8.2.0"
	.section	.note.GNU-stack,"",@progbits
