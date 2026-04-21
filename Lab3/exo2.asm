data segment
tab db "there are many ways to represent the same numeric value long ago "
    db " humans used sticks to count and later learned how to draw pictures"
    db " of sticks in the ground and eventually on paper "
    
  lg equ $-tab
  comp db 52 dup(?)
  
  pkey db "press any key... $"  
  
ends
stack segment 
    dw 128 dup(0)
ends

code segment
start:
    mov ax,data
    mov ds, ax
    mov es, ax 
    
    ; starting first part (space to a's)
    
    mov cx, lg
    mov si, 0 
    
bcl:
    cmp tab[si], 20h
    JNE Nblanc
    MOV Tab[SI], 'a'
Nblanc:
    INC SI
    loop bcl
    
    ; starting second part (setping comp)
    mov si, 0 
    mov cx, 26
    mov al, 'A'
init:
    mov comp[si],21h
    inc si 
    mov comp[si],al
    inc si 
    inc al
    loop init
    
    ;starting third part (filling the comp thingy)
    
    mov cx,lg
    mov si,0
    mov bl,2

calcul:
    mov al,tab[si]
    sub al,'a'
    mov di, ax
    inc comp[di]
    inc si 
    loop calcul
ends
     
    