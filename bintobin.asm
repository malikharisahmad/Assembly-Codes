.model small
.stack 100h
.data
	str2 db 10,13,'Input in Binary: $'
	errormsg db 10,13,'Invalid input.$'
	str1 db  10,13,'Input again in Binary: $'
	str3 db 10,13,'Output in Binary: $'
.code
	main proc
		MOV Ax,@data
		MOV Ds,Ax
	;binary input	
		MOV Cx,8
		MOV Bx,0
		
		MOV Dx, offset str2
		MOV Ah,09h
		INT 21h
		
	aa:	MOV Ah,01h
		INT 21h
		
		CMP Al,13
		JE exit
		
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
		
		JMP aa
		
	bb:	SUB Al,48
		SHL Bl,1
		OR Bl,Al
		
		DEC Cx
		JNZ aa
	
	;binary output
	exit:MOV Dx, offset str3
		MOV Ah,09h
		INT 21h
		
		MOV Cx,8
	ex:	ROL Bl,1
		JC one
		
		MOV Dl,'0'
		MOV Ah,02h
		INT 21h
		JMP de
		
	one:MOV Dl,'1'
		MOV Ah,02h
		INT 21h
		
	de:	DEC Cx
		JNZ ex
		
	MOV Ah,4Ch
	INT 21h
	main endp
end main