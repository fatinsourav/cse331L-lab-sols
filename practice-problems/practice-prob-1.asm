include 'emu8086.inc'
.model small
.stack 100h
.data
    array db 6,3,1,4,0,8,9,2,7,5
    odd db 5 dup (?)
    even db 5 dup (?)
.code
    main proc

;task: store even indexed elements of array into even, and odd indexed elements of array into odd

    ;load data segment address
    mov ax, @data
    mov ds, ax

    lea si, array ; load array starting address
    lea di, odd ; load odd array starting address
    lea bx, even ; load even array starting address
    mov cx, 10 ; counter

loop_first_part:
    test cx, 0001h ; check lsb for parity (even/odd)
    jz store_in_even ; if cx even store in even array
    jmp store_in_odd  ; else store in odd array

store_in_even:
    mov al, [si]
    mov [bx], al
    inc bx
    inc si
    jmp loop_second_part

store_in_odd:
    mov al, [si]
    mov [di], al
    inc di
    inc si
    jmp loop_second_part

loop_second_part:
    dec cx
    jnz loop_first_part
    jmp end

end:


    main endp

    end main














