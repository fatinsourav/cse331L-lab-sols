include 'emu8086.inc'
.model small
.stack 100h
.data
    array db 1,2,3,4,5
    len equ $-array
    found_message db 'Value found$'
    not_found_message db 'Value not found$'
.code
    main proc

    ;task: search for an element in the array and print 'value found' if found else print 'value not found'

    mov ax, @data
    mov ds, ax

    lea si, array
    mov al, 33 ; value to search for

    mov cx, len
loop:
    mov dl, [si]
    cmp al, dl ; check if current element equal to al
    je value_found ; found
    inc si
    dec cx
    jnz loop

    jmp value_not_found ; not found

value_found:
    lea dx, found_message
    mov ah, 9
    int 21h
    jmp end
value_not_found:
    lea dx, not_found_message
    mov ah, 9
    int 21h

end:
    ;return control to dos
    mov ah, 4ch
    int 21h

    main endp

    end main

