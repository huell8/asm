    section .text
    extern printf

    global _start
_start:
    mov rcx, 0
loop_start:
    push rcx
    mov rsi, rcx
    call print_int
    pop rcx

    inc rcx
    cmp rcx, 10                 ; loop rxc from 0 to 9
    jl loop_start

    mov rax, 0x3c
    xor rdi, rdi
    syscall

print_int:
    ;; print the contents of rsi
    mov rdi, fmt
    xor rax, rax
    call printf
    ret

    section .data
fmt:    db "%i", 10
