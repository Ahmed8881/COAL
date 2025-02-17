INCLUDE Irvine32.inc 

.data
    myArray1 BYTE 1,2,3,4,5  
    arrSize  = ($ - myArray1)
    sum DWORD ?              
    var1 DWORD ?             
    randomNum DWORD ?        

    ; Messages
    prompt  BYTE "Enter the number of times: ", 0
    randMsg BYTE "Random Number: ", 0
    sumMsg  BYTE "Sum of reversed array: ", 0

.code
main PROC
    call Randomize  

    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    mov var1, eax  

L1:
    call intSum

    mov eax, 10          
    call RandomRange
    mov randomNum, eax

    mov edx, OFFSET randMsg
    call WriteString
    mov eax, randomNum
    call WriteDec
    call Crlf

    dec var1
    cmp var1, 0
    jne L1

    call ExitProcess
main ENDP

intSum PROC
    pushad 

    mov ecx, arrSize
    mov esi, 0
L2:
    movzx eax, myArray1[esi]  
    push eax                 
    inc esi
    loop L2

    ; Pop from stack to reverse the array and sum it
    mov ecx, arrSize
    mov esi, 0
    xor eax, eax              
L3:
    pop ebx                   
    mov myArray1[esi], bl      
    add eax, ebx              
    inc esi
    loop L3

    mov sum, eax              

    mov edx, OFFSET sumMsg
    call WriteString

    mov eax, sum
    call WriteHex             
    call Crlf

    mov eax, sum
    call WriteBin             
    call Crlf

    mov eax, sum
    call WriteDec             
    call Crlf

    popad  
    ret
intSum ENDP

END main
