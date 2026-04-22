data segment
  texte   db "aaaaabcddd."
  chaine  db "aaabc$"
  msgtrv  db "la chaine est trouvee $"
  msgntrv db "la chaine est non trouvee $"
data ends

stack segment
  dw 128 dup(0)
stack ends

code segment
assume cs:code, ds:data

start:
  mov ax, data
  mov ds, ax
  mov es, ax

  mov si, 0
  mov di, 0
  mov bx, 0        ; bx = anchor

tq:
  cmp texte[si], '.'    ; end of TEXT = no match
  je ntrv

conti:
  mov al, texte[si]
  cmp al, chaine[di]
  jne suit              ; mismatch = go check if it was full match
  inc si                ; match = move both forward
  inc di
  jmp conti

suit:
  cmp chaine[di], '$'   ; di reached '$' = full match before mismatch
  je trv
  mov si, bx            ; restore si to anchor
  inc bx                ; move anchor forward
  mov di, 0             ; reset CHAINE
  jmp tq

trv:
  lea dx, msgtrv
  mov ah, 9
  int 21h
  jmp fin

ntrv:
  lea dx, msgntrv
  mov ah, 9
  int 21h

fin:
  mov ah, 1
  int 21h
  mov ax, 4c00h
  int 21h

code ends
end start