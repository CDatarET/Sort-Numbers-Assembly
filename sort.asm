section .data
    numArray db 12, 62, 24, 22, 26
    arrayLen equ 5
    msg db "sorted array is- ", 10
    msgLen equ $-msg
    fmt db "%d ", 0

section .bss
    output resb 3

%macro rw 4
    mov rax, %1
    mov rdi, %2
    mov rsi, %3
    mov rdx, %4
    syscall
%endmacro

section .text
    global main
    extern printf
main:
    mov rcx, arrayLen
    outerLoop:
        dec rcx
        mov rsi, 0
        innerLoop:
            mov al, [numArray + rsi]
            mov bl, [numArray + rsi + 1]
            cmp al, bl
            jbe skip
            mov [numArray + rsi], bl
            mov [numArray + rsi + 1], al

            skip:
                inc rsi
                cmp rsi, rcx
                jl innerLoop
                cmp rcx, 1
                jg outerLoop

    rw 1, 1, msg, msgLen

    xor rbx, rbx
    print_loop:
        cmp rbx, arrayLen
        jge done

        movzx eax, byte [numArray + rbx]
        mov esi, eax
        mov rdi, fmt
        xor eax, eax
        call printf

        inc rbx
        jmp print_loop

    done:
        mov eax, 0
