    section .text
    extern printf

    global _start
_start:
    mov rcx, 0x10
    push rbx                    ; save rbx because we use it

    xor rax, rax                ; current number
    xor rbx, rbx                ; one before
    inc rax

loop_start:
    push rax                    ; save rax and rcx since they get messed up by printf
    push rcx

    ;; call printf("%d\n", rax)
    mov rdi, format
    mov rsi, rax
    xor rax, rax
    call printf

    pop rcx                     ; resotore pre-printf register state
    pop rax

    mov rdx, rbx                ; calculate next fib num
    mov rbx, rax
    add rax, rdx

    dec rcx
    jnz loop_start              ; jump if zero flag set from dec r11

    ;; return 0
    pop rbx                     ; recover rbx state
    mov rax, 0x3c
    xor rdi, rdi
    syscall

    section .data
format:    db "%d", 10, 0
