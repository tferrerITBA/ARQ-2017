%include "ej3.asm"

section .text
global _start
_start:
		MOV EBX, 3
		MOV EDX, 0
		MOV EAX, 1

factorial:
		CMP EBX, 1
		JLE print_ej6
		MUL EBX
		DEC EBX
		JMP factorial

print_ej6:
		PUSH EAX
		MOV EDX, cadena_ej6
		PUSH EDX
		CALL my_func
		MOV EAX, 4
		MOV EBX, 1
		MOV ECX, cadena_ej6
		MOV EDX, longitud_ej6
		INT 0x80
		MOV ECX, intro
		MOV EDX, 2
		INT 0x80
		MOV EAX, 1
		MOV EBX, 0
		INT 0x80

section .data
		cadena_ej6 dd 0
		longitud_ej6 equ $-cadena_ej6
		intro db 10, 0

section .bss