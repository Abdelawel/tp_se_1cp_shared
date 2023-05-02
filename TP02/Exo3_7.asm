%include "asm_io.inc"
global main
	segment .data
		msg :db "ENTER THE VALUE :", 0
	segment .bss
	segment .text
main:
	mov eax, msg
	call print_string
	call read_int
	mov ebx, eax
	cmp ebx, 3
	jnp else
	mov eax, ebx
	add eax, 2
	jmp exit	
else:
	mov eax, ebx
	sub eax,2
	jmp exit
exit:
	call print_int
	call print_nl
	mov ebx, 0
	mov eax, 1
	int 0x80
