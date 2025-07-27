section	.text
global _start
	
_start:
	mov eax,0x4                                                     ; uses write system call(4)
	mov ebx,1                                                       ; file descriptor for stdout(1)	
	mov ecx,msg							; memory address to the data to be written
	mov edx,len							; memory address to the lenght of the data to be written		
	
	int 0x80							; invokes a sys_call
	mov eax,0x1
	int 0x80
	

section	.data
	msg db 'Hello, world!',0xa,'I understand it, now!', 0xa
	len equ $ - msg
