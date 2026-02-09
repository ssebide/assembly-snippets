; Name: Scroll.asm
; Purpose: Demonstrates scrolling the console window and resizing
; Date: 2026-02-09
; Author: Johnson
; Environment: MASM / Windows

TITLE Scrolling the Console Window (Scroll.asm)

INCLUDE Irvine32.inc

.data
    message     BYTE    ": This line of text was written "
                BYTE    "to the screen buffer", 0dh, 0ah
    messageSize DWORD   ($ - message)
    outHandle   HANDLE  0               ; standard output handle
    bytesWritten DWORD  ?               ; number of bytes written
    lineNum     DWORD   0
    windowRect  SMALL_RECT <0, 0, 60, 11> ; left, top, right, bottom

.code
main PROC
    INVOKE  GetStdHandle, STD_OUTPUT_HANDLE
    mov     outHandle, eax
    
    .REPEAT
        mov     eax, lineNum
        call    WriteDec                ; display each line number
        
        INVOKE  WriteConsole, outHandle, ADDR message, 
                messageSize, ADDR bytesWritten, 0
                
        inc     lineNum                 ; next line number
    .UNTIL lineNum > 50

    ; Resize and reposition the console window relative to the
    ; screen buffer.
    INVOKE  SetConsoleWindowInfo, outHandle, TRUE, ADDR windowRect
            
    call    Readchar                    ; wait for a key
    call    Clrscr                      ; clear the screen buffer
    call    Readchar                    ; wait for a second key
    
    INVOKE  ExitProcess, 0
main ENDP
END main