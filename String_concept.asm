.model small
.stack 100h

.data
    msg db "Hello World $"
    msg1 db "EMU 8086 $"

.code
main proc
    ; Initialize DS
    mov ax, @data
    mov ds, ax

    ; Display first message
    lea dx, msg
    mov ah, 09h
    int 21h

    ; Move to new line
    mov ah, 02h
    mov dl, 0Dh    ; Carriage return
    int 21h
    mov dl, 0Ah    ; Line feed
    int 21h

    ; Display second message
    lea dx, msg1
    mov ah, 09h
    int 21h

    ; Exit program
    mov ah, 4Ch    ; DOS function to terminate a process
    int 21h

main endp
end main
