segment .data
a dq 175
b dq 0x1001
c dq -295
d dq -1

segment .text
global _start
_start:
mov rax, [a]
mov rbx, [b]
mov rcx, [c]
mov rdx, [d]

add rax, rbx
add rax, rcx
add rax, rdx

mov rax, 1
mov rbx, 0
int 0x80
