
DATA SEGMENT
    A       DB 0A7H        ; Define byte A with value 0xA7 (decimal 167)
    B       DB 9AH         ; Define byte B with value 0x9A (decimal 154)
    RESULT  DB ?           ; Reserve a byte for the subtraction result
    BORROW  DB ?           ; Reserve a byte to store borrow flag (0 or 1)
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE DS:DATA
    
START:
    MOV AX, DATA           ; Load address of DATA segment into AX
    MOV DS, AX             ; Initialize DS register to point to DATA segment
    
    MOV AL, A              ; Load value of A into AL register (lower byte of AX)
    SUB AL, B              ; Subtract B from AL; sets flags including Carry (borrow)
    
    MOV RESULT, AL         ; Store the subtraction result in RESULT
    
    JC BORROW              ; Jump to BORROW label if Carry Flag (borrow) is set
    
    MOV BORROW, 00H        ; If no borrow, store 0 in BORROW
    JMP CONTINUE           ; Jump to CONTINUE to skip borrow handling
    
BORROW:
    MOV BORROW, 01H        ; If borrow occurred, store 1 in BORROW
    
CONTINUE:
    MOV AH, 4CH            ; DOS function code for program termination
    INT 21H                ; Interrupt to terminate program and return control to OS
    
CODE ENDS
END START
