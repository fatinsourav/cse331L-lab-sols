include 'emu8086.inc'
.model small
.stack 100h
.data
.code

    main proc
       ;task: take input string, insert space if none found after comma

        mov dx, 100 ; max string/buffer size
        call GET_STRING ; string stored with starting address in di

        ; print new line
        putc 0ah
        putc 0dh

        putc [di] ; print first character
        inc di

        loop1:
            cmp [di-1], ',' ; if previous character is comma
            je prev_comma
        inside_loop:
            putc [di]
            inc di
            cmp [di], 00h ; if current character is null then break
            jne loop1
            jmp end;

        prev_comma:
            cmp [di], ' '
            jne insert_space ; if not equal, then space not found after comma
            jmp inside_loop

        insert_space:
            putc ' '
            jmp inside_loop

        end:
            hlt

        DEFINE_GET_STRING
    endp main
    end main
