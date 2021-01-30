segment .data
num_i dd 99

segment .bss
fibnum resq 100

segment .text
global _start
_start:
push rbp
mov rbp, rsp
sub rsp, 16

mov ecx, [num_i]
cmp ecx, 0
jz endproc

cmp ecx, 99
jg endproc

cmp ecx, 1
jz set_end

mov rsi, [num_i]
dec ecx
mov rax, 0
mov rbx, 1
process:
mov rdx, rbx
add rdx, rax
mov rax, rbx
mov rbx, rdx
mov rdi, rsi
sub rdi, rcx
add rdi, 1
mov [fibnum+rdi*8], rbx
dec ecx
jnz process
jmp endproc

set_end:
mov rax, 0
mov rbx, 1
mov [fibnum], rax
mov [fibnum+8], rbx

endproc:
mov rax, 1
mov rbx, 0
int 0x80
