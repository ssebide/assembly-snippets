; Name: nasm-recursion.asm
; Purpose: Demonstrates recursion by calculating factorial in NASM
; Date: 2026-02-09
; Author: Johnson
; Environment: NASM / Linux (32-bit syscalls)

SYS_EXIT  equ 1
SYS_WRITE equ 4
STDOUT    equ 1

section .data
    msg     db 'Factorial 3 is:', 0xA
    len     equ $ - msg

section .bss
    fact    resb 1

section .text
    global _start

_start:
    mov     bx, 3           ; for calculating factorial 3
    call    proc_fact
    add     ax, 30h         ; Convert result to ASCII (works for single digit result)
    mov     [fact], ax
    
    ; Print Message
    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    mov     ecx, msg
    mov     edx, len
    int     0x80

    ; Print Result
    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    mov     ecx, fact
    mov     edx, 1
    int     0x80
    
    mov     eax, SYS_EXIT
    xor     ebx, ebx
    int     0x80

proc_fact:
    ; Recursive factorial function
    ; Input: BL
    ; Output: AX (accumulated product)
    cmp     bl, 1
    jg      do_calculation
    mov     ax, 1
    ret
    
do_calculation:
    dec     bl
    call    proc_fact
    inc     bl
    mul     bl              ; AX = AX * BL
    ret
