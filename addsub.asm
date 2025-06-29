;this program adds and subtracts 32-bit integers.

TITLE Add and subtract ;TITLE identifies this as a comment

INCLUDE Irvine32.inc ;INCLUDE copies necessary definitions and setup information

.code               ; marks the beginning of the code segment
main PROC           ;PROC directive identifies the beginning of a procedure

    mov eax, 10000h ;eax = 10000h, moves 10000h into the eax register.
    add eax, 40000h ;eax = 50000h
    sub eax, 20000h ;eax = 30000h
    call DumpRegs   ;displays registers

    exit            ; calls a predefines MS-WINDOWS function to halt the program

main ENDP           ;ENDP makrs the end of the main procedure 
END main            ;END marks the last line of the program to be assembled.