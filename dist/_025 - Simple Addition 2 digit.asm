.MODEL SMALL
.STACK 100H
.DATA
    MSG DB "Addition of 2 Numbers$"
    PROMPT1 DB 10,10,13, "Enter First Number: $"
    PROMPT2 DB 10,13, "Enter Second Number: $"
    PROMPT3 DB 10,13, "Result Of Addition Is: $"
    NUM1 DB ?,'$'
    NUM2 DB ?,'$'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    INT 21H

    MOV AH,9H
    MOV DX,OFFSET MSG
    INT 21H

    MOV AH,9H
    MOV DX,OFFSET PROMPT1
    INT 21H

    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV NUM1,AL

    MOV AH,9H
    MOV DX,OFFSET PROMPT2
    INT 21H

    MOV AH,1H
    INT 21H
    SUB AL,30H
    MOV NUM2,AL

    ADD AL,NUM1
    MOV AH,0H
    AAA

    ADD AH,30H
    ADD AL,30H

    MOV BX,AX

    MOV AH,9H
    MOV DX,OFFSET PROMPT3
    INT 21H

    MOV AH,2H
    MOV DL,BH
    INT 21H

    MOV AH,2H
    MOV DL,BL
    INT 21H

    MOV AH,4CH
    INT 21H

    MAIN ENDP
END MAIN
