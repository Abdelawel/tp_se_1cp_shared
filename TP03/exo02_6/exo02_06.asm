%include "asm_io.inc"
global main
	segment .data
	msg : db"the sum of number for 1 to 10 is :", 0
	msg1 : db"enter the value of N:", 0
	msg2 : db"the sum is :", 0
	segment .bss
	segment .text
	onetoten:
		mov ebx, 0
		mov eax, 0
	do:
		inc ebx
		add eax, ebx
		cmp ebx, 10
		jne do
		call print_int
		call print_nl
	ret
	
	onetoN:
		mov ebx, eax
	DO:
		cmp ebx, 0
		jg continue
		inc ebx
		jmp add
	continue:
		dec ebx
	add:
		add eax, ebx
		cmp ebx, 0
		jne DO
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
	call onetoten
	mov eax, msg1
	call print_string
	call read_int
	call onetoN
	mov ebx, 0
	mov eax, 1
	int 0x80
	
