;Multiplication of 2 single digit numbers

.MODEL SMALL
.STACK 100H
.DATA

    MSG DB "Enter first digit: $"
    MSG2 DB 10,13, "Enter 2nd digit: $"
    MSG3 DB 10,13, "RESULT= $"
    a DB 0
    b DB 0
    c DB 0

.CODE
MAIN PROC
    MOV AX,@data
    mov DS,AX

    mov ah,9
    MOV DX,OFFSET MSG
    INT 21H


    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV A,AL

    MOV AH,9
    MOV DX,OFFSET MSG2
    INT 21H

    MOV AH,1
    int 21H
    SUB AL,30H
    MOV B,AL

    MOV AL,A
    MOV BL,B
    MUL BL

    AAM

    ADD AH,30H
    ADD AL,30H

    MOV BX,AX

    MOV ah,9
    MOV DX,OFFSET MSG3
    INT 21H

    MOV AH,2
    MOV DL,BH
    INT 21h

    MOV AH,2
    MOV DL,BL
    INT 21h

    MOV AH,4CH
    INT 21H

    MAIN ENDP
END MAIN
