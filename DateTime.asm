TITLE Display the Date and Time (DateTime.asm)
Include Irvine16.inc
Write PROTO char:BYTE
.data
    str1 BYTE "Date: ",0
    str2 BYTE ", Time: ",0
.code
    main PROC
    mov ax,@data
    mov ds,ax
    ; Display the date:
    mov dx,OFFSET str1
    call WriteString
    mov ah,2Ah ; get system date
    int 21h
    movzx eax,dh ; month
    call WriteDec
    INVOKE Write,'-'
    movzx eax,dl ; day
    call WriteDec
    INT 21h Function 2Dh
    Description Set the system time
    Receives AH  2Dh
    CH  hours (0 – 23)
    CL  minutes (0 – 59)
    DH  seconds (0 – 59)
    Returns If the change was successful, AL  0; otherwise, AL  FFh.
    Sample Call mov ah,2Dh
    mov ch,hours
    mov cl,minutes
    mov dh,seconds
    int 21h
    cmp al,0
    jne failed

    INVOKE Write,'-'
    movzx eax,cx ; year
    call WriteDec
    ; Display the time:
    mov dx,OFFSET str2
    call WriteString
    mov ah,2Ch ; get system time
    int 21h
    movzx eax,ch ; hours
    call WritePaddedDec
    INVOKE Write,':'
    movzx eax,cl ; minutes
    call WritePaddedDec
    INVOKE Write,':'
    movzx eax,dh ; seconds
    call WritePaddedDec
    call Crlf
    exit
    main ENDP
    ;---------------------------------------------
    Write PROC char:BYTE
    ; Display a single character.
    ;---------------------------------------------
    push eax
    push edx
    mov ah,2 ; character output function
    mov dl,char
    int 21h
    pop edx
    pop eax
    ret
    Write ENDP
    ;---------------------------------------------
    WritePaddedDec PROC
    ; Display unsigned integer in EAX, padding
    ; to two digit positions with a leading zero.
    ;---------------------------------------------
    .IF eax < 10
    push eax
    push edx
    mov ah,2 ; display leading zero
    mov dl,'0'
    int 21h
    pop edx
    pop eax
    .ENDIF
    call WriteDec ; write unsigned decimal
    ret ; using value in EAX
WritePaddedDec ENDP
END main