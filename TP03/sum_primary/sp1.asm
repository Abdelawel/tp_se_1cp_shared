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
			mov ebx, 2
			mov edx, 0
		loop:
			mov eax, dword[a]
			cmp eax, ebx
			je yes
			div ebx
			cmp edx, 0
			je fin
			inc ebx
			mov edx, 0
			jmp loop
		yes:
			push eax
			inc ecx
			jmp fin
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
	mov eax, dword[a]
	push eax
boucle:	
	call primary
	mov eax, dword[a]
	inc eax
	mov dword[a], eax
	cmp eax, dword[b]
	je end
	jmp boucle
end:
	
	mov eax, msg2
	call print_string
	mov eax, 0
	mov ebx, eax
do:
	pop eax
	add ebx, eax
	dec ecx
	cmp ecx, 0
	je last
	jmp do
last:
	mov eax, ebx
	call print_int
	mov ebx, 0
	mov eax, 1
	int  0x80
	
