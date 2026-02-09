; Name: B_main.asm
; Purpose: Main module for Bubble Sort and Binary Search demonstration
; Date: 2026-02-09
; Author: Johnson
; Environment: MASM / Windows

TITLE Bubble Sort and Binary Search B_main.asm

INCLUDE Irvine32.inc
INCLUDE Bsearch.inc         ; procedure prototypes

LOWVAL      = -5000         ; minimum value
HIGHVAL     = +5000         ; maximum value
ARRAY_SIZE  = 50            ; size of the array

.data
    array   DWORD   ARRAY_SIZE DUP(?)
    
.code
main PROC
    call    Randomize

    ; Fill an array with random signed integers
    INVOKE  FillArray, ADDR array, ARRAY_SIZE, LOWVAL, HIGHVAL
    
    ; Display the array
    INVOKE  PrintArray, ADDR array, ARRAY_SIZE
    
    call    WaitMsg
    
    ; Perform a bubble sort and redisplay the array
    INVOKE  BubbleSort, ADDR array, ARRAY_SIZE
    INVOKE  PrintArray, ADDR array, ARRAY_SIZE
    
    ; Demonstrate a binary search
    call    AskForSearchVal ; returned in EAX
    INVOKE  BinarySearch, ADDR array, ARRAY_SIZE, eax
    
    call    ShowResults
    
    exit
main ENDP

;--------------------------------------------------------
; AskForSearchVal
; Prompt the user for a signed integer.
; Receives: nothing
; Returns: EAX = value input by user
;--------------------------------------------------------
AskForSearchVal PROC
    .data
    prompt  BYTE    "Enter a signed decimal integer "
            BYTE    "in the range of -5000 to +5000 "
            BYTE    "to find in the array: ", 0
    .code
    call    Crlf
    mov     edx, OFFSET prompt
    call    WriteString
    call    ReadInt
    ret
AskForSearchVal ENDP

;--------------------------------------------------------
; ShowResults
; Display the resulting value from the binary search.
; Receives: EAX = position number to be displayed
; Returns: nothing
;--------------------------------------------------------
ShowResults PROC
    .data
    msg1    BYTE    "The value was not found.", 0
    msg2    BYTE    "The value was found at position ", 0
    .code
    .IF eax == -1
        mov     edx, OFFSET msg1
        call    WriteString
    .ELSE
        mov     edx, OFFSET msg2
        call    WriteString
        call    WriteDec
    .ENDIF
    
    call    Crlf
    call    Crlf
    ret
ShowResults ENDP

END main