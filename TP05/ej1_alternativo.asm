section .text
global screen:

screen:
		mov eax, 0xB8000	 ; green characters
		mov cl, 0xF2         ; white background
		mov edx, str
loop:
		cmp BYTE [edx], 0x0
		je end
		mov bl, BYTE [edx]
		mov BYTE [eax], bl
		inc eax
		mov BYTE [eax], cl
		inc eax
		inc edx
		jmp loop
end:
		mov eax, 1
		xor ebx, ebx
		int 0x80

section .data
		str: db "Arquitecturas de computadoras"