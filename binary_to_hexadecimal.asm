.model small
.stack 100h
.386
.data
	str1 db 'Enter a binary number upto 16 digits: $'
	str2 db 10,13,'In HEX it is $'
	str3 db  10,13,'Try again: $'
	errormsg db 10,13,'Illegal binary digit.$'
.code
	main proc
		MOV Ax,@data
		MOV Ds,Ax
		
		;Binary input
		MOV Dx,offset str1
		MOV Ah,09h
		INT 21h
		
		MOV Cx,16
		XOR Bx,Bx 
	xx:	MOV AH,01h 
		INT 21H
		
		CMP AL,13 
		JE xy
		
		CMP Al,'0'
		JE bf
		
		CMP Al,'1'
		JE bf
		
	errors:	MOV Dx, offset errormsg
		MOV Ah,09h
		INT 21h
		
		MOV Dx, offset str3
		MOV Ah,09h
		INT 21h
		
		XOR Al,Al
		INC Cx
		JMP xx
		
	bf:	AND AL,0fh 
		SHL Bx,1 
		OR Bl,Al
		DEC Cx
		JNZ xx
		
		;Hexadecimal output
		MOV Dx,offset str2
		MOV Ah,09h
		INT 21h
		
	xy:	MOV Cx,4
		
	aa:	ROL Bx,4
		MOV Dl,Bl
		AND Dl,0fh
		CMP Dl,9
		JBE bb
		ADD Dl,7
	bb:	ADD Dl,48
	cc:	MOV Ah,02h
		INT 21h
		DEC Cx
		JNZ aa
		
	MOV Ah,4Ch
	INT 21h
	main endp
end main