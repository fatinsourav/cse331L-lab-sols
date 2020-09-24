include 'emu8086.inc'
.model small
.stack 100h
.data
    string db 'A random string$'
.code
    main proc

    ; task: count number of characters in a string

    mov ax, @data
    mov ds, ax

    mov cx, 100 ; assume len is between 1 and 100 (1 <= len <= 100)
    lea si, string; load string address
    mov al, 0  ; will store length of string
top:
    mov dl, [si]
    cmp dl, '$'   ; if current character is '$', then exit
    je out_of_loop
    inc si
    inc al
    loop top

out_of_loop:
    ;al contains number of characters (excluding $)

    main endp

    end main

