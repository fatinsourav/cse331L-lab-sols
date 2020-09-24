include 'emu8086.inc'
.model small
.stack 100h
.data
    input_string db 100 dup (?)
    starting_pos dw 00h
.code

    ;task : read string and character, output position of character in string
    main proc

        mov ax, @data
        mov ds, ax

        mov dx, 100 ; max buffer/string size
        call get_string ; take input which has starting address at ds:di

        ;print new line
        putc 0ah
        putc 0dh

        ;get character
        mov ah, 1
        int 21h

        mov starting_pos, di ; store starting pos to find position later

        loop1:
            mov bl, [di]
            inc di
            cmp bl, al
            je character_found
            cmp bl, 00h ; see if null found
            jne loop1
            jmp out_of_loop

            character_found:
                ;print newline
                putc 0ah
                putc 0dh

                ;print position (using 1 based-indexing)
                mov dx, di
                sub dx, starting_pos
                add dx, '0' ; to get ascii value
                mov ah, 2 ; dl has position so output it
                int 21h
                jmp end

       out_of_loop:
             ;print new line
             putc 0ah
             putc 0dh

            ; character not found, output 'N'
            mov ah, 2
            mov dl, 'N'
            int 21h
       end:
            mov ah, 4ch; return control to dos
            int 21h

        DEFINE_GET_STRING
    endp main
    end main
