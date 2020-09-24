include 'emu8086.inc'
.model small
.stack 100h
.data
    array db 1,2,2,3,3,3,3,3,3,4,5,6,7,8,9,9,9,10,10,10
    frequency db 11 dup (0) ; size is 11 after including 0
.code

    main proc
        ;task: given an array, create a frequency array with the values of the given array

        mov ax, @data
        mov ds, ax

        lea si, array
        lea di, frequency

        mov cx, 20

    loop1:
        mov ax, 0
        mov al, [si]
        add di, ax
        inc [di]
        sub di, ax
        inc si
        dec cx
        jnz loop1

     ; marks:    0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10
     ; frequency 0 | 1 | 2 | 6 | 1 | 1 | 1 | 1 | 1 | 3 | 3

    endp main
    end main










