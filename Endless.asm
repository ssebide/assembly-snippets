; Name: Endless.asm
; Purpose: Demonstrates infinite recursion (stack overflow eventually)
; Date: 2026-02-09
; Author: Johnson
; Environment: MASM / Windows

TITLE Endless Recursion (Endless.asm)

INCLUDE Irvine32.inc

.data
    endlessStr  BYTE    "This recursion never stops", 0

.code
main PROC
    call    Endless
    exit
main ENDP

Endless PROC
    mov     edx, OFFSET endlessStr
    call    WriteString
    call    Endless
    ret     ; never executes
Endless ENDP
END main