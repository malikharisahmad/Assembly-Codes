.model small
.stack 100h
.data
	str1 db 10,13,'Enter two digits: $'
	str2 db 10,13,'Enter operator: $'
	sums db 10,13,'Sum is $'
	diffs db 10,13,'Difference is $'
.code
	main proc
		mov ax,@data
		mov ds,ax
		
		lea dx,str1
		mov ah,09h
		int 21h
		
		mov ah,01h
		int 21h
		mov bh,al
		sub bh,48
		
		mov ah,01h
		int 21h
		mov bl,al
		sub bl,48
		
		lea dx,str2
		mov ah,09h
		int 21h
		
		mov ah,01h
		int 21h
		
		cmp al,43
		je aa
		cmp al,45
		je bb
		
	aa: add bh,bl
		add bh,48
		lea dx,sums
		mov ah,09h
		int 21h
		mov dl,bh
		mov ah,02h
		int 21h
		jmp cc
		
	bb:	sub bh,bl
		add bh,48
		lea dx,diffs
		mov ah,09h
		int 21h
		mov dl,bh
		mov ah,02h
		int 21h
		
	cc:	mov ah,4ch
	int 21h
	main endp
end main 