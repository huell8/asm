    section .text
    global _start
_start:
    ;; for i = 0; i < 64; i++
    ;;     array[i] = i
    mov ecx, 0                  ; loop rcx <0, array_s)
loop_array:
    mov DWORD [array + rcx], ecx
    inc ecx
    cmp ecx, array_s
    jl loop_array

    mov rax, 0x3c               ; syscall 60 - sys_exit
    xor rdi, rdi                ; return 0
    syscall

    section .bss                ; section bss inits reserved space to 0s
array_s:    equ     0x40
array:      resw    0x40        ; declare byte array[64]
