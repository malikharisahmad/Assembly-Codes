.model small
.stack 100h
.data
    str1 db "Enter a character: $"
    str3 db 10 dup("$")
    str2 db "In reverse order: $"
.code
    main proc
	Mov Ax,@data
	Mov Ds,Ax

;prompt
	Mov Dx,offset str1
	Mov Ah,09h
	INT 21h

;SI initialize
	MOV SI,offset str3

;input 1 char	
again:  Mov Ah,01h
        INT 21h
	CMP Al,13
	JE en

;concatenate string
	Mov [SI],Al
	Mov DI,SI
	INC SI
	JMP again


;reverse logic
en:	Mov Dx,offset str2
	Mov Ah,09h
	INT 21h
	Mov SI,offset str3
ppp:	Mov Dl,[DI]
	Mov Ah,02h
	INT 21h
	DEC DI
	CMP DI,offset str3
	JAE ppp

	Mov Ah,4Ch
	INT 21h
    main endp
end main