	.file	"ej6c.c"
	.intel_syntax noprefix
	.comm	numero,4,4
	.text
	.globl	foo
	.type	foo, @function
foo:
	push	ebp
	mov	ebp, esp
	mov	DWORD PTR numero, 21
	pop	ebp
	ret
	.size	foo, .-foo
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
