segment .data
data dq 0xfedcba9876543210
sum dq 0

segment .text
global _start
_start:
push rbp
mov rbp, rsp
sub rsp, 16

mov rax, [data]
xor ebx, ebx
xor ecx, ecx
xor edx, edx

while:
cmp rcx, 64
jnl end_while
bt rax, 0
setc bl
add edx, ebx
shr rax, 1
inc rcx
jmp while

end_while:
mov [sum], rdx

mov rax, 1
mov rbx, 0
int 0x80
