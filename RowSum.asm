; Name: RowSum.asm
; Purpose: Calculates the sum of a row in a byte matrix
; Date: 2026-02-09
; Author: Johnson
; Environment: MASM / Windows

TITLE Row Sum Calculation (RowSum.asm)

INCLUDE Irvine32.inc

.code

;------------------------------------------------------------
; calc_row_sum
; Calculates the sum of a row in a byte matrix.
; Receives: 
;   EBX = table offset
;   EAX = row index
;   ECX = row size, in bytes
; Returns: EAX holds the sum.
;------------------------------------------------------------
calc_row_sum PROC USES ebx ecx edx esi
    mul     ecx                 ; row index * row size
    add     ebx, eax            ; row offset
    
    mov     eax, 0              ; accumulator
    mov     esi, 0              ; column index
    
L1: 
    movzx   edx, BYTE PTR[ebx + esi] ; get a byte
    add     eax, edx            ; add to accumulator
    inc     esi                 ; next byte in row
    loop    L1
    
    ret
calc_row_sum ENDP
END