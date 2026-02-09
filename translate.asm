; Name: translate.asm
; Purpose: Translates expression X = (Y * 4) + 3 to assembly
; Date: 2026-02-09
; Author: Johnson
; Environment: MASM / Windows

TITLE Expression Translation (translate.asm)

INCLUDE Irvine32.inc

.data
    Y       DWORD   5           ; Example value
    X       DWORD   ?

.code
main PROC
    mov     eax, Y          ; move Y to eax register
    mov     ebx, 4          ; move 4 to ebx register
    imul    ebx             ; eax = eax * ebx
    add     eax, 3          ; add 3 to eax
    mov     X, eax          ; move eax to X

    ; Verification (optional)
    call    WriteInt        ; display result
    call    Crlf
    
    exit
main ENDP
END main