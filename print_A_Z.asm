.model small
.stack 100h

.data

.code
main proc
    mov cx, 26       ; Set loop counter to 26
    mov ah, 2        ; DOS interrupt for character output
    mov dl, 'A'      ; Start with 'A'

print_loop:
    int 21h          ; Print character in DL
    inc dl           ; Move to the next character
    loop print_loop  ; Loop until CX is zero

    ; Exit program
    mov ah, 4Ch      ; DOS interrupt to exit
    int 21h

main endp
end main
