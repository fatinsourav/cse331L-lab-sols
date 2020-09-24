include 'emu8086.inc'
.model small
.stack 100h
.data
    string1 db 'Hello World,'
    len1 equ $-string1
    string2 db 'this is Assembly Language Programming'
    len2 equ $-string2
    string3 db 100 dup (?)

.code
    main proc

    ; task: concatenate string1 and string2 and store it in string3

        mov ax, @data
        mov ds, ax

        lea si, string1
        lea di, string2
        lea bx, string3
        mov cx, len1
    ; transfer string1 to string3 in loop1
    loop1:
        mov al, [si]
        mov [bx], al
        inc bx
        inc si
        dec cx
        jnz loop1

        mov cx, len2
    ;transfer string2 to string3
    loop2:
        mov al, [di]
        mov [bx], al
        inc bx
        inc di
        dec cx
        jnz loop2


        mov [bx], '$'; add '$' at the end of string3

    ;output string3
        lea dx, string3
        mov ah, 9
        int 21h

    main endp

    end main
