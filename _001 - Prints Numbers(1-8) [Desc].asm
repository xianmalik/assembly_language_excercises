;Prints Numbers(1-8) [Desc]

.MODEL SMALL
.STACK 100H
.DATA
    MESSAGE DB "Enter a number(1-8):$"
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    MOV AH,9
    MOV DX,OFFSET MESSAGE
    INT 21H

    MOV AH,1
    INT 21H

    SUB AL,30H
    MOV CX,AX
    MOV BX,AX
    ADD BX,30H

    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H

    PRINT:
        CMP CL,0
        JE  EXIT

        MOV AH,2
        MOV DL,BL
        INT 21H

    SUB BL,1
    LOOP PRINT

    EXIT:
        MOV AH,4CH
        INT 21H

    MAIN ENDP
END MAIN
