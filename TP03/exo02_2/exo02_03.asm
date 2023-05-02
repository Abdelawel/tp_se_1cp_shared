%include "asm_io.inc"
global main
	segment .data
		msg :db "enter your value..... tape -1 to finish:", 0
		msg1 :db "the values are :", 0
		msg2 :db "the sum of the all values is:", 0 
		msg3 :db "the sum of the all positive values is:", 0
	segment .bss
	segment .text
main: 
while: 
	mov eax, msg
	call print_string
	call read_int
	cmp eax, -1
	je endwhile
	push eax
	add ebx, 4
	jmp while
endwhile:
	mov eax, msg1
	call print_string
	call print_nl
do:	
	pop eax
	cmp eax, 0
	jl continue
	add edx, eax
continue:
	add ecx, eax
	call print_int 
	call print_nl
	sub ebx, 4
	cmp ebx, 0
	je fin
	jmp do
	
fin:
	mov eax, msg2
	call print_string
	mov eax, ecx
	call print_int
	call print_nl
	mov eax, msg3
	call print_string
	mov eax, edx
	call print_int
	call print_nl
	mov ebx, 0
	mov eax, 1
	int 0x80
