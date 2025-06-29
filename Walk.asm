TITLE Drunkard's Walk (Walk.asm)
; Drunkard's walk program. The professor starts at
; coordinates 25, 25 and wanders around the immediate area.
INCLUDE Irvine32.inc
WalkMax = 50
StartX = 25
StartY = 25
DrunkardWalk STRUCT
path COORD WalkMax DUP(<0,0>)
pathsUsed WORD 0
DrunkardWalk ENDS
DisplayPosition PROTO currX:WORD, currY:WORD
.data
    aWalk DrunkardWalk <>
.code
    main PROC
    mov esi,OFFSET aWalk
    call TakeDrunkenWalk
    exit
    main ENDP

    ;-------------------------------------------------------
    TakeDrunkenWalk PROC
    LOCAL currX:WORD, currY:WORD
    ;
    ; Take a walk in random directions (north, south, east,
    ; west).
    ; Receives: ESI points to a DrunkardWalk structure
    ; Returns: the structure is initialized with random values
    ;-------------------------------------------------------
    pushad
    ; Use the OFFSET operator to obtain the address of the
    ; path, the array of COORD objects, and copy it to EDI.
    mov edi,esi
    add edi,OFFSET DrunkardWalk.path
    mov ecx,WalkMax ; loop counter
    mov currX,StartX ; current X-location
    mov currY,StartY ; current Y-location
Again:
    ; Insert current location in array.
    mov ax,currX
    mov (COORD PTR [edi]).X,ax
    mov ax,currY
    mov (COORD PTR [edi]).Y,ax
    INVOKE DisplayPosition, currX, currY
    mov eax,4 ; choose a direction (0-3)
    call RandomRange
    .IF eax == 0 ; North
    dec currY
    .ELSEIF eax == 1 ; South
    inc currY
    .ELSEIF eax == 2 ; West
    dec currX
    .ELSE ; East (EAX = 3)
    inc currX
    .ENDIF
    add edi,TYPE COORD ; point to next COORD
    loop Again
Finish:
    mov (DrunkardWalk PTR [esi]).pathsUsed, WalkMax
    popad
    ret
    TakeDrunkenWalk ENDP
    ;-------------------------------------------------------
    DisplayPosition PROC currX:WORD, currY:WORD
    ; Display the current X and Y positions.
    ;-------------------------------------------------------

.data
    commaStr BYTE ",",0
.code
    pushad
    movzx eax,currX ; current X position
    call WriteDec
    mov edx,OFFSET commaStr ; "," string
    call WriteString
    movzx eax,currY ; current Y position
    call WriteDec
    call Crlf
    popad
    ret
    DisplayPosition ENDP
    END main
    TakeDrunkenWalk Procedure Let’s take a closer look at the TakeDrunkenWalk proce-
    dure. It receives a pointer (ESI) to a DrunkardWalk structure. Using the OFFSET operator, it
    calculates the offset of the path array and copies it to EDI:
    mov edi,esi
    add edi,OFFSET DrunkardWalk.path
    The initial X and Y positions (StartX and StartY) of the professor are set to 25, at the center of
    an imaginary 50-by-50 grid. The loop counter is initialized:
    mov ecx, WalkMax ; loop counter
    mov currX,StartX ; current X-location
    mov currY,StartY ; current Y-location
    At the beginning of the loop, the first entry in the path array is initialized:
Again:
    ; Insert current location in array.
    mov ax,currX
    mov (COORD PTR [edi]).X,ax
    mov ax,currY
    mov (COORD PTR [edi]).Y,ax
    At the end of the walk, a counter is inserted into the pathsUsed field, indicating how many steps
    were taken:
Finish:
mov (DrunkardWalk PTR [esi]).pathsUsed, WalkMax