include 'emu8086.inc'
.model small
.stack 100h
.data
.code

    main proc
        ;task: Write a program to perform multiplication and division of two numbers and put the results in memory.

        ;two numbers: 20, 10

        multiplication:
            mov al, 20
            mov bl, 10
            mul bl ; result is in ax

            ;store in 0000:0000
            mov cx, 0000h
            mov ds, cx
            mov bx, 0000h
            mov word ptr ds:[bx], ax ; result is 16 bits

        division:
            mov ax, 20
            mov bl, 10
            div bl
            ; quotient in al
            ; remainder in ah

            ;store in 0000:0001
            mov cx, 0000h
            mov ds, cx
            mov bx, 0001h
            mov word ptr ds:[bx], ax ; result is 16 bits


    endp main
    end main





