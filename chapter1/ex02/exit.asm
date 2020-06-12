; Program exit

segment .text
global main

main:
mov eax, 1
mov ebx, 5
int 0x80
