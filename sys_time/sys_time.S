    section .text
    extern printf
    global _start
_start:
    mov rax, 201                ; sys_time
    mov rdi, time               ; time_t *tloc
    syscall

    mov rsi, QWORD [time]       ; printf("%d\n", *time)
    mov rdi, int_endl
    xor rax, rax
    call printf

    mov rax, 60                 ; sys_exit
    xor rdi, rdi                ; return 0
    syscall

    section .data
int_endl:    db    "%d",10,0
time:        dq    0
