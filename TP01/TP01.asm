global main
	segment .data
	segment .bss
	segment .text

main :

	MOV BX, 0
	MOV AX, 1
	INT 0x80
	
