segment .data
a dq 151
b dq 310
sum dq 0

segment .text
global _start
_start:
push rbp
mov rbp, rsp
sub rsp, 16

mov rax, 9
add [a], rax
mov rax, [b]
add rax, 10
add rax, [a]
mov [sum], rax

mov eax, 1
mov ebx, 0
int 0x80
