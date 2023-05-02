%include "asm_io.inc"
global main
	segment .data
	segment .bss
	segment .text
main :
	call read_int
	MOV EBX, EAX
	call read_int
	ADD EAX, EBX
	call print_int 
	INT 0x80
