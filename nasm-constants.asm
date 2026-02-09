; Name: nasm-constants.asm
; Purpose: Demonstrates defining and using constants (equ) in NASM
; Date: 2026-02-09
; Author: Johnson
; Environment: NASM / Linux (32-bit syscalls)

SYS_EXIT  equ 1
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

section .data
    msg1 db 'Hello, programmers!', 0xA, 0xD 
    len1 equ $ - msg1
    
    msg2 db 'Welcome to the world of,', 0xA, 0xD 
    len2 equ $ - msg2 
    
    msg3 db 'Linux assembly programming! '
    len3 equ $ - msg3

section .text
    global _start

_start:
    ; Print first message
    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    mov     ecx, msg1
    mov     edx, len1
    int     0x80
    
    ; Print second message
    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    mov     ecx, msg2
    mov     edx, len2
    int     0x80
    
    ; Print third message
    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    mov     ecx, msg3
    mov     edx, len3
    int     0x80
    
    ; Exit
    mov     eax, SYS_EXIT
    xor     ebx, ebx
    int     0x80