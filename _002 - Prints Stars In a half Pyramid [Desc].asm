;Prints Stars In a half Pyramid [Desc]

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
        CMP BX,0
        JE  _EXIT
        JMP PRINT

    _EXIT:
        MOV AH,2
        MOV DL,0Dh
        INT 21H
        MOV DL,0AH
        INT 21H

    MOV BX,CX
    SUB BX,1
    LOOP PRINT

    MOV AH,4CH
    INT 21H

    MAIN ENDP
END MAIN
