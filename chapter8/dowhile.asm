section .data
data db "hello world", 0
n dq 0
needle db 'w'

section .text
global _start
_start:
push rbp
mov rbp, rsp
sub rsp, 16

mov bl, [needle]
xor ecx, ecx
mov al, [data+rcx]
cmp al, 0
jz end_while

while:
cmp al, bl
je found
inc rcx
mov al, [data+rcx]
cmp al, 0
jnz while

end_while:
mov rcx, -1
found:
mov [n], rcx
mov rax, 1
mov rbx, 0
int 0x80
