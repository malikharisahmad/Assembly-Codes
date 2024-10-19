.model small
.stack 100h
.386
.data
	str2 db 10,13,'Enter a hex number (0 to FFFF): $'
	errormsg db 10,13,'Illegal hex digit.$'
	str1 db  10,13,'Try again: $'
	str3 db 10,13,'In binary it is: $'
.code
	main proc
		MOV Ax,@data
		MOV Ds,Ax
		
	;hexadecimal input	
		MOV Cx,4
		MOV Bx,0
		
		MOV Dx, offset str2
		MOV Ah,09h
		INT 21h
		
	aa:	MOV Ah,01h
		INT 21h
		
		CMP Al,13
		JE exit
		
		CMP Al,'0'
		JL errors
		
		CMP Al,'9'
		JLE bb
		
		CMP Al,'A'
		JL errors
		
		CMP Al,'F'
		JA errors
		
		JMP bb
	errors:	MOV Dx, offset errormsg
		MOV Ah,09h
		INT 21h
		
		MOV Dx, offset str1
		MOV Ah,09h
		INT 21h
		
		XOR Bx,Bx
		INC Cx
		JMP aa
		
	bb:	CMP Al,39h
		JG letter
		SUB Al,30h
		JMP cc
	letter:SUB Al,37h
	cc:	SHL Bx,4
		OR Bl,Al
		
		DEC Cx
		JNZ aa
		
	;binary output
	exit:MOV Dx, offset str3
		MOV Ah,09h
		INT 21h
		
		MOV Cx,16
	ex:	ROL Bx,1
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