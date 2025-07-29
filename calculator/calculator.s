; Simple arithmetic calculator
;
; Author: Yannick Rafael(yannickRafael)

section .data
	optmsg db 'Select one operation below: ', 0xa, '1. Addition;', 0xa					; definfing the options prompt
	optmsgsize equ $-optmsg										; computing the size of the message


section .text
global _start

_start:
	mov ecx,optmsg											; passing the data(to be printer/written)address to ecx register
	mov edx,optmsgsize										; passing the data size
	mov ebx,1											; selecting the stdout file descriptor
	

	mov eax,4											; defining the system call we want: 4 is for writing
	int 80h												; invoking the sys call

	mov eax,1											; preparing graceful program exit
	int 80h												; exiting the program gracefully
