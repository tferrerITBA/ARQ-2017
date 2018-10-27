;hipotesis iter

	push ebp
	mov ebp, esp
	and esp, -16
	mov eax, 0
	push eax
	mov eax, 1
	push eax
ciclo:
	cmp dword [ebp + 8], 0
	jle end
	mov eax, dword [ebp - 4]
	add eax, dword [ebp - 8]
	push eax
	mov eax, dword [ebp - 8]
	mov dword [ebp - 4], eax
	mov eax, dword [ebp - 12]
	mov dword [ebp - 8], eax
	pop eax
	sub dword [ebp + 8], 1
	jmp ciclo
end:
	mov eax, dword [ebp - 4]
	leave
	ret
