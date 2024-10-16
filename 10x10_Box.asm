.model small
.stack 100h
.data
    str1 db "10x10 Solid Box $"
	
.code
    main proc
		mov ax,@data
		mov ds,ax
		
		lea dx,str1
		mov ah,09h
		int 21h
		
		mov dl, 10
		mov ah,02h
		int 21h
		mov dl, 13
		mov ah,02h
		int 21h
		
		mov cl,10
		mov ch,10

	aa:	mov dl,"*"
		mov ah,02h
		int 21h
		dec ch
		jnz aa

		mov dl, 10
		mov ah,02h
		int 21h
		mov dl, 13
		mov ah,02h
		int 21h

		mov ch,10
		dec cl
		jnz aa
	
	mov ah,4ch
	int 21h
    main endp
end main