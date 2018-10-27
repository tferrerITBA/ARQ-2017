%include "ej3.asm"
section .text
global _start
_start:
		MOV EAX, array
		MOV CL, 10

first:
		CMP CL, 0
		JE end_ej7
		MOV EBX, DWORD [EAX]   ; 1er elem del array
		MOV EDX, min           ; minimo (direccion)
		MOV DWORD [EDX], EBX   ; El 1er elemento es el presunto minimo
		DEC CL

iter:	CMP CL, 0
		JE print_ej7
		DEC CL
		ADD EAX, 4
		MOV EBX, DWORD [EAX]
		CMP EBX, DWORD [EDX]
		JG iter
		MOV [EDX], EBX
		JMP iter

print_ej7:
		PUSH DWORD [EDX]
		MOV EDX, cadena_ej7
		PUSH EDX
		CALL my_func
		MOV EAX, 4
		MOV EBX, 1
		MOV ECX, cadena_ej7
		MOV EDX, longitud_ej7
		INT 0x80
		
end_ej7:		
		MOV EAX, 1
		MOV EBX, 0
		INT 0x80

section .data
		cadena_ej7 dd 0
		longitud_ej7 equ $-cadena_ej7
		intro db 10, 0
		array dd 5, 8, 15, 3, 2, 4, 4, 5, 5, 5

section .bss
		;array resd 10
		min resd 1