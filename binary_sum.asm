.model small
.stack 100h
.data
	str2 db 10,13,'Enter a binary number upto 8 digits: $'
	errormsg db 10,13,'Illegal binary digit.$'
	str1 db  10,13,'Try again: $'
	str3 db 10,13,'The binary sum is: $'
.code
	main proc
		MOV Ax,@data
		MOV Ds,Ax
		
	;binary input 1
		MOV Cx,8
		MOV Bl,0
		
		MOV Dx, offset str2
		MOV Ah,09h
		INT 21h
		
	aa:	MOV Ah,01h
		INT 21h
		
		CMP Al,13
		JE a0
		
		CMP Al,'0'
		JE bb
		
		CMP Al,'1'
		JE bb
		
	errors:	MOV Dx, offset errormsg
		MOV Ah,09h
		INT 21h
		
		MOV Dx, offset str1
		MOV Ah,09h
		INT 21h
		
		XOR Al,Al
		INC Cx
		JMP aa
		
	bb:	AND Al,0fh
		SHL Bl,1
		OR Bl,Al
		
		DEC Cx
		JNZ aa
	
	;binary input 2
	a0:	MOV Cx,8
		MOV Bh,0
		
		MOV Dx, offset str2
		MOV Ah,09h
		INT 21h
		
	a1:	MOV Ah,01h
		INT 21h
		
		CMP Al,13
		JE exit
		
		CMP Al,'0'
		JE b1
		
		CMP Al,'1'
		JE b1
		
	errorss:MOV Dx, offset errormsg
		MOV Ah,09h
		INT 21h
		
		MOV Dx, offset str1
		MOV Ah,09h
		INT 21h
		
		XOR Al,Al
		INC Cx
		JMP a1
		
	b1:	AND Al,0fh
		SHL Bh,1
		OR Bh,Al
		
		DEC Cx
		JNZ a1
	
	;binary output
	exit:MOV Dx, offset str3
		MOV Ah,09h
		INT 21h
		ADD Bl,Bh
		JC two
	
	ha:	MOV Cx,8
	ex:	ROL Bl,1
		JC one
		
		MOV Dl,'0'
		MOV Ah,02h
		INT 21h
		JMP de
		
	one:MOV Dl,'1'
		MOV Ah,02h
		INT 21h
		JMP de
		
	two:MOV Dl,'1'
		MOV Ah,02h
		INT 21h
		JMP ha
		
	de:	DEC Cx
		JNZ ex
		
	MOV Ah,4Ch
	INT 21h
	main endp
end main