	.file	"ej6e2.c"
	.intel_syntax noprefix
	.globl	numero
	.data
	.align 4
	.type	numero, @object
	.size	numero, 4
numero:
	.long	21
	.text
	.globl	bar
	.type	bar, @function
bar:
	push	ebp
	mov	ebp, esp
	mov	DWORD PTR numero, 30
	pop	ebp
	ret
	.size	bar, .-bar
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
