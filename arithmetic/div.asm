DATA SEGMENT
    A DW 98A7H          ; 16-bit dividend (value = 0x98A7)
    B DB 0A4H           ; 8-bit divisor (value = 0xA4)
    
    QUOTIENT DB ?       ; To store quotient result (8-bit)
    REMINDER DB ?       ; To store remainder result (8-bit)
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE DS:DATA

START:
    MOV AX, DATA        ; Load address of DATA segment into AX
    MOV DS, AX          ; Initialize DS register to point to DATA segment
    
    MOV AX, A           ; Move 16-bit dividend (A) into AX (required for 8-bit DIV)
    MOV BL, B           ; Move 8-bit divisor (B) into BL
    
    DIV BL              ; Divide AX by BL
                        ; Quotient stored in AL
                        ; Remainder stored in AH
    
    MOV QUOTIENT, AL    ; Store quotient from AL into QUOTIENT variable
    MOV REMINDER, AH    ; Store remainder from AH into REMINDER variable
    
    MOV AH, 4CH         ; DOS terminate program function
    INT 21H             ; Call DOS interrupt to exit program
    
CODE ENDS
END START

