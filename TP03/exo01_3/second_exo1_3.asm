%include "asm_io.inc"
global main
	segment .data
	msg :db "enter the x's value :", 0
	msg1 :db "enter the n's value :", 0
	segment .bss 
	r :resd 1
	segment .text
main:
	mov dword[r], 0
	mov eax, msg
	call print_string
	call read_int
	mov ebx, eax
	mov eax, msg1
	call print_string
	call read_int
	mov ecx, eax
	
while:
	cmp ecx, 0
	je endwhile
	add dword[r] ,ebx
	mov eax, ecx
	sub eax, 1
	mov ecx, eax
	jmp while
	
endwhile:
	mov eax, dword[r]
	call print_int
	call print_nl
	mov ebx, 0
	mov eax, 1
	int 0x80
