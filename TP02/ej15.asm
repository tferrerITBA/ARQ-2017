section .text
global _start
_start:
		MOV DWORD [tv_sec], 2
		MOV DWORD [tv_usec], 0
		MOV EAX, 162
		MOV EBX, timeval
		MOV ECX, 0
		INT 0x80
		MOV EAX, 1
		MOV EBX, 0
		INT 0x80

section .bss
	timeval:
		tv_sec resd 1   ;Segundos
		tv_usec resd 1  ;Nanosegundos