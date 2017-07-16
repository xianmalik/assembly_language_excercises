;Grading From Number Input

.MODEL SMALL
.STACK 100H
.DATA
    INPUT_CH DB 10,13,'Enter Your Marks[Divided by 10]: ',0DH,0AH,'$'
    OUTPUT_A DB 10,13,'Your Grade Is: A','$'
    OUTPUT_B DB 10,13,'Your Grade Is: B','$'
    OUTPUT_C DB 10,13,'Your Grade Is: C','$'
    OUTPUT_F DB 10,13,'Your Grade Is: F','$'
    CHARACTR DB '?', '$'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    MOV DX,OFFSET INPUT_CH
    MOV AH,09
    INT 21H

    MOV AH,01
    INT 21H
    MOV CHARACTR,AL
    CMP CHARACTR,'3'
    JL  GRADE_F
    CMP CHARACTR,'6'
    JL  GRADE_C
    CMP CHARACTR,'8'
    JL  GRADE_B
    JGE GRADE_A

    GRADE_F:
        MOV DX,OFFSET OUTPUT_F
        MOV AH,09
        INT 21H
        JMP EXIT

    GRADE_C:
        MOV DX,OFFSET OUTPUT_C
        MOV AH,09
        INT 21H
        JMP EXIT

    GRADE_B:
        MOV DX,OFFSET OUTPUT_B
        MOV AH,09
        INT 21H
        JMP EXIT

    GRADE_A:
        MOV DX,OFFSET OUTPUT_A
        MOV AH,09
        INT 21H
        JMP EXIT

    EXIT:
        MOV AH,4CH
        INT 21H

    MAIN ENDP
END MAIN
