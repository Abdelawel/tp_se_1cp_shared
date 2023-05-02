%include "asm_io.inc"
global main
	segment .text
	segment .bss
	segment .data
main :
	MOV EAX, 5
	ADD EAX, 1
	call print_int
	MOV EBX, 0
	MOV EAX, 1
	INT 0x80
