TITLE Add and Subtract 

; this program adds and subtracts 32-bit integers without any abstractions

.386             ;identifies the minimum CPU required for this program.(intel386)
.model flat, stdcall ;.model isentifies segmentation model used by the program, identifies convention for parsing parameters to procedures, flat tells assembler to generate code fora protected mode program, stdcall enables calling of MSWindow functions
.stack 4096  
ExitProcess PROTO, dwExitCode:DWORD ;declares prototypes for procedures used by this program. Exit process halts program
DumpRegs PROTO ;displays the registers.

.code
main PROC
    mov eax,10000h ; EAX = 10000h
    add eax,40000h ; EAX = 50000h
    sub eax,20000h ; EAX = 30000h
    call DumpRegs

    INVOKE ExitProcess,0

main ENDP
END main