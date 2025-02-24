.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

include Irvine32.inc

.data
dataArray DWORD 5 DUP(?)
arraySum DWORD ?
message1 BYTE "Sum is Greater than EAX",0
message2 BYTE "Sum is Less than EAX",0
message3 BYTE "Sum is Equal to EAX",0

.code
main proc
    mov esi, offset dataArray
    mov arraySum, 0

    ; Get five integers from the user and store in dataArray
    mov ecx, 5
input_loop:
    call ReadInt
    mov [esi], eax
    add esi, 4
    loop input_loop

    ; Calculate the sum of the array
    mov esi, offset dataArray
    mov ecx, 5
sum_loop:
    mov eax, [esi]
    add arraySum, eax
    add esi, 4
    loop sum_loop

    call ReadInt

    ; Compare arraySum with EAX
    mov esi, arraySum
    cmp esi, eax
    jg greater
    jl less
    je equal
    jmp end_program

greater:
    mov edx, offset message1
    call MsgBox
    jmp end_program

less:
    mov edx, offset message2
    call MsgBox
equal:
	mov edx, offset message3
	call MsgBox
 

end_program:
    invoke ExitProcess, 0
main endp
end main