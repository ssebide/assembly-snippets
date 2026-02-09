; Name: nasm-arrays.asm
; Purpose: Demonstrates iterating over an array and summing elements in NASM
; Date: 2026-02-09
; Author: Johnson
; Environment: NASM / Linux (32-bit syscalls)

SYS_EXIT  equ 1
SYS_WRITE equ 4
STDOUT    equ 1

section .data
    global x
    x:      db  2, 4, 3    ; array of bytes

    sum:    db  0

section .text
    global _start

_start:
    mov     eax, 3          ; number of bytes to be summed (counter)
    xor     ebx, ebx        ; EBX will store the sum (clear to 0)
    mov     ecx, x          ; ECX points to the current element

top:
    movzx   edx, byte [ecx] ; Load byte into 32-bit logic
    add     ebx, edx        ; Add to sum
    
    inc     ecx             ; move pointer to next element
    dec     eax             ; decrement counter
    jnz     top             ; if counter not 0, then loop again

done:
    add     ebx, '0'        ; convert raw integer to ASCII digit (simplistic, works for small sum < 10)
    mov     [sum], bl       ; store lower byte of result in "sum"

display:
    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    mov     ecx, sum
    mov     edx, 1
    int     0x80

    mov     eax, SYS_EXIT
    xor     ebx, ebx
    int     0x80
