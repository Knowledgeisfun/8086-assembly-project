DATA SEGMENT
    A  DB 88H        ; Define byte A = 0x88 (136 decimal)
    B  DB 99H        ; Define byte B = 0x99 (153 decimal)
    
    RH DB ?          ; Reserve a byte for high byte of result
    RL DB ?          ; Reserve a byte for low byte of result
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA

START:
    MOV AX, DATA     ; Load address of DATA segment into AX
    MOV DS, AX       ; Set DS register to point to DATA segment

    MOV AL, A        ; Load value of A into AL (implicitly used by MUL)
    MUL B            ; Multiply AL * B (i.e., 0x88 * 0x99)
                     ; Result is stored in AX: AH = high byte, AL = low byte

    MOV RH, AH       ; Store high byte of result into RH
    MOV RL, AL       ; Store low byte of result into RL

    MOV AH, 4CH      ; DOS terminate program function
    INT 21H          ; Call interrupt to terminate the program

CODE ENDS
END START
