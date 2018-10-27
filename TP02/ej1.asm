section .text
global _start
_start:
	mov edx, longitud
	mov ecx, cadena
	mov ebx, 1
	mov eax, 4
	int 80h
	mov eax, 1
	int 80h

section .data
cadena db "Hola mundo", 10, "$"
longitud equ $-cadena

section .bss
placeholder resb 20