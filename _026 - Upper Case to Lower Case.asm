;Upper Case to Lower Case

.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 'ENTER UPPER CASE: $'
    MSG2 DB 10,13,'IN LOWER CASE: '
    CHAR DB ?,'$'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    MOV DX,OFFSET MSG1
    MOV AH,9
    INT 21H

    MOV AH,1
    INT 21H
    ADD AL,20H
    MOV CHAR,AL


    MOV DX,OFFSET MSG2
    MOV AH,9
    INT 21H

    MOV AH,4CH
    INT 21H

    MAIN ENDP
END MAIN
