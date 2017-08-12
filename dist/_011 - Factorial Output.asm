;Factorial Output

.MODEL SMALL
.DATA
    MESSAGE1 db "Enter a number less than Five: $"
    MESSAGE2 db 10,13,"Factorial: $"
    ERRORMSG db 10,13,"Your input Must be less than 5 try another: $"
    CHARACTR db ?
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    MOV AH,09H
    LEA DX,MESSAGE1
    INT 21H

    INPUT:
        MOV AH,01H
        INT 21H
        SUB AL,30H

    MOV CHARACTR,AL
    CMP CHARACTR,4
    JG  ERROR
    DEC CHARACTR

    CALL FACTORIAL

    MOV AH,09H
    LEA DX,MESSAGE2
    INT 21H

    MOV AH,2H
    MOV DL,BH
    INT 21H

    MOV DL,BL
    INT 21H
    JMP EXIT

    ERROR:
        MOV AH,09H
        LEA DX,ERRORMSG
        INT 21H
        JMP INPUT

    EXIT:
        MOV AH,4CH
        INT 21H
    MAIN ENDP

    FACTORIAL PROC
        MOV AH,0
        LOOP:
            MUL CHARACTR
            DEC CHARACTR
            CMP CHARACTR,0
            JNE LOOP

        AAM
        MOV BX,AX
        ADD BX,3030H
        RET
        FACTORIAL ENDP

END MAIN
