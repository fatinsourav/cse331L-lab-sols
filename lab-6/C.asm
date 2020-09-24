include 'emu8086.inc'
.model small
.stack 100h
.data
    min db 07fh
    max db 00h
    average db 00h
    newline db 0ah,0dh,'$'
.code

    ;task : read 16 digits from input, output the average, maximum and minimum
    main proc

        mov ax, @data
        mov ds, ax

        mov cx, 16


        loop1:
                    mov ah, 1
                    int 21h
                    sub al, '0' ; subtract value of '0' to get numerical value

                    add average, al ; add al to average

                    mov dl, min
                    cmp al, dl
                    jle set_min
        after_setting_min:

                    mov dl, max
                    cmp al, dl
                    jge set_max
        after_setting_max:

                    ;output space
                    mov ah, 2
                    mov dl, ' '
                    int 21h

                    dec cx
                    jnz loop1
                    jmp end

                    set_min:
                        mov min, al
                        jmp after_setting_min

                    set_max:
                        mov max, al
                        jmp after_setting_max


        end:
            mov al, average
            shr al, 4 ; divide by 2^4=16

            ;convert average, max, and min to their ascii values to output
            add al, '0'
            mov average, al

            mov al, min
            add al, '0'
            mov min, al

            mov al, max
            add al, '0'
            mov max, al

            ;print new line
            mov ah, 9
            lea dx, newline
            int 21h

            ;output
            putc  average
            putc max
            putc min


            mov ah, 4ch ;return control to dos
            int 21h

        DEFINE_PRINT_NUM
        DEFINE_PRINT_NUM_UNS
    endp main
    end main






