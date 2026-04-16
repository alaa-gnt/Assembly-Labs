.model small 
.stack 100h

.data
    TAB1 db 'ABCDEFGHIJ' ; 10 letters
    TAB2 db '0123456789' ; 10 digits
    
.code
main:
    MOV AX, @data
    MOV DS, AX
    
    MOV CX, 10 ; 10 iteration
    MOV SI, 0  ; SI point to START of TAB1
    MOV DI, 9  ; DI point to END of Tab2
    
swap_loop:
    
    MOV AL,TAB1[SI]
    MOV BL,TAB2[DI]
    
    MOV TAB1[SI], BL
    MOV TAB2[DI], AL
    
    INC SI ; move forwaed in TAB1 
    DEC DI ; move backward in TAB2
    
    LOOP swap_loop
    
    MOV AH,4ch
    INT 21h

end main
            
    