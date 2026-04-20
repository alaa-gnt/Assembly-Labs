data segment
    
    A DW 5
    B DW 3
    C DW 3
    D DW 5
    X DW ?
    
ends
code segment
start:
; seting segment registers
    mov ax,data
    mov ds, ax
    mov es, ax
    
    MOV AX,B ; AX = B  
    IMUL C   ; AX:DX = B * C 
    ADD AX,A ; simple adding
    ADC DX,0 ; in case of the carry
    
    ADD AX,2 ; simpe addition
    ADC DX,0 ; in case of a carry
    
    MOV BX,D ; simple mov
    SUB BX,3 ; simple sub
    
    IDIV BX  ; div , result at ax , rest in dx
    
    MOV X,AX ; storing the final result at x
    
    mov ax,4c00h
    int 21h
    
ends 
end start
    