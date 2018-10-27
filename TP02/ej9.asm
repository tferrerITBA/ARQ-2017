%include "ej3.asm"
section .text
global _start
_start:
		MOV EBP, ESP
		MOV EAX, DWORD [EBP]
		PUSH EAX
		MOV EAX, strnum
		PUSH EAX
		CALL my_func
		MOV EAX, 4
		MOV EBX, 1
		MOV ECX, strconst
		MOV EDX, long1
		INT 0x80
		MOV EAX, 4
		MOV EBX, 1
		MOV ECX, strnum
		MOV EDX, strnumlen
		INT 0x80
		MOV EAX, 1
		MOV EBX, 0
		INT 0x80

section .data
		strconst db "Cantidad de argumentos recibidos: "
		long1 equ $-strconst
		strnum dd 0
		strnumlen equ $-strnum
section .bss