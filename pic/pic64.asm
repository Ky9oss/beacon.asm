format binary
use64

start:
    mov rax, 1 
    mov rdi, 1
    lea rsi, [rip + message - $] 
    mov rdx, msg_len
    syscall

    mov rax, 60 ; sys_exit
    xor rdi, rdi
    syscall

message db '---[PIC-x64]---', 0x0A
msg_len = $ - message
