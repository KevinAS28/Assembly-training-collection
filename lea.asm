	.file	"lea.c"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$10, -40(%rbp)
	movl	$20, -36(%rbp)
	movl	$30, -48(%rbp)
	movl	$40, -44(%rbp)
	movl	$0, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	movl	-28(%rbp,%rax,8), %eax
	movl	%eax, -8(%rbp)
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Debian 8.2.0-9) 8.2.0"
	.section	.note.GNU-stack,"",@progbits
