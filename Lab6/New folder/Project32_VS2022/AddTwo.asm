INCLUDE Irvine32.inc

.data
    msg1 BYTE "Sum: ", 0
    msg2 BYTE "Edited Sum: ", 0

.code
main PROC
    mov ECX, 15      
    mov EDX, 21      

    call AddTwoNumbers

    push EAX

    pop EAX
    mov EBX, EAX    

    mov edx, OFFSET msg1
    call WriteString
    call WriteInt
    call Crlf

    sub ESP, 4       
    mov [ESP], EBX   
    add DWORD PTR [ESP], 5 

    mov edx, OFFSET msg2
    call WriteString
    mov EAX, [ESP]   
    call WriteInt
    call Crlf

    invoke ExitProcess, 0
main ENDP

AddTwoNumbers PROC
    mov EAX, ECX     
    add EAX, EDX     
    ret
AddTwoNumbers ENDP

END main