include 'emu8086.inc'
.model small
.stack 100h
.data
.code
    main proc

    ;task: take an input and print it to console

    mov ah, 1
    int 21h
    ;input is now in al

    mov dl, al ; move al to dl for printing
    mov ah, 2
    int 21h

    ;return control to dos
    mov ah, 4ch
    int 21h

    main endp

    end main
