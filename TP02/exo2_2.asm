%include "asm_io.inc"
global main
	
	segment .data
	msg1 : db "Enter the first number :", 0
	msg2 : db "Enter the second number :", 0
	msg3 : db "the result is :", 0
	segment .bss
	segment .text
main:
	mov eax, msg1
	call print_string
	call read_int
	mov ebx, eax
	mov eax, msg2
	call print_string
	call read_int
	add ebx, eax
	mov eax, msg3
	call print_string
	mov eax, ecx
	call print_int
	call print_nl ;\n
	mov ebx, 0
	mov eax, 1
	INT 0x80
