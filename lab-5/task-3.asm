include 'emu8086.inc'
.model small
.stack 100h
.data
    fib dw 50 dup (?)
.code
    find_next_fib proc
        inc si
        inc si
        mov ax, [si-4]
        add ax, [si-2]
        mov [si], ax
        ret
    endp find_next_fib

    main proc
        ;task:   Write a program, in assembly language, that will generate the first 23 Fibonacci Numbers.
                ;Assume that the first two numbers are included. Use loop and procedure.


            mov ax, @data
            mov ds, ax

            lea si, fib
            ; set fib[0] = fib[1] = 1
            mov [si], 1
            inc si
            inc si
            mov [si], 1

            mov cx, 21 ; first two already set, 21 left to find


         loop1:
            call find_next_fib
            dec cx
            jnz loop1


         mov ax, [si] ; mov value of last element into ax
                      ; ax should be fib(23) = 28657 = 6ff1 h

    endp main
    end main








