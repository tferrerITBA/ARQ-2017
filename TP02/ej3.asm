section .text
global _start   ;COMENTAR ESTO PARA EJECUTAR EN OTRO PROGR
_start:
		MOV EAX, 1500
		PUSH EAX
		MOV EBX, chain
		PUSH EBX
		CALL my_func
		MOV EAX, 4
		MOV EBX, 1
		MOV ECX, chain
		MOV EDX, longitud
		int 80h
		MOV EAX, 1
		MOV EBX, 0
		int 80h 

my_func:
		PUSH EBP
		MOV EBP, ESP
		AND ESP, 0Xfffffff0
		MOV EAX, [EBP+12]		; numero
		MOV EBX, [EBP+8]		; cadena
		MOV [cadena], EBX
		MOV CH, 0
		MOV EBX, 10

ciclo:
		MOV EDX, 0
		CMP EAX, 0x0
		JE str_build
		DIV EBX
		PUSH EDX
		INC CH
		JMP ciclo

str_build:
		MOV EAX, [cadena]
str_loop:
		CMP CH, 0
		JE end
		DEC CH
		POP EDX
		ADD EDX, '0'
		MOV BYTE [EAX], DL  ; como se que lo que hay en EDX es un char,uso solo la parte menos signif
		INC EAX
		JMP str_loop

end:
		MOV BYTE [EAX], 10  ; '\n'
		MOV ESP, EBP
		POP EBP
		ret

section .data
		chain DQ 0
		longitud EQU $-chain

section .bss
		cadena RESB 1