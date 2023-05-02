%include "asm_io.inc"
global main
	segment .data
		msg :db "ENTER THE VALUE :", 0
		msg1 :db"THE RESULT IS :", 0
	segment .bss
	segment .text
main:
	mov eax, msg
	call print_string
	call read_int
	cmp eax, 3
	jg boucle
	jmp fin
boucle:
	sub eax, 1
	cmp eax, 3
	jg boucle
	jmp fin
fin:
	mov ebx , eax
	mov eax, msg1
	call print_string
	mov eax, ebx
	call print_int
	call print_nl
	mov ebx, 0
	mov eax, 1
	int 0x80
	
