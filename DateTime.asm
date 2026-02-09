; Name: DateTime.asm
; Purpose: Displays current date and time using DOS interrupts (16-bit real mode)
; Date: 2026-02-09
; Author: Johnson
; Environment: MASM / 16-bit DOS

TITLE Display the Date and Time (DateTime.asm)

Include Irvine16.inc

Write PROTO char:BYTE

.data
    str1    BYTE    "Date: ", 0
    str2    BYTE    ", Time: ", 0

.code
main PROC
    mov     ax, @data
    mov     ds, ax
    
    ; Display the date:
    mov     dx, OFFSET str1
    call    WriteString
    
    mov     ah, 2Ah         ; get system date
    int     21h
    
    movzx   eax, dh         ; month
    call    WriteDec
    
    INVOKE  Write, '-'
    
    movzx   eax, dl         ; day
    call    WriteDec
    
    INVOKE  Write, '-'
    
    movzx   eax, cx         ; year
    call    WriteDec
    
    ; Display the time:
    mov     dx, OFFSET str2
    call    WriteString
    
    mov     ah, 2Ch         ; get system time
    int     21h
    
    movzx   eax, ch         ; hours
    call    WritePaddedDec
    
    INVOKE  Write, ':'
    
    movzx   eax, cl         ; minutes
    call    WritePaddedDec
    
    INVOKE  Write, ':'
    
    movzx   eax, dh         ; seconds
    call    WritePaddedDec
    
    call    Crlf
    exit
main ENDP

;---------------------------------------------
; Write
; Display a single character.
;---------------------------------------------
Write PROC char:BYTE
    push    eax
    push    edx
    mov     ah, 2       ; character output function
    mov     dl, char
    int     21h
    pop     edx
    pop     eax
    ret
Write ENDP

;---------------------------------------------
; WritePaddedDec
; Display unsigned integer in EAX, padding
; to two digit positions with a leading zero.
;---------------------------------------------
WritePaddedDec PROC
    .IF eax < 10
        push    eax
        push    edx
        mov     ah, 2   ; display leading zero
        mov     dl, '0'
        int     21h
        pop     edx
        pop     eax
    .ENDIF
    
    call    WriteDec    ; write unsigned decimal
    ret                 ; using value in EAX
WritePaddedDec ENDP

END main