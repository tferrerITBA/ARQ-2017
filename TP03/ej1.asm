;ej1
section .text
global main
extern printf

main:
		PUSH EBP
		MOV EBP, ESP
		MOV EAX, EBP
		ADD EAX, 8
		MOV ECX, DWORD [EAX] ; ECX = argc
		MOV EAX, [EAX + 4]   ; EAX = argv

argcount:
		CMP ECX, 0           ; se me acabaron los args?
		JE end
		DEC ECX
		PUSH DWORD [EAX]     ; argv[0]
		PUSH fmt
		MOV [beax], EAX      ; backup de los registros que printf cambia
		MOV [becx], ECX
		CALL printf
		MOV EAX, [beax]
		MOV ECX, [becx]
		ADD ESP, 2 * 4       ; equivale a hacer POP <reg_de_32_bits> 2 veces
		ADD EAX, 4           ; argv++ (avanzo pos del array)
		JMP argcount

end:
		MOV EAX, 0           ; return 0;
		MOV ESP, EBP
		POP EBP
		RET

section .data
		fmt db "%s", 10, 0
section .bss
		beax resd 1
		becx resd 1