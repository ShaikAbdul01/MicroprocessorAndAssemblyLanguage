org 100h

.model small
.stack 100h

.data
    prompt1 db "Enter First Number: $"
    prompt2 db 13,10,"Enter Second Number: $"
    prompt3 db 13,10,"Enter Third Number: $"
    resultAdd db 13,10,"Addition Result: $"
    num1 db ?
    num2 db ?
    num3 db ?
    res db ?

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Input first number
    mov ah, 9
    lea dx, prompt1
    int 21h

    mov ah, 1
    int 21h
    sub al, '0'
    mov num1, al

    ; Input second number
    mov ah, 9
    lea dx, prompt2
    int 21h

    mov ah, 1
    int 21h
    sub al, '0'
    mov num2, al

    ; Input third number
    mov ah, 9
    lea dx, prompt3
    int 21h

    mov ah, 1
    int 21h
    sub al, '0'
    mov num3, al

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
