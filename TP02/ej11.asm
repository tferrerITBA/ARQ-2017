section .text
global _start
_start:
		MOV EBP, ESP
		MOV EAX, DWORD [EBP]
		MOV EBX, 4
		MOV EDX, 0
		ADD EAX, 9
		MUL EBX
		MOV DWORD [str], EAX
		ADD DWORD [str], EBP
		MOV ECX, 0
		MOV EDX, DWORD [str]
		MOV EBX, DWORD [EDX]


strlen:
		CMP BYTE [EBX], 0
		JE printarg
		INC EBX
		INC ECX
		JMP strlen

printarg:
		MOV [count], ECX
		MOV EAX, 4
		MOV EBX, 1
		MOV ECX, DWORD [EDX]
		MOV EDX, DWORD [count]
		INT 0x80
		MOV EAX, 1
		MOV EBX, 0
		INT 0x80

section .data
		str: dd 1
		count: dd 1
section .bss
		
		