	.file	"ej6d.c"
	.intel_syntax noprefix
	.text
	.globl	foo
	.type	foo, @function
foo:
	push	ebp
	mov	ebp, esp
	pop	ebp
	ret
	.size	foo, .-foo
	.data
	.align 4
	.type	numero.1370, @object
	.size	numero.1370, 4
numero.1370:
	.long	21
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
