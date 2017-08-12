;Hexadecimal To Decimal Convertion

.MODEL SMALL
.STACK 100H
.DATA
INPUT  DB 10,13,'Enter A Hexadecimal Digit<A-F>: $'
OUTPUT DB 10,13,'In Decimal It Is: 1$'
HEX    DB ?

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    MOV AH,9
    MOV DX,OFFSET INPUT
    INT 21H

    MOV AH,1
    INT 21H
    MOV HEX,AL
    SUB HEX,11H

    MOV AH,9
    MOV DX,OFFSET OUTPUT
    INT 21H

    MOV AH,2
    MOV DL,HEX
    INT 21H

    MAIN ENDP
END MAIN
