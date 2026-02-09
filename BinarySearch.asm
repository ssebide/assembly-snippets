; Name: BinarySearch.asm
; Purpose: Binary Search procedure for 32-bit signed integer arrays
; Date: 2026-02-09
; Author: Johnson
; Environment: MASM / Windows

.code

;-------------------------------------------------------------
; BinarySearch
; Searches an array of signed integers for a single value.
; Receives: 
;   pArray:    Pointer to array
;   Count:     Array size
;   searchVal: Value to find
; Returns: 
;   EAX = array position of matching element, or -1 if not found.
;-------------------------------------------------------------
BinarySearch PROC USES ebx edx esi edi,
    pArray:PTR DWORD,       ; pointer to array
    Count:DWORD,            ; array size
    searchVal:DWORD         ; search value

    LOCAL first:DWORD,      ; first position
          last:DWORD,       ; last position
          mid:DWORD         ; midpoint

    mov     first, 0        ; first = 0
    mov     eax, Count      
    dec     eax             ; last = count - 1
    mov     last, eax
    
    mov     edi, searchVal  ; EDI = searchVal
    mov     ebx, pArray     ; EBX points to the array

L1: ; while first <= last
    mov     eax, first
    cmp     eax, last
    jg      L5              ; exit search

    ; mid = (last + first) / 2
    mov     eax, last
    add     eax, first
    shr     eax, 1
    mov     mid, eax

    ; EDX = values[mid]
    mov     esi, mid
    shl     esi, 2          ; scale mid value by 4 (DWORD size)
    mov     edx, [ebx + esi]; EDX = values[mid]

    ; if ( EDX < searchVal(EDI) )
    cmp     edx, edi
    jge     L2
    
    ; first = mid + 1
    mov     eax, mid
    inc     eax
    mov     first, eax
    jmp     L4

L2: ; else if( EDX > searchVal(EDI) )
    cmp     edx, edi 
    jle     L3
    
    ; last = mid - 1
    mov     eax, mid
    dec     eax
    mov     last, eax
    jmp     L4

L3: ; else return mid
    mov     eax, mid        ; value found
    jmp     L9              ; return (mid)

L4: 
    jmp     L1              ; continue the loop

L5: 
    mov     eax, -1         ; search failed

L9: 
    ret
BinarySearch ENDP
END