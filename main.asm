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

macro sys_exit
{
    ; exit(0)
    mov     rax, 60         ; sys_exit
    xor     rdi, rdi
    syscall
}

; -------------------------------
; MACRO get_self_name
; -------------------------------
; PARAM nil
; -------------------------------
; RETURN -> stack
; -------------------------------
; STACK
; low address
; ┌───────────┐
; │path + '\0'│◄───rsp-256
; │...        │
; │...        │◄───rsp
; └───────────┘
; high address
; -------------------------------
; REF_CODE
; char buffer[256];
; if (-1 == (readlink("/proc/self/exe", buffer, sizeof(buffer)))) {
;     printf("error\n");
; }
; -------------------------------
macro get_self_name
{
    mov     rax, 89
    mov     rdi, proc_self_exe
    lea     rsi, [rsp-256]
    mov     rdx, 256
    syscall

    mov byte [rsp-256+rax], 0  ; '\0'    
}

macro self_delete
{
    get_self_name
    ; int unlink(const char *path);
    mov     rax, 87
    lea     rdi, [rsp-256]
    syscall
}

start:

    printf hello.data, hello.length
    self_delete
    sys_exit


segment readable writable

struc message data,length
{
    .data db data, 0xA, 0
    .length = $ - .data
}

hello message "h3ll0 beacon.asm"

current_filename db "main", 0
proc_self_exe db "/proc/self/exe", 0

; message db "hello beacon.asm", 16
; message_len = $ - message
