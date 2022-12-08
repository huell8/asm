        SECTION .data
msg:    db "Hello, world!", 0
fmt:    db "%s", 10, 0

        SECTION .text
        extern printf
        global _start
_start:
        ;; printf(fmt, msg);
        mov rdi, fmt
        mov rsi, msg
        xor rax, rax            ; printf is varargs
        call printf

        mov rax, 0x3c           ; sys_exit
        xor rdi, rdi            ; return 0
        syscall
