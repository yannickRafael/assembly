; Simple arithmetic calculator
;
; Author: Yannick Rafael(yannickRafael)

section .data
	optmsg db 'Select one operation below: ', 0xa, '1. Addition;', 0xa, '2. Subtraction', 0xa, '3. multiplication', 0xa, '4. Division',0xa, '5. Exit Program',0xa					; definfing the options prompt
	optmsgsize equ $-optmsg										; computing the size of the message


section .bss
	option resb 3											; created uninitialized variable to store option		

section .text
global _start

_start:
	mov ecx,optmsg											; passing the data(to be printer/written)address to ecx register
	mov edx,optmsgsize										; passing the data size
	mov ebx,1											; selecting the stdout file descriptor
	

	mov eax,4											; defining the system call we want: 4 is for writing
	int 80h												; invoking the sys call

	mov ecx,option											; memory address to store the inserted value
	mov edx,3											; maximum number of bytes to read
	mov ebx,0											; selecting file descriptor 0 for stdin

	mov eax,3											; selecting sys call number 3: read
	int 80h												; invoking sys call

	cmp byte [option], '1'
	je add

	cmp byte [option], '2'
	je sub

	mov eax,1											; preparing graceful program exit
	int 80h												; exiting the program gracefully

add:
	mov ebx,16
	mov eax,1
	int 80h

sub:
	mov ebx,8
        mov eax,1
        int 80h

