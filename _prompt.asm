; Name: _prompt.asm
; Purpose: Procedure to prompt for integers (Example Module)
; Date: 2026-02-09
; Author: Johnson
; Environment: MASM / Windows

TITLE Prompt For Integers (_prompt.asm)

INCLUDE Irvine32.inc

.code

;----------------------------------------------------
; PromptForIntegers
; Prompts the user for an array of integers and fills
; the array with the user's input.
; Receives:
;   ptrPrompt:PTR BYTE  ; prompt string (stack)
;   ptrArray:PTR DWORD  ; pointer to array (stack)
;   arraySize:DWORD     ; size of the array (stack)
; Returns: nothing
;-----------------------------------------------------
PromptForIntegers PROC
    ; Parameters accessed using EBP
    arraySize   EQU [ebp + 16]
    ptrArray    EQU [ebp + 12]
    ptrPrompt   EQU [ebp + 8]
    
    enter   0, 0
    pushad              ; save all registers
    
    mov     ecx, arraySize
    cmp     ecx, 0      ; array size <= 0?
    jle     L2          ; yes: quit
    
    mov     edx, ptrPrompt ; address of the prompt
    mov     esi, ptrArray
    
L1: 
    call    WriteString ; display string
    call    ReadInt     ; read integer into EAX
    call    Crlf        ; go to next output line
    mov     [esi], eax  ; store in array
    add     esi, 4      ; next integer
    loop    L1
    
L2: 
    popad               ; restore all registers
    leave
    ret     12          ; restore the stack
PromptForIntegers ENDP

END