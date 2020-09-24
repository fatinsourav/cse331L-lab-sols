include 'emu8086.inc'
.model small
.stack 100h
.data
    arr db 1,2,3,7fh,5,6,7,8,0aah,20 ; max is 7fh; aah is negative ;
    len equ $-arr
.code

    main proc
       ;task: find maximum value in an array

        mov ax, @data
        mov ds, ax

        mov cx, len
        lea si, arr
        mov dl, [si] ; dl stores max value; initialise with first value of array

        loop1:
            cmp [si], dl
            jge set_new_max
        after_setting_max:
            inc si
            dec cx
            jnz loop1
            jmp end

        set_new_max:
            mov dl, [si]
            jmp after_setting_max

        end:
        ; dl has max value 7fh = 127 b

        ;print num
        mov dh, 0 ; clear upper byte if theres any random value there
        mov ax, dx ; print_num function prints value in ax reg
        call print_num

        DEFINE_PRINT_NUM
        DEFINE_PRINT_NUM_UNS

    endp main
    end main



