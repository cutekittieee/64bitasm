segment .data
x1 dq 0x0ff01ff12ff23ff3
x2 dq 0xef0123456789abcd

segment .text
global _start
_start:
push rbp
mov rbp, rsp
sub rsp, 16

mov rax, [x1]
mov rbx, [x2]

xor rax, rbx
xor rbx, rax
xor rax, rbx

mov [x1], rax
mov [x2], rbx

mov rax, 1
mov rbx, 0
int 0x80
