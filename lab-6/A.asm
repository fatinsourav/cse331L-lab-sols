include 'emu8086.inc'
.model small
.stack 100h
.data
    ;4x3 matrix
    matrix  db 1,2,3
            db 4,5,6
            db 7,8,9
            db 10,11,12

    transpose   db 4 dup (?)
                db 4 dup (?)
                db 4 dup (?)

.code

    ;task : calculate tranpose of a given matrix

    main proc

    mov ax, @data
    mov ds, ax

    lea si, matrix
    lea di, transpose
    mov cx, 3

loop1:

    mov dx, 4 ; second loop counter
    mov bx, 0 ; stores increment to add to si

    loop2:
        mov ax, [si + bx]
        mov [di], ax
        inc di
        add bx, 3
        dec dx
        jnz loop2


    inc si
    dec cx
    jnz loop1


    ;transpose matrix now has 1,4,7,10, 2,5,8,11, 3,6,9,12

    endp main
    end main



