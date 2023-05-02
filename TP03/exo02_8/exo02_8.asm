%include "asm_io.inc"
global main
	segment .data
	msg :db "enter the value of P:", 0
	msg1:db "enter the value of Q:", 0
	msg2: db" the result is:", 0
	segment .bss
	segment .text
	sum:
	do:
		cmp ebx, ecx
		je fin
		add eax, ebx
		inc ebx
		jmp do		
	fin:
		push eax
		mov eax, msg2
		call print_string
		pop eax
		call print_int
		call print_nl
	ret
	
main:
	mov eax, msg
	call print_string
	call read_int
	push eax
	mov eax, msg1
	call print_string
	call read_int
	mov ebx, eax
	pop eax
change: 
	xchg eax, ebx
	cmp eax, ebx
	jl change
	mov ecx, eax
	call sum
	mov ebx, 0
	mov eax, 1
	int 0x80
	
