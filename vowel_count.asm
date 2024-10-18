.model small
.stack 100h
.data
    str1 db "Enter a string: $"
    str2 db 10,13,"Vowel Characters: $"
.code
    main proc
		Mov Ax,@data
		Mov Ds,Ax
		
		Mov Cl,0

		Mov Dx,offset str1
		Mov Ah,09h
		INT 21h

	again: Mov Ah,01h
        INT 21h
		CMP Al,13
		JE en
		CMP Al,"a"
		JE plus
		CMP Al,"e"
		JE plus
		CMP Al,"i"
		JE plus
		CMP Al,"o"
		JE plus
		CMP Al,"u"
		JE plus
		CMP Al,"A"
		JE plus
		CMP Al,"E"
		JE plus
		CMP Al,"I"
		JE plus
		CMP Al,"O"
		JE plus
		CMP Al,"U"
		JE plus
		JMP again
		
	plus:INC Cl
		JMP again

	en:	Mov Dx,offset str2
		Mov Ah,09h
		INT 21h
		ADD Cl,30h
		Mov Dl,Cl
		Mov Ah,02h
		INT 21h

	Mov Ah,4Ch
	INT 21h
    main endp
end main