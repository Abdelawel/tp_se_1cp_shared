%include "asm_io.inc"
global main
	segment .data
	msg :db"ENTER THE FIRST NUMBER :", 0
	msg1 :db"ENTER THE SECOND NUMBER :", 0
	msg2 :db"PGCD=", 0
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
	mov ecx, eax
	cmp ecx, 0
	je fin
	cmp ebx, 0
	je fin2
	cmp ebx, ecx
	jg boucle
	xchg ebx, ecx
	jmp boucle
boucle:
	mov edx, 0
	mov eax, ebx
	div ecx
	mov ebx, ecx
	mov ecx, edx
	cmp edx, 0
	je fin
	mov ecx, edx
	jmp boucle
fin2: 
	mov ebx, ecx
fin:
 	mov eax, msg2
 	call print_string
 	mov eax, ebx
 	call print_int
 	call print_nl
 	mov ebx, 1
 	mov eax, 0
 	int 0x80
