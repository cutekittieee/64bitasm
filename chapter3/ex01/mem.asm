segment .data
a times 10 db 0
c db "hello world", 0

segment .bss
b resw 5

segment .text
global main
main:
push rbp
mov  rbp, rsp
sub  rsp, 16

xor  eax, eax
leave
ret
