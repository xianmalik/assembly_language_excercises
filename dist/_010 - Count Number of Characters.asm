;Count Number of Characters

.MODEL SMALL
.STACK 100H
.DATA
    MESSAGE1 DB "Enter A Sentence: $"
    MESSAGE2 DB 0AH,0DH,"Your Sentence's Total Characters: $"
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

   MOV AH,9
   LEA DX,MESSAGE1
   INT 21H

   MOV CX,0
   MOV AH,1
   INT 21H

   COUNT:
       CMP AL,0DH
       JE PRINT
       INC CX
       INT 21H
       JNE COUNT

   PRINT:
       MOV AH,9
       LEA DX,MESSAGE2
       INT 21H

        MOV DX,CX
        ADD DX,30H
        MOV AH,02H
        INT 21H

   MOV AH,4CH
   INT 21H

   MAIN ENDP
END MAIN
