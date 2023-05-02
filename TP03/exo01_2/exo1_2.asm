%include "asm_io.inc"
global main 
	segment .data
	msg : db" enter the first number :" ,0
	msg1 : db" enter the second number :" ,0
	msg2 : db" the result is :" ,0
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
	cmp ebx, 0
	je cas0
	cmp ecx, 0
	je cas0
	mov eax, ebx
	
boucle:
	add eax, ebx
loop boucle

	sub eax, ebx
	call print_int
	mov eax, 1
	mov ebx, 0
	int 0x80
cas0: 
	mov eax, 0
	call print_int 	
	mov eax, 1
	mov ebx, 0
	int 0x80
