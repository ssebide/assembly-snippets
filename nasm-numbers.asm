; Name: nasm-numbers.asm
; Purpose: Demonstrates ASCII arithmetic (adding multi-digit numbers) in NASM
; Date: 2026-02-09
; Author: Johnson
; Environment: NASM / Linux (32-bit syscalls)

SYS_EXIT  equ 1
SYS_WRITE equ 4
STDOUT    equ 1

section .data
    msg     db 'The Sum is:', 0xA
    len     equ $ - msg
    
    num1    db '12345'
    num2    db '23456'

section .bss
    sum     resb 6          ; Reserve space for sum (5 digits + potential newline/null)

section .text
    global _start

_start:
    mov     esi, 4          ; pointing to the rightmost digit index (length 5: 0-4)
    mov     ecx, 5          ; number of digits
    clc                     ; clear carry flag

add_loop:  
    mov     al, [num1 + esi]
    adc     al, [num2 + esi]
    aaa                     ; ASCII Adjust After Addition
    pushf                   ; Save flags (carry)
    or      al, 30h         ; Convert back to ASCII digit
    popf                    ; Restore flags
    
    mov     [sum + esi], al
    dec     esi
    loop    add_loop
    
    ; Print Label
    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    mov     ecx, msg
    mov     edx, len
    int     0x80
    
    ; Print Sum
    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    mov     ecx, sum
    mov     edx, 5          ; Length is 5
    int     0x80
    
    ; Print Newline
    ; (Optional, but good for output formatting)
    
    mov     eax, SYS_EXIT
    xor     ebx, ebx
    int     0x80