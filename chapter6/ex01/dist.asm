segment .data
x1 dq 5
y1 dq 15
x2 dq 12
y2 dq 2
dsqrt dq 0

segment .text
global _start
_start:
push rbp
mov rbp, rsp
sub rsp, 16

mov rax, [x1]
mov rbx, [x2]
sub rax, rbx
imul rax

mov rcx, [y1]
mov rdx, [y2]
sub rcx, rdx
imul rcx, rcx

add rax, rcx
mov [dsqrt], rax

mov eax, 1
mov ebx, 0
int 0x80
