%include "ej3.asm"

section .text
global _start
_start:
		MOV EAX, 0
		MOV EBX, n_num
		MOV ECX, k_num       ; ningun valor menor a n sera dividido por n
divisores:
		MOV EAX, ECX		
		CMP EBX, EAX     ; n > EAX (k)? si es mayor no lo divide
		JG printear
		MOV EDX, 0
		DIV EBX              ; EAX / EBX (k o menor) / n
		CMP EDX, 0
		JNE decr
		PUSH ECX
		MOV EAX, [count]
		INC EAX
		MOV [count], EAX

decr:
		DEC ECX
		JMP divisores

printear:
		MOV EDX, [count]
loop_ej5:	
		CMP EDX, 0
		JE end_ej5
		DEC EDX
		MOV [count], EDX
		PUSH cadena_ej5      ; para no popear el nro y volver a pushearlo paso directamente el str
		CALL my_func
		POP ECX              ; hago pop de cadena
		POP ECX              ; me deshago del nro orig. y paso al siguiente en la lista
		MOV EAX, 4
		MOV EBX, 1
		MOV ECX, cadena_ej5
		MOV EDX, longitud_ej5
		INT 0x80
		MOV ECX, intro
		MOV EDX, 2
		INT 0x80
		MOV EDX, [count]
		JMP loop_ej5

end_ej5:
		MOV EAX, 1
		MOV EBX, 0
		INT 0x80


section .data
		cadena_ej5 dd 0
		longitud_ej5 equ $-cadena_ej5
		n_num equ 2
		k_num equ 10
		intro db 10, 0
		count db 0

section .bss