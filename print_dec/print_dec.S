	section .text
	global _start
_start:
	mov rdi, 0xffffffff
	call print_dec

	mov rax, 0x3c			; sys_exit
	xor rdi, rdi			; return 0
	syscall
	
print_dec:					; print rdi as unsigned decimal int to stdout
	push rbp				; save bcs we use it
	mov rbp, rsp			; set base pointer

	mov rax, rdi			; mov to rax so it can get divided
	mov r11, 10
p_d_loop:
	xor rdx, rdx			; rdx=0 for div to work :/
	div r11					; rax = rax/10, rdx = rax%10
	add rdx, 0x30			; int to ascii char
	mov byte [rsp], dl
	dec rsp
	cmp rax, 0				; divide by 10 untill ratio > 0
	jg p_d_loop
	
	mov rax, 1				; sys_write
	mov rdi, 1				; stdout
	lea rsi, [rsp+1]		; rsp+1 -> first meaningful character
	mov rdx, rbp
	sub rdx, rsp			; rbp-rsp -> length
	syscall

	mov rsp, rbp			; pop rsp
	pop rbp
	ret
