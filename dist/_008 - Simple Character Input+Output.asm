;Simple Character Input/Output

.MODEL SMALL
.STACK 100H
.DATA
    INPUT   DB 10,13, 'Enter An Uppercase Character [A-Z]',0DH,0AH,'$'
    MESSAGE DB 10,13, 'You Typed: '
    OUTPUT  DB '?','$'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    MOV DX,OFFSET INPUT
    MOV AH,09
    INT 21H

    MOV AH,01
    INT 21H

    MOV OUTPUT,AL
    CMP OUTPUT,'A'
    JL  EXIT
    CMP OUTPUT,'Z'
    JG  EXIT

    MOV DX,OFFSET MESSAGE
    MOV AH,09
    INT 21H

    JMP EXIT

    EXIT:
        MOV AH,4CH
        INT 21H

    MAIN ENDP
END MAIN
