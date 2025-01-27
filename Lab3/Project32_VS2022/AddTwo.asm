.386
.model flat,stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
Rval SDWORD ?
Xval SDWORD 26
Yval SDWORD 30
Zval SDWORD 40

.code
main PROC
    ; Set and reset Zero Flag (ZF)
    mov al, 1
    add al, -1      ; ZF = 1
    add al, 1       ; ZF = 0

    ; Set and reset Sign Flag (SF)
    mov al, 0
    add al, -1      ; SF = 1
    add al, 1       ; SF = 0

    ; Set and reset Carry Flag (CF)
    mov al, +127
    add al, 1   
    add al, 1 

    ; Set and reset Overflow Flag (OF)
    mov al, +127
    add al, 1       ; OF = 1
    add al, 1      ; OF = 0
        ; Set and reset Overflow Flag (OF)
    mov al, 2
    add al, 2      
    add al, 1      

  


    INVOKE ExitProcess, 0
main ENDP
END main