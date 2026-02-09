; Name: nasm-variables.asm
; Purpose: Demonstrates variable definitions in NASM
; Date: 2026-02-09
; Author: Johnson
; Environment: NASM / Linux (32-bit syscalls)

SYS_EXIT  equ 1
SYS_WRITE equ 4
STDOUT    equ 1

section .data
    choice        db 'y'
    number        dw 12345
    neg_number    dw -12345
    big_number    dq 123456789
    real_number1  dd 1.234
    real_number2  dq 123.456

section .text
    global _start

_start:
    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    mov     ecx, choice
    mov     edx, 1
    int     0x80

    mov     eax, SYS_EXIT
    xor     ebx, ebx
    int     0x80