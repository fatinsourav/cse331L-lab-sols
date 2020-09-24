include 'emu8086.inc'
.model small
.stack 100h
.data
    arr1 db 1,2,3,4,5,6,7
    arr2 db 7,6,5,4,3,2,1
    len equ $-arr1
    res db len dup (?)
.code

    main proc
       ;task: add two arrays and store result in a third array

       mov ax, @data
       mov ds, ax

       lea si, arr1
       lea di, arr2
       lea bx, res
       mov cx, len

       loop1:
            mov dl, [si]
            add dl, [di]
            mov [bx], dl
            inc si
            inc di
            inc bx
            dec cx
            jnz loop1


    endp main
    end main




