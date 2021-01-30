segment .data
str1 db "sampletext", 0
is_eq dd 1

segment .text
global _start
_start:
push rbp
mov rbp, rsp
sub rsp, 16

lea rdi, [str1]
cld
mov rcx, -1
xor al, al
repne scasb
mov rax, -2
sub rax, rcx
cmp rax, 0
jz endproc

xor rbx, rbx
dec rax
process:
mov cl, [str1+rbx]
mov dl, [str1+rax]
cmp cl, dl
jnz set_end
mov cl, al
sub cl, bl
cmp cl, 2
jl endproc
inc bl
dec al
jmp process

set_end:
mov ecx, 0
mov [is_eq], ecx

endproc:
mov rax, 1
mov rbx, 0
int 0x80
