include 'emu8086.inc'
.model small
.stack 100h
.data
.code
    main proc
        ;task: work out z = (x-1)^2 + (y-1)^2 and store in a memory location

        ; consider x and y to both be 8 bits
        ; work out z = (10-1)^2 + (20-1)^2
        ;            = 9 * 9 + 19 * 19
         ;           = 442 =  1ba h
        first_term:
            ; store x in al
            mov al, 10
            ; subtract 1
            dec al

            ;square it
            mov bl, al
            mul bl

            ;store first term in cx
            mov cx, ax

        second_term:
            ;store y in al
            mov al, 20
            ;subtract 1
            dec al

            ;square it
            mov bl, al
            mul bl

            ;second term is in ax

        ;add terms
            add ax, cx

        ;store result in memory location
            mov dx, 0000h
            mov ds, dx
            mov bx, 0000h
            mov word ptr ds:[bx], ax




    endp main
    end main






