;Addition With Procedure

.MODEL SMALL
.DATA
    INPUT1 DB 'Enter 1st Number: $'
    INPUT2 DB 10,13,'Enter 2nd Number: $'
    OUTPUT DB 10,13,'The Addition Result Is: $'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    LEA DX,INPUT1
    MOV AH,09H
    INT 21H

    MOV AH,01
    INT 21H
    SUB AL,30H
    MOV BL,AL

    LEA DX,INPUT2
    MOV AH,09H
    INT 21H

    MOV AH,01
    INT 21H

    SUB AL,30H
    MOV CL,AL

    CALL SUM

    LEA DX,OUTPUT
    MOV AH,09H
    INT 21H

    MOV AL,BH
    MOV AH,02H
    INT 21H

    MOV DL,BL
    MOV AH,02H
    INT 21H

    MOV AH,4CH
    INT 21H

    MAIN ENDP

SUM PROC
    MOV AH,0
    MOV AL,BL
    ADD AL,CL
    AAA

    MOV BX,AX
    ADD BX,30H
    RET
    SUM ENDP

END MAIN
