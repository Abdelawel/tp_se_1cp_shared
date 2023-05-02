%include "asm_io.inc"
global main
	segment .data
	msg :db "enter b's value:", 0
	msg1 :db "enter a's value:", 0
	msg2 :db" the result is :", 0
	segment .bss
		res :resd 1
	segment .text
main:
	mov dword[res], 0
	mov eax, msg
	call print_string
	call read_int
	mov ebx, eax
	mov eax, msg1
	call print_string
	call read_int
	mov ecx, eax
while:
	cmp ebx, 0
	je endwhile
	mov eax, ebx
	push ebx
	mov ebx, 2
	div ebx
	pop ebx
	cmp edx, 1
	jne do
	add [res], ecx
do: 	
	mov eax, ecx
	mov ecx, 2
	mul ecx
	mov ecx, eax
	mov eax, ebx
	mov ebx, 2
	div ebx
	mov ebx, eax
	jmp while
endwhile:
	mov eax, msg2
	call print_string
	mov eax, dword[res]	
	call print_int
	call print_nl
	mov ebx, 0
	mov eax, 1
	int 0x80
