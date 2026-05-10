; beacon.asm
; by Ky9oss

format ELF64 executable 3

entry start

segment readable executable

macro printf buf,len
{
    ; write(1, message, message_len)
    mov     rax, 1          ; sys_write
    mov     rdi, 1          ; stdout
    mov     rsi, buf
    mov     rdx, len
    ; syscall rax: search in https://filippo.io/linux-syscall-table
    syscall
}

start:

    printf hello.data, hello.length
    ; exit(0)
    mov     rax, 60         ; sys_exit
    xor     rdi, rdi
    syscall


segment readable writable

struc message data,length
{
    .data db data, length
    .length dw length
}

hello message "h3ll0 beacon.asm", 16

; message db "hello beacon.asm", 16
; message_len = $ - message
