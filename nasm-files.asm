; Name: nasm-files.asm
; Purpose: Demonstrates file creation, writing, and reading in NASM
; Date: 2026-02-09
; Author: Johnson
; Environment: NASM / Linux (32-bit syscalls)

SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
SYS_OPEN  equ 5
SYS_CLOSE equ 6
SYS_CREAT equ 8

STDOUT    equ 1

section .data
    file_name db 'myfile.txt', 0
    msg       db 'Welcome to Tutorials Point'
    len       equ $-msg

    msg_done  db 'Written to file', 0xA
    len_done  equ $-msg_done

section .bss
    fd_out    resd 1        ; Reserve 4 bytes for file descriptor
    fd_in     resd 1        ; Reserve 4 bytes for file descriptor
    info      resb 26

section .text
    global _start

_start:
    ; Create the file
    mov     eax, SYS_CREAT
    mov     ebx, file_name
    mov     ecx, 0777       ; read, write and execute by all
    int     0x80
    
    mov     [fd_out], eax   ; store file descriptor
    
    ; Write into the file
    mov     edx, len        ; number of bytes
    mov     ecx, msg        ; message to write
    mov     ebx, [fd_out]   ; file descriptor 
    mov     eax, SYS_WRITE
    int     0x80
    
    ; Close the file
    mov     eax, SYS_CLOSE
    mov     ebx, [fd_out]
    int     0x80
    
    ; Write the message indicating end of file write
    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    mov     ecx, msg_done
    mov     edx, len_done
    int     0x80
    
    ; Open the file for reading
    mov     eax, SYS_OPEN
    mov     ebx, file_name
    mov     ecx, 0          ; for read only access
    mov     edx, 0777       ; permissions (ignored on open usually, but kept for consistency with original)
    int     0x80
    
    mov     [fd_in], eax    ; store file descriptor
    
    ; Read from file
    mov     eax, SYS_READ
    mov     ebx, [fd_in]
    mov     ecx, info
    mov     edx, 26
    int     0x80
    
    ; Close the file
    mov     eax, SYS_CLOSE
    mov     ebx, [fd_in]
    int     0x80    
    
    ; Print the info 
    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    mov     ecx, info
    mov     edx, 26
    int     0x80
        
    mov     eax, SYS_EXIT
    xor     ebx, ebx
    int     0x80
