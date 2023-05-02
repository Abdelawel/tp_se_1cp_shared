%include "asm_io.inc"
global main
	segment .data
		msg :db "enter the value :" , 0
		msg1 :db "THE NUMBER IS PAIR !!", 0
		msg2 :db"THE NUMBER IS IMPAIR !!", 0
	segment .bss
	segment .text
main:
	mov eax, msg
	call print_string
	call read_int
	test eax,01  ; test the first bit
	jnz go      ; jump if not zero
	
	mov eax, msg1
	call print_string
	jmp exit
go:
	mov eax, msg2 
	call print_string
	jmp exit
exit:
	call print_nl
	mov ebx, 0
	mov eax, 1
	int 0x80
