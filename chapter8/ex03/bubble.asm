segment .data
numbers dd 99,53,61,14,22
len dd 5

segment .text
global _start
_start:
push rbp
mov rbp, rsp
sub rsp, 16

mov edi, [len]
cmp edi, 2
jl endproc

init_proc:
mov ecx, 1
mov edx, 0
process:
dec ecx
mov eax, [numbers+ecx*4]
inc ecx
mov ebx, [numbers+ecx*4]
cmp eax, ebx
jle cont
mov [numbers+ecx*4], eax
dec ecx
mov [numbers+ecx*4], ebx
inc ecx
mov edx, 1
cont:
inc ecx
cmp ecx, edi
jl process
cmp edx, 1
jz init_proc

endproc:
mov rax, 1
mov rbx, 0
int 0x80
