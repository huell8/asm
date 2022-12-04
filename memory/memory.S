section .text
    extern printf

    global _start
_start:


    mov rax, 0x3c
    xor rdi, rdi
    syscall
