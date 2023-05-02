%include "asm_io.inc"
global main
	segment .data
	msg :db" enter the first value:", 0
	msg1 :db"enter hte second value:", 0
	msg3 :db"PGCD=", 0
	segment .bss
	segment .text
	pgcd:
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
	call pgcd
	call print_int
	mov eax, 1
	mov ebx, 0
	int 0x80



