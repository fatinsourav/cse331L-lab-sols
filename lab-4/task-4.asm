include 'emu8086.inc'
.model small
.stack 100h
.data
    msg db 0ah, 0dh, 'They are the same$'  ; new line and message
    input1 db 100 dup (?) ; first input (assume len <= 100)
    input2 db 100 dup (?) ; second input (assume len <= 100)
    new_line db 0ah, 0dh, '$'
.code
    main proc

        mov ax, @data
        mov ds, ax

        ; to take string input, keep reading characters, until carriage return (0dh) is encountered.


    ;take first input
        lea si, input1
    while1:
        mov ah,1
        int 21h
        cmp al, 0dh
        je end_while1 ; if 0dh, then stop reading
        mov [si], al
        inc si
        jmp while1

    end_while1:
        mov [si], '$' ; add '$' to end of string

    ; print new line after first input
        lea dx, new_line
        mov ah, 9
        int 21h

    ;take second input
        lea si, input2
    while2:
        mov ah, 1
        int 21h
        cmp al, 0dh
        je end_while2 ; if 0dh, then stop reading
        mov [si], al
        inc si
        jmp while2
    end_while2:
        mov [si], '$' ; add $ to the end of string

        ;print new line after taking second input
        lea dx, new_line
        mov ah, 9
        int 21h

    ; compare:
        ; if a position is found, where input1[pos] > input2[pos] (or the other way around),
        ; then the string with the higher character is lexicographically larger

        ; if both strings are the same until a position where one string ends
        ; then the string with the larger length is lexicographically larger
        ; e.g. input1:  abcdefg -> this is larger because 'e' > NULL in ascii
        ;      input2:  abcd

        lea si, input1
        lea di, input2
    while3:
        ;first check if '$' is current character of either string
        cmp [si], '$'
        je end_character_found
        cmp [di], '$'
        je end_character_found

        ; check if input1[si] > input2[di]
        mov al, [si]
        cmp al, [di]
        jg input1_greater
        jl input2_greater

        ; at this point, both characters are the same
        inc si
        inc di
        jmp while3

    end_character_found:
        ; two cases:
            ; input1's current character is '$' and input2's current character is '$'
                ; which means both are same
            ;else
                ; whichever string does not have '$' as its current character, is the larger one

        cmp [si], '$'
        jne input1_greater
        cmp [di], '$'
        jne input2_greater
        jmp same

    input1_greater:
        ;print input1
        lea dx, input1
        mov ah, 9
        int 21h
        jmp end
    input2_greater:
        ;print input2
        lea dx, input2
        mov ah, 9
        int 21h
        jmp end
    same:
        ;print 'they are the same'
        lea dx, msg
        mov ah, 9
        int 21h
        jmp end


    end:
        ;return control to DOS
        mov ah, 4ch
        int 21h

    main endp
    end main




