.model small
.stack 100h

.data
    
    resultAdd db 13,10,"Addition Result: $"
    num1 db 2   ; First predefined number
    num2 db 1  ; Second predefined number
    num3 db 3   ; Third predefined number
    res db ?

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Addition
    mov al, num1
    add al, num2
    add al, num3
    add al, '0'
    mov res, al

    ; Display result
    mov ah, 9
    lea dx, resultAdd
    int 21h

    mov dl, res
    mov ah, 2
    int 21h

    ; Exit program
    mov ah, 4Ch
    int 21h

main endp
end main
