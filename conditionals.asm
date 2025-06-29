;if statement
    mov eax,op1
    cmp eax,op2 ; op1 == op2?
    jne L1 ; no: skip next
    mov X,1 ; yes: assign X and Y
    mov Y,2
L1:

;if else if
    mov eax,op1 ; move op1 to a register
    cmp eax,op2 ; op1 > op2?
    jg A1 ; yes: call Routine1
    call Routine2 ; no: call Routine2
    jmp A2 ; exit the IF statement
A1: call Routine1
A2:

    ;nested if statement
    mov eax,op1
    cmp eax,op2 ; op1 == op2?
    jne L2 ; no: call Routine3
    ; process the inner IF-ELSE statement.

    mov eax,X
    cmp eax,Y ; X > Y?
    jg L1 ; yes: call Routine1
    call Routine2 ; no: call Routine2
    jmp L3 ; and exit
    L1: call Routine1 ; call Routine1

    jmp L3 ; and exit

 L2: call Routine3

 L3:

;logical or operator
    cmp al,bl ; 1: compare AL to BL
    ja L1 ; if true, skip second expression
    cmp bl,cl ; 2: compare BL to CL
    jbe next ; false: skip next statement
L1: mov X,1 ; true: set X = 1
next:

;while loop
    mov eax,val1 ; copy variable to EAX
beginwhile:
    cmp eax,val2 ; if not (val1 < val2)
    jnl endwhile ; exit the loop
    inc eax ; val1++;
    dec val2 ; val2--;
    jmp beginwhile ; repeat the loop
endwhile:
    mov val1,eax ; save new value for val1