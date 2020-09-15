segment .data
a db 0x12
b dw 0xA5A5
c dd 0xF020E826
d dq 0xA0FFE483C26EF47B

segment .text
global _start
_start:
movsx rax, byte [a]
movsx rbx, word [b]
movsxd rcx, dword [c]
mov rdx, [d]

add rax, rbx
add rax, rcx
add rax, rdx

mov [d], rax

mov eax, 1
mov ebx, 0
int 0x80
