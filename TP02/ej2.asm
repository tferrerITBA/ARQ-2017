section .text
global _start
_start:
		mov EBX, cadena     ; EBX points at the beginning of cadena

inicio:	
		mov CL, BYTE [EBX]  ; move the character (1 byte) to CL
		cmp CL, 0x0         ; end of string?
		je end              ; yes --> end
		cmp CL, aMin        ; character < 'a'?
		jl loop             ; yes --> do nothing
		cmp CL, zMin        ; character > 'z'?
		jg loop             ; yes --> do nothing
		sub CL, 32          ; convert to upper case
		mov BYTE [EBX], CL  ; replace original character

loop:	
		add EBX, 0x1        ; goto: next character
		jmp inicio          ; start all over again

end:	
		mov EDX, longitud   ; strlen
		mov ECX, cadena     ; string address
		mov EBX, 1          ; stdout
		mov EAX, 4          ; write
		int 80h             ; SYSCALL
		mov EAX, 1          ; exit
		mov EBX, 0          ; return value
		int 80h             ; SYSCALL

section .data
	cadena db "h4ppy c0d1ng", 10
	longitud equ $-cadena   ; strlen
	aMin equ 0x61           ; 'a'
	zMin equ 0x7A           ; 'z'

section .bss
	placeholder resb 20
