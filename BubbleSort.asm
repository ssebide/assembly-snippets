; Name: BubbleSort.asm
; Purpose: Bubble Sort procedure for 32-bit signed integer arrays
; Date: 2026-02-09
; Author: Johnson
; Environment: MASM / Windows

.code

;----------------------------------------------------------
; BubbleSort
; Sort an array of 32-bit signed integers in ascending
; order, using the bubble sort algorithm.
; Receives: 
;   pArray: pointer to array
;   Count:  array size
; Returns: nothing
;-----------------------------------------------------------
BubbleSort PROC USES eax ecx esi,
    pArray:PTR DWORD,       ; pointer to array
    Count:DWORD             ; array size

    mov     ecx, Count
    dec     ecx             ; decrement count by 1

L1: 
    push    ecx             ; save outer loop count
    mov     esi, pArray     ; point to first value

L2: 
    mov     eax, [esi]      ; get array value
    cmp     [esi + 4], eax  ; compare a pair of values
    jg      L3              ; if [ESI+4] > [ESI], no exchange

    xchg    eax, [esi + 4]  ; exchange the pair
    mov     [esi], eax

L3: 
    add     esi, 4          ; move both pointers forward
    loop    L2              ; inner loop

    pop     ecx             ; retrieve outer loop count
    loop    L1              ; else repeat outer loop

L4: 
    ret
BubbleSort ENDP
END
