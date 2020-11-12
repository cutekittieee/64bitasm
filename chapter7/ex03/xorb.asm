segment .data
x1 dq 0x1fe742a5c1a4ff0e

segment .text
global _start
_start:
push rbp
mov rbp, rsp
sub rsp, 16

mov rcx, 7
mov rax, [x1]
mov rbx, rax

cont:
ror rax, 8
xor rbx, rax
dec rcx
jnz cont

and rbx, 0xff

mov rax, 1
mov rbx, 0
int 0x80
