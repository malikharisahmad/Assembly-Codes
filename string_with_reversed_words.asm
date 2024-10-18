.model small
.stack 100h
.data
    str1 db "Enter a string: $"
    str3 db 100 dup("$")
    str2 db "String with words in reverse order: $"
.code
    main proc
		Mov Ax,@data
		Mov Ds,Ax

		Lea Dx,str1
		Mov Ah,09h
		INT 21h

		MOV Cx,0
		Lea SI,str3
	
	aa:	Mov Ah,01h
        INT 21h
		CMP Al,13
		JE outpp
		CMP Al,32
		JE outss
		
		MOV Ah,0
		PUSH Ax
		XOR Ax,Ax
		INC Cx
		JMP aa
		
	outss:
		XOR Ax,Ax
	outp:POP Ax
		MOV [Si],Al
		INC Si
		LOOP outp
		MOV Bl,32
		MOV [Si],Bl
		INC SI
		JMP aa
		
	outpp:XOR Ax,Ax
	outpppp:POP Ax
		MOV [Si],Al
		INC Si
		LOOP outpppp
		
	endd:LEA Dx,str2
		MOV Ah,09h
		INT 21h
		
		LEA Dx,str3
		MOV Ah,09h
		INT 21h

	Mov Ah,4Ch
	INT 21h
    main endp
end main