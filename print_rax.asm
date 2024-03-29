section .data
codes: db '0123456789ABCDEF'

section .text

global _start

_start:
	; numero 1122 em hexa
	mov rax, 0x10012343F

	mov rdi, 1
	mov rdx, 1
	mov rcx, 64

.loop:
	push rax
	sub rcx, 4
	sar rax, cl
	and rax, 0xf

	lea rsi, [codes + rax]
	mov rax, 1

	push rcx
	syscall
	pop rcx

	pop rax

	test rcx, rcx
	jnz .loop

	mov rax, 60
	xor rdi, rdi
	syscall
