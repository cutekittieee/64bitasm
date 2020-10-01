segment .data
a dq 52
b dq 10
c dq 36
d dq 71
cnt dq 4
avg dq 0
rem dq 0

segment .text
global _start
_start:
push rbp
mov rbp, rsp
sub rsp, 16

mov rax, [a]
add rax, [b]
add rax, [c]
add rax, [d]
mov rdx, 0
idiv qword [cnt]
mov [avg], rax
mov [rem], rdx

mov rax, 1
mov rbx, 0
int 0x80
