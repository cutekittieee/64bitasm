segment .text
global main
main:
push rbp
mov  rbp, rsp
sub  rsp, 16

xor  eax, eax
leave
ret
