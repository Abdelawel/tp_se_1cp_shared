%include "asm_io.inc"
global main
	segment .data
		msg : db "Somme-nous Samedi? (1/0)", 0
		msg1 : db "Bonne week-end", 0
		msg2 : db "bonne journées", 0
	segment .bss
	segment .text
main:
	mov eax, msg
	call print_string
	call read_int
	cmp eax, 1
	je boucle
	mov eax, msg2
	call print_string
	jmp fin
boucle:
	mov eax, msg1
	call print_string
	jmp fin
fin:
	mov ebx, 0
	mov eax, 1
	int 0x80
