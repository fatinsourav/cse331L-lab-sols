include 'emu8086.inc'
.model small
.stack 100h
.data
    one db 1,2,3,4,5
    two db 5 dup (?)
.code
    main proc

    ;task: copy the contents of one to two in reverse order


        mov ax, @data
        mov ds, ax

        lea si, one
        lea di, two

        mov ax, [si+4]
        mov [di], ax

        mov ax, [si+3]
        mov [di+1], ax

        mov ax, [si+2]
        mov [di+2], ax

        mov ax, [si+1]
        mov [di+3], ax

        mov ax, [si+0]
        mov [di+4], ax

    main endp

    end main
