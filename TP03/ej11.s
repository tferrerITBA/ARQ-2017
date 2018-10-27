	.file	"ej11.c"
	.intel_syntax noprefix
	.section	.rodata
.LC0:
	.string	"%d\n%d\n"
	.text
	.globl	main
	.type	main, @function
main:
	push	ebp
	mov	ebp, esp
	push	ebx
	and	esp, -16
	sub	esp, 16
	mov	DWORD PTR [esp], 1
	call	fibonacciIter
	mov	ebx, eax
	mov	DWORD PTR [esp], 1
	call	fibonacci
	mov	DWORD PTR [esp+8], ebx
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:.LC0
	call	printf
	mov	eax, 0
	mov	ebx, DWORD PTR [ebp-4]
	leave
	ret
	.size	main, .-main
	.globl	fibonacci
	.type	fibonacci, @function
fibonacci:
	push	ebp
	mov	ebp, esp
	push	ebx
	sub	esp, 20
	cmp	DWORD PTR [ebp+8], 0
	jne	.L4
	mov	eax, 0
	jmp	.L5
.L4:
	cmp	DWORD PTR [ebp+8], 1
	jne	.L6
	mov	eax, 1
	jmp	.L5
.L6:
	mov	eax, DWORD PTR [ebp+8]
	sub	eax, 2
	mov	DWORD PTR [esp], eax
	call	fibonacci
	mov	ebx, eax
	mov	eax, DWORD PTR [ebp+8]
	sub	eax, 1
	mov	DWORD PTR [esp], eax
	call	fibonacci
	add	eax, ebx
.L5:
	add	esp, 20
	pop	ebx
	pop	ebp
	ret
	.size	fibonacci, .-fibonacci
	.globl	fibonacciIter
	.type	fibonacciIter, @function
fibonacciIter:
	push	ebp
	mov	ebp, esp
	sub	esp, 16
	mov	DWORD PTR [ebp-12], 0
	mov	DWORD PTR [ebp-8], 1
	jmp	.L8
.L9:
	mov	eax, DWORD PTR [ebp-8]
	mov	edx, DWORD PTR [ebp-12]
	add	eax, edx
	mov	DWORD PTR [ebp-4], eax
	mov	eax, DWORD PTR [ebp-8]
	mov	DWORD PTR [ebp-12], eax
	mov	eax, DWORD PTR [ebp-4]
	mov	DWORD PTR [ebp-8], eax
	sub	DWORD PTR [ebp+8], 1
.L8:
	cmp	DWORD PTR [ebp+8], 0
	jne	.L9
	mov	eax, DWORD PTR [ebp-12]
	leave
	ret
	.size	fibonacciIter, .-fibonacciIter
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
