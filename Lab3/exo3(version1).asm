data segment 
  TEXT    db "testing stuff testing stuff lol ."
  lg      equ $-TEXT
  CHAINE  db "ilys$"
  FOUND   db 0
  MSG_YES db "Match found!$"
  MSG_NO  db "No match found!$"
data ends

code segment
assume cs:code, ds:data

start:
  mov ax, data
  mov ds, ax
  mov es, ax 
  
  mov si, 0
  mov di, 0
  mov bx, 0
  mov cx, lg
  
bcl:
  mov al, CHAINE[di]
  cmp al, '$'
  JE fin
  
  cmp al, TEXT[si]
  JNE cond
  
  inc si
  inc di
  loop bcl
  
  mov FOUND, 0
  mov dx, offset MSG_NO
  mov ah, 09h
  int 21h
  jmp done
  
cond: 
  mov di, 0
  inc bx
  mov si, bx
  loop bcl

  mov FOUND, 0
  mov dx, offset MSG_NO
  mov ah, 09h
  int 21h
  jmp done

fin:
  mov FOUND, 1
  mov dx, offset MSG_YES
  mov ah, 09h
  int 21h

done:
  mov ah, 4ch
  int 21h

code ends
end start