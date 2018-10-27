	.file	"ej6f.c"
	.intel_syntax noprefix
	.data
	.align 4
	.type	numero, @object
	.size	numero, 4
numero:
	.long	10
	.text
	.globl	foo
	.type	foo, @function
foo:
	push	ebp
	mov	ebp, esp
	mov	DWORD PTR numero, 20
	pop	ebp
	ret
	.size	foo, .-foo
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
