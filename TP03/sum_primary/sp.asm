%include "asm_io.inc"
global main
	segment .data
	msg: db"enter the first value:", 0
	msg1: db"enter the second number:", 0
	msg2: db"sum=", 0
	segment .bss
		a: resd 1
		b: resd 1
	segment .text
		primary:
			mov ecx, 0
			mov ebx, 2
			mov edx, 0
			jmp while
		loop:
			inc eax
			mov dword[a], eax
			;inc eax
			;push eax
			mov ebx, 2
			mov edx, 0
		while:
			mov eax, dword[a]
			cmp eax, ebx
			je yes
			div ebx
			cmp edx, 0
			je non
			inc ebx
			mov edx, 0
			jmp while
		yes: 
			push eax
			add ecx, 4
			cmp eax, dword[b]
			je fin 
			jmp loop
		non:

			cmp eax, dword[b]
			je fin 
			jmp loop
		fin:
		ret
			
main:	
	mov eax, msg
	call print_string
	call read_int 
	mov dword[a], eax
	mov eax, msg1
	call print_string
	call read_int 
	mov dword[b], eax
;	cmp ebx, eax
;	jl do
;	xchg ebx, eax	
do:
	
	mov dword[a], ebx
	mov dword[b], eax
	call primary
	mov edx, 0
boucle: 
	pop eax
	add edx, eax
	sub ecx, 4
	cmp ecx, 0
	je end
	jmp boucle	
end:

	mov eax, edx
	call print_int
	mov ebx, 0
	mov eax, 1
	int 0x80
