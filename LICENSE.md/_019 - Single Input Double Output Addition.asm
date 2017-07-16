;Single Input Double Output Addition

DATA SEGMENT
     NUM1 DB ?
     NUM2 DB ?
     RESULT DB ?
     MSG1 DB 10,13,"ENTER FIRST NUMBER TO ADD : $"
     MSG2 DB 10,13,"ENTER SECOND NUMBER TO ADD : $"
     MSG3 DB 10,13,"RESULT OF ADDITION IS : $"
ENDS

CODE SEGMENT
    ASSUME DS:DATA CS:CODE

START:
      MOV AX,DATA
      MOV DS,AX

      LEA DX,MSG1
      MOV AH,9
      INT 21H

      MOV AH,1
      INT 21H
      SUB AL,30H
      MOV NUM1,AL

      LEA DX,MSG2
      MOV AH,9
      INT 21H

      MOV AH,1
      INT 21H
      SUB AL,30H
      MOV NUM2,AL

      ADD AL,NUM1

      MOV RESULT,AL

      MOV AH,0
      AAA

      ADD AH,30H
      ADD AL,30H

      MOV BX,AX

      LEA DX,MSG3
      MOV AH,9
      INT 21H

      MOV AH,2
      MOV DL,BH
      INT 21H

      MOV AH,2
      MOV DL,BL
      INT 21H

      MOV AH,4CH
      INT 21H
      ENDS
END START
