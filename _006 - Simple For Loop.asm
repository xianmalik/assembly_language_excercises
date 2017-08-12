;Simple For Loop

.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    MOV CX,5

    FOR_LOOP:
        MOV DL,1
        ADD DL,30H
        CMP CX,0
        JE END

    MOV AH,2
    INT 21h

    LOOP FOR_LOOP

    END:
        MOV AH,4CH
        INT 21H

    MAIN ENDP
END MAIN
