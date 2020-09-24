include 'emu8086.inc'
.model small
.stack 100h
.data
.code

    main proc
       ;task: convert dec to binary

        mov al, 99 ; number to print in binary; 99 d = 0110 0011 b
        mov cx, 8;

        loop1:
            shl al, 1 ; move msb into carry flag
            mov bl, 0 ; clear bl
            rcl bl, 1 ; move msb out of carry flag into bl to print
            add bl, '0' ; to get ascii value
            putc bl ; print
            dec cx
            jnz loop1

    endp main
    end main





