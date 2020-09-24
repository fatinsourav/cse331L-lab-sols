include 'emu8086.inc'
.model small
.stack 100h
.data
.code

    main proc

        ;task: calculate number of 1 bits in a number

        mov ax, 0feh ; 1111 1110 - has 7 ones

        mov cx, 16 ; 16 bits to check through
        mov bx, 0 ;
        mov dx, 0 ; stores count of ones
    loop1:
        shr ax,1 ; move lsb of ax into cf flag
        mov bx, 0 ; clear bx
        rcl bx,1 ; mov cf flag value into lsb of bx
        add dx, bx ; add lsb of bx to dx
        dec cx
        jnz loop1



    endp main
    end main

