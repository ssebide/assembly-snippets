; Name: nasm-logical.asm
; Purpose: Demonstrates logical operations (AND, TEST) and conditional jumps in NASM
; Date: 2026-02-09
; Author: Johnson
; Environment: NASM / Linux (32-bit syscalls)

SYS_EXIT  equ 1
SYS_WRITE equ 4
STDOUT    equ 1

section .data
    even_msg  db  'Even Number!', 0xA
    len1      equ  $ - even_msg 
       
    odd_msg   db  'Odd Number!', 0xA
    len2      equ  $ - odd_msg

section .text
    global _start

_start:
    mov     ax, 8h          ; Load value to test (8)
    and     ax, 1           ; Check lowest bit (1 = odd, 0 = even)
    jz      evnn            ; If Zero flag set (result 0), it's even

    ; ODD case
    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    mov     ecx, odd_msg
    mov     edx, len2
    int     0x80
    jmp     outprog

evnn:
    ; EVEN case
    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    mov     ecx, even_msg
    mov     edx, len1
    int     0x80

outprog:
    mov     eax, SYS_EXIT
    xor     ebx, ebx
    int     0x80