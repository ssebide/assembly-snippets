; Name: SumArray.asm
; Purpose: Summing an array of 32-bit integers
; Date: 2026-02-09
; Author: Johnson
; Environment: MASM / Windows

TITLE Summing an Array (SumArray.asm)

INCLUDE Irvine32.inc

.data
    intarray    DWORD   10000h, 20000h, 30000h, 40000h

.code
main PROC
    mov     edi, OFFSET intarray    ; 1: EDI = address of intarray
    mov     ecx, LENGTHOF intarray  ; 2: initialize loop counter
    mov     eax, 0                  ; 3: sum = 0

L1:                                 ; 4: mark beginning of loop
    add     eax, [edi]              ; 5: add an integer
    add     edi, TYPE intarray      ; 6: point to next element
    loop    L1                      ; 7: repeat until ECX = 0

    ; Optional: Display result
    call    WriteHex
    call    Crlf
    
    exit
main ENDP
END main