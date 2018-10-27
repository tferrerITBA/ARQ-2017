%include "ej3b.asm"

section .text
global _start
_start:
		MOV EBP, ESP
		MOV EAX, DWORD [EBP]
		MOV EBX, 4
		MOV EDX, 0
		ADD EAX, 1
		MUL EBX
		MOV DWORD [str], EAX
		ADD DWORD [str], EBP
		MOV ECX, 0
		MOV EDX, DWORD [str]
		MOV EBX, DWORD [EDX]
		MOV EAX, EBP
		ADD EAX, 4

strlen:
		INC ECX
		CMP BYTE [EBX], 0
		JE decrease
		INC EBX
		JMP strlen

decrease:
		SUB EDX, 4
		CMP EAX, EDX
		JE print
		MOV EBX, DWORD [EDX]
		JMP strlen


print:
		MOV DWORD [count], ECX
		MOV EAX, DWORD [num]
		;falta saber cuantos numeros son 
		PUSH ECX
		PUSH EAX
		CALL my_func

		MOV EBX, DWORD [num]
		MOV ECX, 0


strlength:
		CMP BYTE [EBX], 0
		JE printf
		INC EBX
		INC ECX
		JMP strlength


printf:
		MOV EAX, 4
		MOV EBX, 1
		MOV ECX, DWORD [num]
		MOV EDX, DWORD [count]
		INT 0x80
		MOV EAX, 1
		MOV EBX, 0
		INT 0x80

section .data
		str: dd 1
		count: dd 1
		num: dq 0
section .bss
		
		