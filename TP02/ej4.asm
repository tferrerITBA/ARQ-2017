%include "ej3.asm"
; HAY QUE COMENTAR "global _start" Y "_start:" EN EJ3.ASM
section .text
global _start
_start:
		MOV EAX, 0
		MOV EBX, 0

ciclo_ej4:
		CMP EAX, input
		JE end_ej4
		INC EAX
		ADD EBX, EAX
		JMP ciclo_ej4

end_ej4:
		PUSH EBX
		MOV EAX, cadena_ej4
		PUSH EAX
		CALL my_func
		MOV EAX, 4
		MOV EBX, 1
		MOV ECX, cadena_ej4
		MOV EDX, longitud_ej4
		int 80h
		MOV EAX, 1
		MOV EBX, 0
		int 80h

section .data
		input equ 6
		cadena_ej4 dw 0
		longitud_ej4 equ $-cadena_ej4

section .bss