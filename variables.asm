; Name: variables.asm
; Purpose: Demonstrates local variables and stack frames
; Date: 2026-02-09
; Author: Johnson
; Environment: MASM / Windows

TITLE Local Variables (variables.asm)

INCLUDE Irvine32.inc

.code

;-----------------------------------------------------
; MySub
; Demonstrates creating local variables using stack
;-----------------------------------------------------
MySub PROC
    push    ebp
    mov     ebp, esp
    sub     esp, 8          ; create locals
    
    mov     DWORD PTR [ebp - 4], 10 ; X (local 1)
    mov     DWORD PTR [ebp - 8], 20 ; Y (local 2)
    
    mov     esp, ebp        ; remove locals from stack
    pop     ebp
    ret
MySub ENDP

END
