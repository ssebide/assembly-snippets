MySub PROC
    push ebp
    mov ebp,esp
    sub esp,8 ; create locals
    mov DWORD PTR [ebp4],10 ; X
    mov DWORD PTR [ebp8],20 ; Y
    mov esp,ebp ; remove locals from stack
    pop ebp
    ret
MySub ENDP

