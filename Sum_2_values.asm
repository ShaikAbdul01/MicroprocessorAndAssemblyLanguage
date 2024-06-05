.model small
.stack 100h

.data 
    first db "Enter First Number: $"
    second db 13,10,"Enter Second Number: $"
    sum db 13,10,"The Summation Is: $"
    a db ?
    b db ?
    result db 0

.code 

main proc
    ; Initialize DS
    mov ax, @data
    mov ds, ax

    ; Display first prompt and read first number
    mov ah, 09h
    lea dx, first       ; Print first string
    int 21h  

    mov ah, 01h         ; Input a number
    int 21h
    sub al, 30h         ; Convert ASCII to numeric value
    mov a, al           ; Store in variable a

    ; Display second prompt and read second number
    mov ah, 09h
    lea dx, second      ; Print second string
    int 21h 

    mov ah, 01h         ; Input b number
    int 21h
    sub al, 30h         ; Convert ASCII to numeric value
    mov b, al           ; Store in variable b

    ; Calculate sum
    mov al, a           ; Load a into al
    add al, b           ; Add b to al
    add al, 30h         ; Convert result back to ASCII
    mov result, al      ; Store result

    ; Display sum string
    mov ah, 09h
    lea dx, sum         ; Print sum string
    int 21h 

    ; Display the result
    mov dl, result
    mov ah, 02h  
    int 21h                    

    ; Exit program
    mov ah, 4Ch
    int 21h

main endp
end main
