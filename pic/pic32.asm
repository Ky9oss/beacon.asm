format binary
use32

start:
    jmp short get_data     

shellcode:
    pop esi                 

    ; sys_write
    mov eax, 4
    mov ebx, 1
    mov ecx, esi
    mov edx, msg_len
    int 0x80

    ; sys_exit
    mov eax, 1
    xor ebx, ebx
    int 0x80

get_data:
    call shellcode

message db '---[PIC-86]---', 0x0A
msg_len = $ - message
