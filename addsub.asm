; Name: addsub.asm
; Purpose: Adds and subtracts 32-bit integers using Irvine32 library
; Date: 2026-02-09
; Author: Johnson
; Environment: MASM / Windows

TITLE Add and subtract

INCLUDE Irvine32.inc

.code
main PROC
    mov     eax, 10000h     ; EAX = 10000h
    add     eax, 40000h     ; EAX = 50000h
    sub     eax, 20000h     ; EAX = 30000h
    call    DumpRegs        ; Displays registers

    exit
main ENDP
END main