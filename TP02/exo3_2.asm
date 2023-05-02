%include "asm_io.inc"
global main
	segment .data 
	segment .bss
	segment .text
main:
	mov ebx, 0
	mov eax, 0
	cmp ebx, 10
	jne boucle
boucle :
	inc ebx
	add eax, ebx 
	cmp ebx, 10
	je fin
	jmp boucle
fin:
	mov ebx, eax
	call print_int
	mov ebx, 0
	mov eax, 1
	INT 0x80
