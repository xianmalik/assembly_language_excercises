;Finding Ascii Code of A Character

.MODEL SMALL
.STACK 100H
.DATA
    MESSAGE1  DB 'TYPE A CHARACTER :','$'
    MESSAGE2  DB 10,13,'THE ASCII CODE OF '
    CALCULATE DB ?,' IN BINARY IS: ','$'
    MESSAGE3  DB 10,13,'THE NUMBER OF 1 BIT IS: '
    OUTPUT    DB ?,'$'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    MOV AH,9

    LEA DX,MESSAGE1
    INT 21H

    MOV AH,1
    INT 21H
    MOV BL,AL
    MOV CALCULATE,AL

    MOV AH,9
    LEA DX,MESSAGE2
    INT 21H

    MOV BH,0
    MOV CX,8
    MOV AH,2

    LOOP_1:
        SHL BL,1
        JC  LOOP_2
        MOV DL,'0'
        INT 21H
        JMP LOOP_3

    LOOP_2:
        MOV DL,'1'
        INT 21H
        INC BH

    LOOP_3:
        LOOP LOOP_1
        ADD BH,30Hq
        MOV OUTPUT,BH
        MOV AH,9
        LEA DX,MESSAGE3
        INT 21H

    MOV AH,4CH
    INT 21H

    MAIN ENDP
END MAIN
