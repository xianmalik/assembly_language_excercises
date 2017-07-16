;Simple Nested Loop

.MODEL SMALL
.DATA
.CODE
MAIN PROC
    MOV BX,5
    MOV CX,5

    LOOP1:
        MOV DL,1
        ADD DL,30H
        MOV AH,2
        INT 21H

    LOOP2:
        MOV DL,2
        ADD DL,30H
    MOV AH,2
    INT 21H

    LOOP LOOP2

    MOV DL,10
    MOV AH,02H
    INT 21H
    MOV DL,13
    MOV AH,02H
    INT 21H
    MOV CX,BX
    DEC BX

    LOOP LOOP1

    MOV AH,4CH
    INT 21H

    MAIN ENDP
END MAIN
