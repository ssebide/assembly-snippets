; Name: FillArray.asm
; Purpose: Procedure to fill an array with random integers
; Date: 2026-02-09
; Author: Johnson
; Environment: MASM / Windows

TITLE FillArray Procedure (FillArry.asm)

INCLUDE Irvine32.inc

.code

;------------------------------------------------------------
; FillArray
; Fills an array with a random sequence of 32-bit signed
; integers between LowerRange and (UpperRange - 1).
; Receives: 
;   pArray:     pointer to array
;   Count:      number of elements
;   LowerRange: lower range
;   UpperRange: upper range
; Returns: nothing
;-----------------------------------------------------------
FillArray PROC USES eax edi ecx edx,
    pArray:PTR DWORD,       ; pointer to array
    Count:DWORD,            ; number of elements
    LowerRange:SDWORD,      ; lower range
    UpperRange:SDWORD       ; upper range

    mov     edi, pArray     ; EDI points to the array
    mov     ecx, Count      ; loop counter
    mov     edx, UpperRange
    sub     edx, LowerRange ; EDX = absolute range (0..n)
    cld                     ; clear direction flag

L1: 
    mov     eax, edx        ; get absolute range
    call    RandomRange
    add     eax, LowerRange ; bias the result
    stosd                   ; store EAX into [edi]
    loop    L1
    
    ret
FillArray ENDP
END