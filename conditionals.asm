; Name: conditionals.asm
; Purpose: Educational snippets for conditional structures (If, If-Else, Loops)
; Date: 2026-02-09
; Author: Johnson
; Environment: MASM / Windows

TITLE Conditional Structures (conditionals.asm)

INCLUDE Irvine32.inc

.data
    op1     DWORD   10
    op2     DWORD   20
    X       DWORD   ?
    Y       DWORD   ?
    val1    DWORD   5
    val2    DWORD   5

.code
main PROC
    ; ---------------------------------------------------------
    ; if statement
    ; ---------------------------------------------------------
    mov     eax, op1
    cmp     eax, op2        ; op1 == op2?
    jne     L1              ; no: skip next
    mov     X, 1            ; yes: assign X and Y
    mov     Y, 2
L1:

    ; ---------------------------------------------------------
    ; if else if
    ; ---------------------------------------------------------
    mov     eax, op1        ; move op1 to a register
    cmp     eax, op2        ; op1 > op2?
    jg      A1              ; yes: call Routine1
    call    Routine2        ; no: call Routine2
    jmp     A2              ; exit the IF statement
A1: 
    call    Routine1
A2:

    ; ---------------------------------------------------------
    ; nested if statement
    ; ---------------------------------------------------------
    mov     eax, op1
    cmp     eax, op2        ; op1 == op2?
    jne     L2_nested       ; no: call Routine3
    
    ; process the inner IF-ELSE statement.
    mov     eax, X
    cmp     eax, Y          ; X > Y?
    jg      L1_nested       ; yes: call Routine1
    call    Routine2        ; no: call Routine2
    jmp     L3_nested       ; and exit

L1_nested: 
    call    Routine1        ; call Routine1
    jmp     L3_nested       ; and exit

L2_nested: 
    call    Routine3

L3_nested:

    ; ---------------------------------------------------------
    ; logical or operator
    ; ---------------------------------------------------------
    mov     al, 1
    mov     bl, 2
    mov     cl, 3
    
    cmp     al, bl          ; 1: compare AL to BL
    ja      L1_or           ; if true, skip second expression
    cmp     bl, cl          ; 2: compare BL to CL
    jbe     next_or         ; false: skip next statement
L1_or: 
    mov     X, 1            ; true: set X = 1
next_or:

    ; ---------------------------------------------------------
    ; while loop
    ; ---------------------------------------------------------
    mov     eax, val1       ; copy variable to EAX
beginwhile:
    cmp     eax, val2       ; if not (val1 < val2)
    jnl     endwhile_loop   ; exit the loop
    inc     eax             ; val1++;
    dec     val2            ; val2--;
    jmp     beginwhile      ; repeat the loop
endwhile_loop:
    mov     val1, eax       ; save new value for val1
    
    exit
main ENDP

; Dummy Procedures for demonstration
Routine1 PROC
    ret
Routine1 ENDP

Routine2 PROC
    ret
Routine2 ENDP

Routine3 PROC
    ret
Routine3 ENDP

END main