%include "asm_io.inc"
global main 
	segment .data
	msg :db"enter the value :", 0
	msg1:db"Factoriele: ", 0
	segment .bss
	segment .text
	fact:
		mov ebx, eax
		dec ebx
	do:
		mul ebx
		cmp ebx, 1
		je fin
		dec ebx
		jmp do
	fin: 
	ret
		
main:
	mov eax, msg
	call print_string
	call read_int
	call fact
	push eax
	mov eax, msg1
	call print_string
	pop eax
	call print_int
	call print_nl
	mov ebx, 0
	mov eax, 1
	int 0x80
	
	
