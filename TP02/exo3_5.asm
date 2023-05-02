%include "asm_io.inc"
global main
	segment .data
		msg : db "enter the first number :", 0
		msg1 : db "enter the second number :", 0
		msg2 : db "the higher number is :", 0
	segment .bss
	segment .text
main:
	mov eax, msg
	call print_string
	call read_int
	mov ebx, eax
	mov eax, msg1
	call print_string
	call read_int
	mov edx, eax
	cmp edx, ebx
	jg boucle	; jump greater
	mov eax, msg2
	call print_string
	mov eax, ebx
	call print_int
	jmp fin
boucle:
	mov eax, msg2
	call print_string
	mov eax, edx
	call print_int
	jmp fin
fin:
	call print_nl
	mov ebx, 0
	mov eax, 1
	int 0x80
	
