_start:
    mov eax, Y ;move Y to eax register
    mov exb, 4 ;move 4 to ebx register
    imul ebx ;eax = eax * ebx
    add eax, 3 ; add 3 to eax
    mov X, eax ; move eax to X

; converting X = (Y*4) + 3 to assembly language.