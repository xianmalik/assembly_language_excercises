;Printing A Rectangle of Star From User Inputs

.MODEL SMALL
.STACK 100H
.DATA

MESSAGE1 db 'How many star do you want print per line? : $'
MESSAGE2 db 10,13,10,13,'How many line do you want to print? : $'
X db ?
Y db ?
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    MOV AH,9H
    LEA DX,MESSAGE1
    INT 21H

    MOV AH,1H
    INT 21H
    SUB AL,30H
    MOV X,AL

    MOV AH,9H
    LEA DX,MESSAGE2
    INT 21H

    MOV AH,1H
    INT 21H
    SUB AL,30H
    MOV Y,AL

    LOOP_Y:
        MOV AH,2
        MOV DL,10
        INT 21H

        MOV DL,13
        INT 21H

        MOV BH,X

    LOOP_X:
        MOV AH,2H
        MOV DL,"*"
        INT 21H
        DEC BH
        CMP BH,0
        JE  NEXT
        JMP LOOP_X

    NEXT:
        DEC Y
        CMP Y,0
        JE  EXIT
        JMP LOOP_Y

    EXIT:
        MOV AH,4CH
        INT 21H

    MAIN ENDP
END MAIN
