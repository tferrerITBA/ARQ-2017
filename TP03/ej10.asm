section .text
global _start
_start:
		MOV EAX, 0
		CPUID
		MOV DWORD [msg], EBX
		MOV DWORD [msg + 4], EDX
		MOV DWORD [msg + 8], ECX
		MOV EAX, 4
		MOV EBX, 1
		MOV ECX, msg
		MOV EDX, longitud
		INT 0x80
		MOV EAX, 1
		MOV EBX, 0
		INT 0x80

section .data
		msg dd 0, 0, 0, 10
		longitud EQU $-msg