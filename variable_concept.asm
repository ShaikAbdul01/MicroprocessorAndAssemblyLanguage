.model small
.stack 100h

.data
    prompt db 'Enter a character: $'
    newline db 0Dh, 0Ah, '$'
    user_char db ?         ; Variable to store user input
    message db 'You entered: $'
    result db ' $'

.code
main:
    ; Initialize DS
    mov ax, @data
    mov ds, ax

    ; Display prompt
    mov ah, 09h            ; DOS function to display a string
    lea dx, prompt         ; Load effective address of prompt
    int 21h                ; Call DOS interrupt

    ; Read a character from keyboard
    mov ah, 01h            ; DOS function to read a character from STDIN
    int 21h                ; Call DOS interrupt
    mov user_char, al      ; Store the input character in user_char

    ; Move to new line
    mov ah, 09h            ; DOS function to display a string
    lea dx, newline        ; Load effective address of newline
    int 21h                ; Call DOS interrupt

    ; Display the message
    mov ah, 09h            ; DOS function to display a string
    lea dx, message        ; Load effective address of message
    int 21h                ; Call DOS interrupt

    ; Display the entered character
    mov ah, 02h            ; DOS function to display a character
    mov dl, user_char      ; Move the character from user_char to DL
    int 21h                ; Call DOS interrupt

    ; Move to new line
    mov ah, 09h            ; DOS function to display a string
    lea dx, newline        ; Load effective address of newline
    int 21h                ; Call DOS interrupt

    ; Exit program
    mov ah, 4Ch            ; DOS function to terminate a process
    int 21h                ; Call DOS interrupt

end main
