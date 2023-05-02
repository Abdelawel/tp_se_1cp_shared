%include "asm_io.inc"
global main 
	segment .data
		msg : db "Bonne journee !", 0
	segment .bss
	segment  .text
main:
	mov ecx, 5
	MOV EAX, msg 
boucle:
	call print_string
	call print_nl
loop boucle

	MOV EBX, 0 
	MOV EAX, 1 
	INT 0x80
