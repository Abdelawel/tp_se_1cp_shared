%include "asm_io.inc"
global main
	segment .data
	msg:db"enter the value:", 0
	msg1:db"fibounacci =", 0
	segment .bss
	segment .text
	fibou:
		mov edx, 1
		mov ecx, 1

	do:
		mov eax, 0
		add eax, edx
		add eax, ecx
		dec ebx
		cmp ebx, 0
		je fin
		mov ecx, edx
		mov edx, eax
		jmp do
	fin:
	ret
		
main:
	;fibo 0=1 fibo 1=1
	mov eax, msg
	call print_string
	call read_int
	cmp eax, 1
	jle end
	call fibou
	
end:
	push eax
	mov eax, msg1
	call print_string
	call read_int
	mov edx, eax
	dec ebx
	call fibou
	push eax
	mov eax, msg1
	call print_string
	pop eax
	call print_int
	call print_nl
	mov ebx, 0
	mov eax, 1
	int  0x80
