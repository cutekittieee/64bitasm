segment .data
x1 dq 5
y1 dq 15
x2 dq 12
y2 dq 2
xdiff dq 0
ydiff dq 0

segment .text
global _start
_start:
push rbp
mov rbp, rsp
sub rsp, 16

mov rax, [y1]
mov rbx, [y2]
sub rax, rbx
mov rbx, rax
neg rax
cmovs rax, rbx
mov [ydiff], rax

mov rax, 1
mov rbx, 0
mov rcx, [x1]
mov rdx, [x2]
sub rcx, rdx
cmovnz rax, rbx
mov rdx, rcx
neg rcx
cmovs rcx, rdx
mov [xdiff], rcx

mov eax, 1
mov ebx, 0
int 0x80
