%include "asm_io.inc"
global main
	segment .data
	msg :db"enter the first value:", 0
	msg1 :db"enter hte second value:", 0
	msg3 :db"PPCM=", 0
	segment .bss
	segment .text
	ppcm:
			push eax
			push ebx
		check:
			cmp eax, ebx
			jg loop
			je fin
			xchg eax, ebx
		loop:
			sub eax, ebx
			cmp eax, 0
			jne check
		fin:
			mov ecx, eax
			pop ebx
			pop eax
			mul ebx
			div ecx
	ret
main:
	mov eax, msg
	call print_string
	call read_int
	mov ebx, eax
	mov eax, msg1
	call print_string
	call read_int
	push eax
	mov eax, msg3
	call print_string
	pop eax
	cmp eax, ebx
	jg do
	xchg eax, ebx
do:
	call ppcm
	call print_int
	call print_nl
	mov eax, 1
	mov ebx, 0
	int 0x80
