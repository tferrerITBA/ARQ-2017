section .text
global siete
siete:
		PUSH EBP
		MOV EBP, ESP
		MOV EAX, 7
		LEAVE
		RET
