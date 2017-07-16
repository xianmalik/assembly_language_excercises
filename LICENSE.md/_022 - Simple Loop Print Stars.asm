;Simple Loop Print Stars

.MODEL SMALL
.STACK 100H
.DATA
    PROMPT1 DB "ENTER HOW MANY STARS: $"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    INT 21H

    MOV AH,9
    MOV DX,OFFSET PROMPT1
    INT 21H

    MOV AH,1
    INT 21H
    MOV BL,AL
    SUB AL,30H

    MOV CX,0
    MOV CL,AL

    MOV AH,2
    MOV DL,10
    INT 21H
    INT 21H
    MOV DL,13
    INT 21H
    MOV DL,'*'

    TOP:
        INT 21H
        LOOP TOP

    MOV AH,4CH
    INT 21H

    MAIN ENDP
END MAIN
