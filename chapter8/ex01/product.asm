segment .data
x1 dd 2,3,4,5,6
x2 dd 1,2,3,4,5
num dd 5
product dq 0

segment .text
global _start
_start:
push rbp
mov rbp, rsp
sub rsp, 16

xor rdi, rdi
mov ecx, [num]
cmp ecx, 0
jz endproc

process:
mov eax, [x1+ecx*4-4]
mov ebx, [x2+ecx*4-4]
imul ebx
mov rsi, 0
shl rdx, 32
or rsi, rdx
or rsi, rax
add rdi, rsi
dec ecx
jnz process
mov [product], rdi

endproc:
mov rax, 1
mov rbx, 0
int 0x80
