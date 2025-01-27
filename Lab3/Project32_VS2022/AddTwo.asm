; SolveEquation.asm - solves the equation (10 - 7) * (5 + 6) * 9 using only the EAX register
; Example program
include irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.data
    result1 DWORD ?
   


.code
main proc
 ;first step
    mov EAX, 10
    sub EAX, 7
    mov result1, EAX
    ;step 2
    mov EAX, 5
    add EAX, 6

    ; Multiply the results of (10 - 7) and (5 + 6)
    imul EAX, result1

    ; Multiply the result by 9
    imul EAX, 9

 call WriteInt
 ;first step
 mov EAX ,5
 imul EAX, 4

 mov EBX,3
 add EBX,7
 imul EBX, 21
 sub EAX, EBX
 call WriteInt


    invoke ExitProcess, 0
main endp
end main