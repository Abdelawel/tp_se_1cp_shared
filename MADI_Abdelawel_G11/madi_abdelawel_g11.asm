%include "asm_io.inc"
global main
	segment .data
	msg: db" how much do you want to have values:", 0
	msg1: db" enter the value:", 0
	msg2 :db" the number of positive values are:", 0
	msg3 :db" the position of the last positive value is:" ,0
	msg4 :db" plz enter a positive number!!", 0
	segment .bss
	segment .text
main:
	mov eax, msg 
	call print_string
	call read_int
	cmp eax, 0
	jg cont
	mov eax, msg4
	call print_string
	call print_nl
	jmp main
cont:
	mov edx, eax
	mov ecx, 0
boucle:	
	mov eax, msg1
	call print_string
	call read_int
	cmp eax, 0
	jl do
	inc ebx
	inc ecx
	push ecx
	jmp fin
do:	
	inc ecx
	jmp fin
fin:
	dec edx
	cmp edx, 0
	je end
	jmp boucle
end:
	mov eax, msg2
	call print_string
	mov eax, ebx
	call print_int
	call print_nl
	mov eax, msg3
	call print_string
	pop eax
	cmp ebx, 0
	jne continue
	mov eax, 0
continue:
	call print_int
	call print_nl
	mov ebx, 0
	mov eax, 1
	int 0x80
	
