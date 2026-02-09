; Name: Bsearch.inc
; Purpose: Prototypes for BubbleSort / BinarySearch procedures
; Date: 2026-02-09
; Author: Johnson
; Environment: MASM / Windows

; Searches for an integer in an array of 32-bit signed integers.
BinarySearch PROTO,
    pArray:PTR DWORD,       ; pointer to array
    Count:DWORD,            ; array size
    searchVal:DWORD         ; search value

; Fills an array with 32-bit signed random integers
FillArray PROTO,
    pArray:PTR DWORD,       ; pointer to array
    Count:DWORD,            ; number of elements
    LowerRange:SDWORD,      ; lower limit of random values
    UpperRange:SDWORD       ; upper limit of random values

; Writes a 32-bit signed integer array to standard output
PrintArray PROTO,
    pArray:PTR DWORD,
    Count:DWORD

; Sorts the array in ascending order
BubbleSort PROTO,
    pArray:PTR DWORD,
    Count:DWORD
