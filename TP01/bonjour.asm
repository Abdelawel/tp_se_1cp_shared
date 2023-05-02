global main 
	segment .data
		msg : db "Bonne journee !", 10
	segment .bss
	segment  .text
main:
	MOV EBX, 1
	MOV ECX, msg 
	MOV EDX, 15
	MOV EAX, 4
	INT 0x80
	MOV EBX, 0 
	MOV EAX, 1 
	INT 0x80
