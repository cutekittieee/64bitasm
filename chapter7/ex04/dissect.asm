segment .data
x1 dq -318382.15
sign_bit dq 0
exp_val dq 0
fract_val dq 0

segment .text
global _start
_start:
push rbp
mov rbp, rsp
sub rsp, 16

mov rax, [x1]
mov rbx, rax
rol rbx, 1
and rbx, 1
mov [sign_bit], rbx

mov rbx, rax
rol rbx, 12
and rbx, 0x7ff
sub rbx, 1023
mov [exp_val], rbx

mov rbx, rax
ror rbx, 32
and rbx, 0xfffff
or rbx, 0x100000
shl rbx, 32
mov [fract_val], rbx

mov rbx, rax
shl rbx, 32
shr rbx, 32
or [fract_val], rbx

mov rax, 1
mov rbx, 0
int 0x80
