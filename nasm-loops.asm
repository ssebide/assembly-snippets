; Name: nasm-loops.asm
; Purpose: Demonstrates loops and stack operations in NASM
; Date: 2026-02-09
; Author: Johnson
; Environment: NASM / Linux (32-bit syscalls)

SYS_EXIT  equ 1
SYS_WRITE equ 4
STDOUT    equ 1

section .data
    ; None

section .bss
    num resb 1

section .text
    global _start

_start:
    mov     ecx, 10         ; Loop counter
    mov     eax, '1'        ; Start with ASCII '1'
    
l1:
    mov     [num], eax      ; Store current character
    
    ; Save loop counter and current character accumulator in eax (though eax is clobbered by sys_write return?)
    ; Wait, sys_write returns number of bytes written in EAX. So EAX is lost.
    ; We need to preserve EAX (the character) as well!
    ; ORIG CODE: `mov [num], eax` -> `int 0x80` -> `mov eax, [num]`. It re-reads [num]. Good.
    
    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    push    ecx             ; Save loop counter
    
    mov     ecx, num        
    mov     edx, 1        
    int     0x80
    
    mov     eax, [num]      ; Restore character
    sub     eax, '0'        ; Convert to int
    inc     eax             ; Increment
    add     eax, '0'        ; Convert back to ASCII
    
    pop     ecx             ; Restore loop counter
    loop    l1              ; Dec ECX, Jump if not 0
    
    mov     eax, SYS_EXIT
    xor     ebx, ebx
    int     0x80