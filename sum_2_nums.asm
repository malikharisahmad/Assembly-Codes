.model small
.stack 100h
.data
    digit1 db "Enter first digit: $"
    digit2 db "Enter second digit: $"
    sums db "The sum is $"
    errors db "Error! Sum is greater than 9$"
.code
    main proc
		Mov Ax,@data
		Mov Ds,Ax

		Lea Dx,digit1
		Mov Ah,09h
		INT 21h

        Mov Ah,01h
        INT 21h
		Mov Bl,Al
		SUB Bl,48

		Mov Dl,10
		Mov Ah,2
		INT 21h
		Mov Dl,13
		Mov Ah,2
		INT 21h

		Lea Dx,digit2
		Mov Ah,09h
		INT 21h
	
        Mov Ah,01h
        INT 21h
		Mov Bh,Al
		SUB Bh,48

		Mov Dl,10
		Mov Ah,2
		INT 21h
		Mov Dl,13
		Mov Ah,2
		INT 21h

		ADD Bl,Bh
		CMP Bl,9
		JG err

		Lea Dx,sums
		Mov Ah,09h
		INT 21h
		ADD Bl,48
		Mov Dl,Bl
		Mov Ah,02
		INT 21h
		JMP endd

	err:Lea Dx,errors
		Mov Ah,09h
		INT 21h

	endd:Mov Ah,4Ch
		INT 21h
	main endp
end main