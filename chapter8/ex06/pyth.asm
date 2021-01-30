segment .data
num_a dd 0
num_b dd 0
num_c dd 97

segment .text
global _start
_start:
push rbp
mov rbp, rsp
sub rsp, 16

mov ecx, [num_c]
cmp ecx, 0
jz endproc
mov eax, ecx
imul eax
mov ecx, eax

mov esi, 1
mov edi, 1
process:
mov eax, esi
imul eax
cmp eax, ecx
jge endproc
mov ebx, eax
mov eax, edi
imul eax
add eax, ebx
cmp eax, ecx
jz finproc
sub eax, ebx
cmp eax, ecx
jge reinit
inc edi
jmp process

reinit:
inc esi
mov edi, 1
jmp process

finproc:
mov [num_a], esi
mov [num_b], edi

endproc:
mov rax, 1
mov rbx, 0
int 0x80
