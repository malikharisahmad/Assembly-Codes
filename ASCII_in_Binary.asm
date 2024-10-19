.model small
.stack 100h
.data
	str1 db "Enter a character: $"
	str2 db 10,13,"The ASCII code of the entered character in binary is $"
	str3 db 10,13,"The number of 1 bit is $"
.code
	main proc
		MOV Ax,@data
		MOV Ds,Ax
		
		MOV Dx,offset str1
		MOV Ah,09h
		INT 21h
		
		MOV Ah,01h
		INT 21h
		
		MOV Dx,offset str2
		MOV Ah,09h
		INT 21h
		
		MOV Bh,0
		
		MOV Bl,Al
		MOV Cx,8
	bb:	ROL Bl,1
		JC cc
		MOV Dl,'0'
		MOV Ah,02h
		INT 21h
		JMP ddd
	cc:	MOV Dl,'1'
		MOV Ah,02h
		INT 21h
		INC Bh
	ddd:DEC Cx
		JNZ bb
		
		MOV Dx,offset str3
		MOV Ah,09h
		INT 21h
		
		ADD Bh,48
		MOV Dl,Bh
		MOV Ah,02h
		INT 21h
	MOV Ah,4Ch
	INT 21h
	
	main endp
end main