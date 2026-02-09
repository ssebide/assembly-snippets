; Name: AddSubAlt.asm
; Purpose: Adds and subtracts 32-bit integers using immediate values
; Date: 2026-02-09
; Author: Johnson
; Environment: MASM / Windows

.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO 

.code
main PROC
    mov     eax, 10000h     ; EAX = 10000h
    add     eax, 40000h     ; EAX = 50000h
    sub     eax, 20000h     ; EAX = 30000h
    
    call    DumpRegs        ; Display registers

    INVOKE  ExitProcess, 0
main ENDP
END main