.model small
.stack 100h
.data
    str1 db "Enter a number (0-9): $"
.code
    main proc
		Mov Ax,@data
		Mov Ds,Ax

		LEA Dx,str1
		Mov Ah,09h
		INT 21h

        Mov Ah,01h
        INT 21h
	
		Mov Cl,Al
		SUB Cl,30h
		INC Cl
		
		Mov Dl,10
		Mov Ah,2
		INT 21h
		Mov Dl,13
		Mov Ah,2
		INT 21h

		Mov Bl,30h
	aa:	
		Mov Dl,Bl
		Mov Ah,02h
		INT 21h

		Mov Dl,10
		Mov Ah,2
		INT 21h
		Mov Dl,13
		Mov Ah,2
		INT 21h

		INC Bl
		DEC Cl
		JNZ aa

	Mov Ah,4Ch
	INT 21h
    main endp
end main