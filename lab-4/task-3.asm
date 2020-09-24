include 'emu8086.inc'
.model small
.stack 100h
.data
    string db 'racecar'
    len equ $-string
    yes db 0ah, 0dh, 'YES$' ; new line and yes
    no db 0ah, 0dh, 'NO$' ; new line and no

.code
    main proc

    ; task: check if a string is a palindrome

    mov ax, @data
    mov ds, ax

    mov cx, len
    lea si, string ; store starting index of string in si
    lea di, string
    add di, len
    sub di, 1 ; store last index (len - 1) into di
loop:
    mov al, [si]
    mov bl, [di]
    cmp al, bl
    jne not_palindrome; if not equal, then not palindrome
    inc si
    dec di
    dec cx
    jnz loop

palindrome:
    ;print yes
    lea dx, yes
    mov ah, 9
    int 21h
    jmp end

not_palindrome:
    ;print no
    lea dx, no
    mov ah, 9
    int 21h

end:
    ;return control to dos
    mov ah, 4ch
    int 21h

    main endp

    end main


