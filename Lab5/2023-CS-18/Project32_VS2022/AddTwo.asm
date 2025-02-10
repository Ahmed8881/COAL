.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
Include Irvine32.inc
.data 
array WORD 50 DUP(5)
array_length DWORD ?
sum DWORD ?
average DWORD ?
;----------------part 2-------------------
array1   byte   "Hello World", 0
array2   byte   "ABC GHI XYZ", 0
temp     byte   12 dup(0)      ; temporary storage for exchange


.code
main proc
    ; Task 1: Find the number of bytes consumed by the array
    mov eax, SIZEOF array

    ; Task 2: Find the length of the array and fetch data at the 100th index
    mov eax, SIZEOF array / 2 
    mov array_length, eax    
    mov ecx, array_length    
    mov eax, 49
    mov ax, array[eax*2] ;

    ; Task 3: Sum the elements of the array and find the average value
    ; use 49 beacuse at 100 giving out of index and now use 49 beacuse word=2 Byte
    mov eax, 0        
    mov sum, eax
    mov ecx, 0         

sum_loop:
    cmp ecx, array_length
    ;   if counter >= array_length
    jge end_sum_loop  
    ; i used movzx as i copy 16 bit value to 32 bit reg and using mov giving me error 
    movzx ebx, array[ecx*2] 
    add eax, ebx      
    inc ecx           
    jmp sum_loop       

end_sum_loop:
    mov sum, eax     

    ; Calculate the average
    mov eax, sum
    cdq                 ; Sign extend EAX into EDX:EAX
    idiv array_length   
    mov average, eax  
    Call WriteInt    
    
     ; Exchange contents of array1 and array2
    mov     esi, OFFSET array1
    mov     edi, OFFSET array2
    mov     ebx, OFFSET temp

    ; Copy array1 to temp
    mov     ecx, 12
copy1:
    mov     al, [esi]
    mov     [ebx], al
    inc     esi
    inc     ebx
    loop    copy1

    ; Copy array2 to array1
    mov     esi, OFFSET array2
    mov     ebx, OFFSET array1
    mov     ecx, 12
copy2:
    mov     al, [esi]
    mov     [ebx], al
    inc     esi
    inc     ebx
    loop    copy2

    ; Copy temp to array2
    mov     esi, OFFSET temp
    mov     ebx, OFFSET array2
    mov     ecx, 12
copy3:
    mov     al, [esi]
    mov     [ebx], al
    inc     esi
    inc     ebx
    loop    copy3

    ; Print array2 using array1's name
    mov     esi, OFFSET array1
    mov     ecx, 12
printLoop:
    mov     al, [esi]
    call    WriteChar
    inc     esi
    loop    printLoop


    ; Exit process
    invoke ExitProcess,0
main endp
end main