segment .data
kwhcost dq 19
kwhused dq 1273
amtdollar dq 5
amtpenny dq 0

segment .text
global _start
_start:
push rbp
mov rbp, rsp
sub rsp, 16

mov rax, [kwhused]
sub rax, 1000
imul qword [kwhcost]
mov rdx, 0
mov rcx, 100
idiv rcx
add [amtdollar], rax
mov [amtpenny], rdx

mov rax, 1
mov rbx, 0
int 0x80
