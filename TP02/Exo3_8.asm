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
	mov ebx, 0
	jne boucle
boucle:
	add eax, 4
	inc ebx
	cmp ebx, 6
	je fin
	jmp boucle
fin: 
	mov ecx, eax
	mov eax, msg1
	call print_string
	mov eax, ecx
	call print_int
	call print_nl
	mov ebx, 0
	mov eax, 1
	int 0x80
