segment .data
x1 dd 2.25
x2 dd 12.75
product dq 0

segment .text
global _start
_start:
push rbp
mov rbp, rsp
sub rsp, 16

mov eax, [x1]
mov ebx, [x2]
mov rcx, rbx
and rcx, rax
and rcx, 0x7f800000
jz endproc

mov rdx, rax
xor rdx, rbx
and rdx, 0x80000000
shl rdx, 32

and rax, 0x7f800000
shr rax, 23
and rbx, 0x7f800000
shr rbx, 23
add rax, rbx
add rax, 769
rol rdx, 12
add rdx, rax
ror rdx, 12

mov eax, [x1]
mov ebx, [x2]
and rax, 0x7fffff
or rax, 0x800000
and rbx, 0x7fffff
or rbx, 0x800000
mov rcx, rdx
mul rbx

mov rdx, rcx
mov cl, 0
cont:
inc cl
mov rbx, rax
rol rbx, cl
and rbx, 1
jz cont

shl rax, cl
shr rax, 12
add rdx, rax

mov [product], rdx

endproc:
mov rax, 1
mov rbx, 0
int 0x80
