; Name: nasm-memory.asm
; Purpose: Demonstrates dynamic memory allocation using sys_brk in NASM
; Date: 2026-02-09
; Author: Johnson
; Environment: NASM / Linux (32-bit syscalls)

SYS_EXIT  equ 1
SYS_WRITE equ 4
SYS_BRK   equ 45
STDOUT    equ 1

section .data
    msg     db "Allocated 16 kb of memory!", 0xA
    len     equ $ - msg

section .text
    global _start

_start:
    ; Get current break
    mov     eax, SYS_BRK
    xor     ebx, ebx
    int     0x80

    ; Reserve 16KB
    add     eax, 16384      ; number of bytes to be reserved
    mov     ebx, eax        ; new break address
    mov     eax, SYS_BRK 
    int     0x80
    
    cmp     eax, 0
    jl      exit            ; exit if error
    
    ; Initialize allocated memory to 0
    mov     edi, eax        ; EDI = highest available address
    sub     edi, 4          ; pointing to the last DWORD  
    mov     ecx, 4096       ; number of DWORDs allocated (16384 / 4)
    xor     eax, eax        ; value to store (0)
    std                     ; set direction flag (decrement EDI)
    rep     stosd           ; repeat for entire allocated area
    cld                     ; clear direction flag (restore normal state)
    
    ; Print message
    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    mov     ecx, msg
    mov     edx, len
    int     0x80

exit:
    mov     eax, SYS_EXIT
    xor     ebx, ebx
    int     0x80
