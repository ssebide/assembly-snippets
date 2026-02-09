; Name: nasm-arithmetic.asm
; Purpose: Demonstrates basic arithmetic operations (addition) with user input in NASM
; Date: 2026-02-09
; Author: Johnson
; Environment: NASM / Linux (32-bit syscalls)

SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

section .data
    msg1 db "Enter a digit ", 0xA,0xD 
    len1 equ $- msg1 

    msg2 db "Please enter a second digit", 0xA,0xD 
    len2 equ $- msg2 

    msg3 db "The sum is: "
    len3 equ $- msg3

section .bss
    num1 resb 2 
    num2 resb 2 
    res resb 1    

section .text
    global _start

_start:
    ; Prompt for first number
    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    mov     ecx, msg1
    mov     edx, len1
    int     0x80

    ; Read first number
    mov     eax, SYS_READ
    mov     ebx, STDIN
    mov     ecx, num1
    mov     edx, 2
    int     0x80

    ; Prompt for second number
    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    mov     ecx, msg2
    mov     edx, len2
    int     0x80

    ; Read second number
    mov     eax, SYS_READ
    mov     ebx, STDIN
    mov     ecx, num2
    mov     edx, 2
    int     0x80

    ; Display result message
    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    mov     ecx, msg3
    mov     edx, len3
    int     0x80

    ; Convert ASCII to decimal and add
    mov     eax, [num1]
    sub     eax, '0'        ; convert first ascii to integer

    mov     ebx, [num2]
    sub     ebx, '0'        ; convert second ascii to integer

    add     eax, ebx        ; add integers
    add     eax, '0'        ; convert result back to ascii

    ; Store result
    mov     [res], eax

    ; Print the sum
    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    mov     ecx, res
    mov     edx, 1
    int     0x80

exit:
    mov     eax, SYS_EXIT
    xor     ebx, ebx
    int     0x80