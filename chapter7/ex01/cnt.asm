segment .data
x1 db 01010011b

segment .text
global _start
_start:
push rbp
mov rbp, rsp
sub rsp, 16

xor rax, rax
xor rbx, rbx
xor rcx, rcx
mov rax, [x1]
mov rbx, rax
and rbx, 1
add rcx, rbx
shr rax, 1

mov rbx, rax
and rbx, 1
add rcx, rbx
shr rax, 1

mov rbx, rax
and rbx, 1
add rcx, rbx
shr rax, 1

mov rbx, rax
and rbx, 1
add rcx, rbx
shr rax, 1

mov rbx, rax
and rbx, 1
add rcx, rbx
shr rax, 1

mov rbx, rax
and rbx, 1
add rcx, rbx
shr rax, 1

mov rbx, rax
and rbx, 1
add rcx, rbx
shr rax, 1

mov rbx, rax
and rbx, 1
add rcx, rbx

mov rax, 1
mov rbx, 0
int 0x80
