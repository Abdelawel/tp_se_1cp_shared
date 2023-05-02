%include "asm_io.inc"
global main
	segment .data
	msg: db "enter the first value:", 0
	msg1: db "enter the second value:", 0
	msg2: db "the diffenrece is:", 0
	segment .bss
		a: resd 1
		b: resd 1
	segment .text
	difference: 
		push ebp
		mov ebp, esp
		mov eax, [ebp+8]
		sub eax, [ebp+12]
		pop ebp
	ret
main:
	mov eax, msg
	call print_string
	call read_int
	mov ebx, eax
	mov eax, msg1
	call print_string
	call read_int
	mov ecx, eax
	cmp ebx, ecx
	jg do
	xchg ecx, ebx
do:

	push ecx
	push ebx
	call difference
	add esp, 8
	push eax
	mov eax, msg2
	call print_string
	pop eax
	call print_int
	call print_nl
	mov ebx, 0
	mov eax, 1
	int 0x80
	
	
