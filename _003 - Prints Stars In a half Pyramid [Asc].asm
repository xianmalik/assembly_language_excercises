;Prints Stars In a half Pyramid [Asc]

.MODEL SMALL
.STACK 100H
.DATA
.CODE

MAIN PROC
    MOV BX,5
    MOV CX,BX

    PRINT:
        MOV AH,2
        MOV DL,'*'
        INT 21H

        DEC BX
        CMP BX,CX
        JL  _EXIT
        JMP PRINT

    _EXIT:
        MOV AH,2
        MOV DL,0DH
        INT 21H
        MOV DL,0AH
        INT 21H

    MOV BX,5
    LOOP PRINT

    MOV AH,4CH
    INT 21H

    MAIN ENDP
END MAIN
