DATA SEGMENT
    A DW 0FFFFH        ; Define word A with maximum 16-bit value (65535)
    B DW 0C09H         ; Define word B with the value 3081 (in hex)
    RESULT DW ?        ; Placeholder to store result of addition
    CARRY DB ?         ; Byte to store carry status (1 if carry occurred, 0 otherwise)
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA  ; Tell the assembler to assume DS points to DATA and CS to CODE

START:
    MOV AX, DATA       ; Load the segment address of DATA into AX
    MOV DS, AX         ; Move AX into DS to initialize the data segment register

    MOV AX, A          ; Load the value of variable A into AX
    ADD AX, B          ; Add the value of B to AX (A + B)

    MOV RESULT, AX     ; Store the result of the addition into RESULT

    JNC NOCARRY        ; Jump to NOCARRY if no carry occurred during addition

    MOV CARRY, 1       ; If carry occurred, store 1 in CARRY
    JMP CONTINUE       ; Skip the next instruction and jump to CONTINUE

NOCARRY:
    MOV CARRY, 00H     ; If no carry, store 0 in CARRY

CONTINUE:
    MOV AH, 4CH        ; Prepare to terminate the program
    INT 21H            ; DOS interrupt to exit the program

CODE ENDS
END START              ; Mark the end of the program and set the entry point as START

