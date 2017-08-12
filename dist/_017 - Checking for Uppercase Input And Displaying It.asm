;Checking for Uppercase Input And Displaying It

.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC

    MOV AX,@DATA
    MOV DS,AX

    MOV AH,1
    INT  21H
    CMP AL,'A'
    JL END_IF
    CMP AL,'Z'
    JG END_IF
    MOV DL,AL
    MOV AH,2
    INT 21H

    END_IF:
        MOV AH,4CH
        INT 21H

    MAIN ENDP
END MAIN
