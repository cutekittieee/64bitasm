segment .data
switch: dq _start.case0
	dq _start.case1
	dq _start.case2
i:	dq 2
segment .text
global _start
_start:
mov rax, [i]
jmp [switch+rax*8]
.case0:
mov rbx, 100
jmp .end
.case1:
mov rbx, 101
jmp .end
.case2:
mov rbx, 102
.end:

mov rax, 1
mov rbx, 0
int 0x80
