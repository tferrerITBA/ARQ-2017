%include "ej3.asm"

section .text
global _start
_start:
		MOV EBP, ESP
		MOV EAX, DWORD [EBP]
		PUSH EAX
		MOV EBX, strnum
		PUSH EBX
		CALL my_func
		MOV EAX, 4
		MOV EBX, 1
		MOV ECX, strconst ; imprime "Cantidad de argumentos:"
		MOV EDX, long1
		INT 0x80
		MOV EAX, 4
		MOV EBX, 1
		MOV ECX, strnum   ; imprime la cantidad de args
		MOV EDX, strnumlen
		INT 0x80

		MOV DWORD [curr], EBP ; antes del 1er arg.

readarg:
		ADD DWORD [curr], 4 ; se mueve al siguiente argumento
		MOV EDX, DWORD [curr]
		CMP DWORD [EDX], 0  ; llegó al final?
		JE end_ej10
		MOV CL, 0
		MOV EBX, DWORD [EDX]
		MOV [arg], EBX      ; guarda el puntero al string

strlen:		
		CMP BYTE [EBX], 0
		JE printarg
		INC EBX
		INC CL
		JMP strlen

printarg:
		MOV [count], CL
		MOV EAX, 4
		MOV EBX, 1
		MOV ECX, [arg]
		MOV EDX, [count]
		INT 0x80
		MOV EAX, 4
		MOV EBX, 1
		MOV ECX, intro
		MOV EDX, 2
		INT 0x80
		JMP readarg

end_ej10:
		MOV EAX, 1
		MOV EBX, 0
		INT 0x80

section .data
		strconst db "Cantidad de argumentos recibidos: "
		long1 equ $-strconst
		strnum dd 0
		strnumlen equ $-strnum
		intro db 10, 0
		curr dd 0
section .bss
		arg resd 1
		count resb 1