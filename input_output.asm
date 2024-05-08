.model small   ;memory model small ,large ,compact
.stack 100h     ;specific stack size
.code
main proc  
    
    
   ;New line    
   ; mov ah,2
    ;mov dl,0ah
    ;int 21h  
   ; mov dl,0dh
    ;int 21h
    
    
   mov ah,1
   int 21h
   mov bl,al
   
   mov ah,1
   int 21h
   mov bh,al
   
   
   mov ah,2
   mov dl,bl
   int 21h
   
   mov ah,2
   mov dl,bh
   int 21h
   
   exit:
   mov ah,4ch
   int 21h
   main endp
end main