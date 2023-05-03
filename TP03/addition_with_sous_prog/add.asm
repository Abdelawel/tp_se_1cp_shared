%include "asm_io.inc"
global main 
	segment .data
	msg :db "enter the first number :", 0
	msg1 :db "enter the second number :", 0
	msg2 :db "the sum is :", 0
	segment .bss
		a: resd 1
		b: resd 1
	segment .text
	add:
		;push ebp
		;mov ebp, esp  
		mov ebx, [esp+4]
		add ebx, [esp+8]
		;pop ebp	
	ret
main:
	mov eax, msg
	call print_string
	call read_int
	mov dword[a], eax
	push dword[a]
	mov eax, msg1
	call print_string
	call read_int
	mov dword[b], eax
	push dword[b]
	call add

	add esp, 8
	mov eax, msg2
	call print_string
	mov eax, ebx
	call print_int
	call print_nl
	mov ebx, 0
	mov eax, 1
	int 0x80
