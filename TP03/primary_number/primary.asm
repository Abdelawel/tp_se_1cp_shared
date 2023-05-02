%include "asm_io.inc"
global main
	segment .data
	msg :db"enter the value:", 0
	msg1 :db"the number is primary", 0
	msg2 :db"the number isn't primary", 0
	segment .bss
	segment .text
	primary:
		mov ebx, 2
		mov edx, 0
	loop:
		mov eax, ecx
		cmp eax, ebx
		je finyes
		div ebx
		cmp edx, 0
		je finno
		inc ebx
		mov edx, 0
		jmp loop
	finyes:
		mov eax, msg1
		call print_string
		call print_nl
		mov eax, 1
		mov ebx, 0
		int 0x80

	finno:
		mov eax, msg2
		call print_string
		call print_nl
		mov eax, 1
		mov ebx, 0
		int 0x80
	ret
	
main:
	mov eax, msg
	call print_string
	call read_int
	mov ecx, eax
	call primary
	mov eax, 1
	mov ebx, 0
	int 0x80
	


