org 100h

.model small
.stack 100h

.data
    prompt1 db "Enter First Number: $"
    prompt2 db 13,10,"Enter Second Number: $"
    resultAdd db 13,10,"Addition Result: $"
    resultSub db 13,10,"Subtraction Result: $"
    resultMul db 13,10,"Multiplication Result: $"
    resultDiv db 13,10,"Division Result: $"
    errorDiv db 13,10,"Error: Division by Zero! $"
    num1 db ?
    num2 db ?
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

    ; Addition
    mov al, num1
    add al, num2
    add al, '0'
    mov res, al

    mov ah, 9
    lea dx, resultAdd
    int 21h

    mov dl, res
    mov ah, 2
    int 21h

    ; Subtraction
    mov al, num1
    sub al, num2
    add al, '0'
    mov res, al

    mov ah, 9
    lea dx, resultSub
    int 21h

    mov dl, res
    mov ah, 2
    int 21h

    ; Multiplication
    mov al, num1
    mov bl, num2
    mul bl
    add al, '0'
    mov res, al

    mov ah, 9
    lea dx, resultMul
    int 21h

    mov dl, res
    mov ah, 2
    int 21h

    ; Division
    mov al, num1
    mov ah, 0         ; Clear AH for division
    mov bl, num2
    cmp bl, 0
    je div_by_zero

    div bl            ; AL = quotient, AH = remainder
    add al, '0'
    mov res, al

    mov ah, 9
    lea dx, resultDiv
    int 21h

    mov dl, res
    mov ah, 2
    int 21h

    jmp exit

div_by_zero:
    mov ah, 9
    lea dx, errorDiv
    int 21h

exit:
    mov ah, 4Ch
    int 21h
main endp

end main
