	.file	"ej2.c"
	.intel_syntax noprefix
	.section	.rodata
.LC0:
	.string	"Argumento %d: %s\n"
	.text
	.globl	main
	.type	main, @function
main:
	push	ebp
	mov	ebp, esp
	and	esp, -16
	sub	esp, 32
	mov	DWORD PTR [esp+28], 0
	jmp	.L2
.L3:
	mov	eax, DWORD PTR [esp+28]
	lea	edx, [0+eax*4]
	mov	eax, DWORD PTR [ebp+12]
	add	eax, edx
	mov	eax, DWORD PTR [eax]
	mov	edx, DWORD PTR [esp+28]
	add	edx, 1
	mov	DWORD PTR [esp+8], eax
	mov	DWORD PTR [esp+4], edx
	mov	DWORD PTR [esp], OFFSET FLAT:.LC0
	call	printf
	add	DWORD PTR [esp+28], 1
.L2:
	mov	eax, DWORD PTR [esp+28]
	cmp	eax, DWORD PTR [ebp+8]
	jl	.L3
	mov	eax, 0
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
