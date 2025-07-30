; Simple arithmetic calculator 
; 
; Author: Yannick Rafael(yannickRafael) 
 
section .data 
        optmsg db 'Select one operation below: ', 0xa, '1. Addition;', 0xa, '2. Subtraction', 0xa, '3. multiplication', 0xa, '4. Division',0xa, '5. Exit Program',0xa                                   ; definfing the options prompt 
        optmsgsize equ $-optmsg                                                                         ; computing the size of the message 
        num1msg db 'Insert the 1st value: ',0xa 
        num1size equ $-num1msg 
        num2msg db 'Insert the 2nd value: ',0xa
        num2size equ $-num2msg

section .bss
        option resb 1                                                                                   ; created uninitialized variable to store option                
        num1 resb 1                                                                                     ; variable to store 1st value
        num2 resb 1                                                                                     ; variable to store 1st value
	result resb 1
 

section .text
global _start

_start:
        mov ecx,optmsg                                                                                  ; passing the data(to be printer/written)address to ecx register
        mov edx,optmsgsize                                                                              ; passing the data size
        mov ebx,1                                                                                       ; selecting the stdout file descriptor
        mov eax,4                                                                                       ; defining the system call we want: 4 is for writing
        int 80h                                                                                         ; invoking the sys call

        mov ecx,option                                                                                  ; memory address to store the inserted value
        mov edx,2                                                                                       ; maximum number of bytes to read
        mov ebx,0                                                                                       ; selecting file descriptor 0 for stdin
        mov eax,3                                                                                       ; selecting sys call number 3: read
        int 80h                                                                                         ; invoking sys call
	
        mov ecx,num1msg                                                                                 ; passing the data(to be printer/written)address to ecx register
        mov edx,num1size                                                                                ; passing the data size
        mov ebx,1                                                                                       ; selecting the stdout file descriptor
        mov eax,4                                                                                       ; defining the system call we want: 4 is for writing
        int 80h                                                                                         ; invoking the sys call
	
        mov ecx,num1                                                                                    ; memory address to store the inserted value
        mov edx,2                                                                                       ; maximum number of bytes to read
        mov ebx,0                                                                                       ; selecting file descriptor 0 for stdin
        mov eax,3                                                                                       ; selecting sys call number 3: read
        int 80h                                                                                         ; invoking sys call

	
        mov ecx,num2msg                                                                                 ; passing the data(to be printer/written)address to ecx register
        mov edx,num2size                                                                                ; passing the data size
        mov ebx,1                                                                                       ; selecting the stdout file descriptor
        mov eax,4                                                                                       ; defining the system call we want: 4 is for writing
        int 80h                                                                                         ; invoking the sys call
	
        mov ecx,num2                                                                                    ; memory address to store the inserted value
        mov edx,2                                                                                       ; maximum number of bytes to read
        mov ebx,0                                                                                       ; selecting file descriptor 0 for stdin
        mov eax,3                                                                                       ; selecting sys call number 3: read
        int 80h                                                                                         ; invoking sys call
	
	
	movzx eax, byte [option]

	cmp eax, '1'
	je add
	
	cmp eax, '2'
	je sub

	cmp eax, '3'
	je mul
	
	cmp eax, '4'
	je div

	cmp eax, '5'
	je quit


add:
	movzx eax, byte[num1]
	sub eax,'0'

	movzx ebx, byte[num2]
	sub ebx, '0'

	add eax,ebx

	add eax, '0'
	mov [result], al

	mov eax, 4
	mov ebx, 1
	mov ecx, result
	mov edx, 1
	int 0x80
	
	mov eax,1
	int 80h


sub:
	movzx eax, byte[num1]
	sub eax,'0'

	movzx ebx, byte[num2]
	sub ebx, '0'

	sub eax,ebx

	add eax, '0'
	mov [result], al

	mov eax, 4
	mov ebx, 1
	mov ecx, result
	mov edx, 1
	int 0x80
	
	mov eax,1
	int 80h
	

mul:
	movzx eax, byte[num1]
        sub eax,'0'

        movzx ebx, byte[num2]
        sub ebx, '0'

        add eax,ebx
        
        mov ebx,eax
        mov eax,1
        int 80h


div:
	movzx eax, byte[num1]
        sub eax,'0'

        movzx ebx, byte[num2]
        sub ebx, '0'

        add eax,ebx
        
        mov ebx,eax
        mov eax,1
        int 80h


quit:
	mov eax,1
	int 80h
