segment .data
str1 db "sthamazingamazingsth", 0

segment .bss
str2 resb 100

segment .text
global _start
_start:
push rbp
mov rbp, rsp
sub rsp, 16

xor rbx, rbx
xor rdx, rdx

process:
mov rcx, rbx
mov al, [str1+rcx]
cmp al, 0
jz endproc

cmp al, 'a'
jnz copy
inc rcx
cmp byte [str1+rcx], 'm'
jnz copy
inc rcx
cmp byte [str1+rcx], 'a'
jnz copy
inc rcx
cmp byte [str1+rcx], 'z'
jnz copy
inc rcx
cmp byte [str1+rcx], 'i'
jnz copy
inc rcx
cmp byte [str1+rcx], 'n'
jnz copy
inc rcx
cmp byte [str1+rcx], 'g'
jnz copy

replace:
mov byte [str2+rdx], 'i'
inc rdx
mov byte [str2+rdx], 'n'
inc rdx
mov byte [str2+rdx], 'c'
inc rdx
mov byte [str2+rdx], 'r'
inc rdx
mov byte [str2+rdx], 'e'
inc rdx
mov byte [str2+rdx], 'd'
inc rdx
mov byte [str2+rdx], 'i'
inc rdx
mov byte [str2+rdx], 'b'
inc rdx
mov byte [str2+rdx], 'l'
inc rdx
mov byte [str2+rdx], 'e'
inc rdx
inc rcx
mov rbx, rcx
jmp process

copy:
mov [str2+rdx], al
inc rdx
inc rbx
jmp process

endproc:
mov byte [str2+rdx], 0

mov rax, 1
mov rbx, 0
int 0x80
