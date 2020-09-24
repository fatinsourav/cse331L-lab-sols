include 'emu8086.inc'
.model small
.stack 100h
.data
    array db 5,2,8,9,12,3
    len equ $-array
.code
    main proc

;task: add even elements of array and store it in dl, add odd elements of array and store it in dh

    ;load data segment address
    mov ax, @data
    mov ds, ax

    lea si, array ; load array starting address into si
    mov dl, 0 ; store sum of even numbers
    mov dh, 0 ; store sum of odd numbers
    mov cx, len ; number of times loop will run

loop_first_part:
    mov al, [si]
    test al, 01h ; check if even
    jz add_to_even
    jmp add_to_odd

add_to_even:
    add dl, al
    jmp loop_second_part
add_to_odd:
    add dh, al
    jmp loop_second_part

loop_second_part:
    inc si
    dec cx
    jnz loop_first_part



    main endp

    end main















