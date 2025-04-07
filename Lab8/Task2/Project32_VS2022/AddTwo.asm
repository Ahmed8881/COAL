INCLUDE Irvine32.inc  

.DATA  
    myArray DWORD -8, 6, 5, 10, -22, 0, 87, 6, 9, -90  
    arraySize DWORD 10                                    
    largest DWORD ?  
    msgBefore BYTE "Original Array: ", 0  
    msgAfter  BYTE "Updated Array: ", 0  

.CODE  
main PROC  
    mov edx, OFFSET msgBefore  
    call WriteString  
    call Crlf  
    call DisplayArray  

    call FindLargest  

    call ShiftAndInsert  
    
    inc arraySize

    mov edx, OFFSET msgAfter  
    call WriteString  
    call Crlf  
    call DisplayArray  

    INVOKE ExitProcess, 0
main ENDP  

FindLargest PROC  
    mov ecx, arraySize    
    mov esi, OFFSET myArray 
    mov eax, [esi]         ; Load first element into eax
    add esi, 4              ; Move to next element
    dec ecx                ; Decrement count (arraySize - 1)

    ; Loop through remaining elements
    .WHILE ecx != 0
        mov edx, [esi]      ; Load current element
        .IF edx > eax       ; Compare with current largest
            mov eax, edx    ; Update largest if necessary
        .ENDIF
        add esi, 4          ; Move to next element
        dec ecx             ; Decrement counter
    .ENDW

    mov largest, eax        ; Store the largest value
    ret  
FindLargest ENDP  

ShiftAndInsert PROC  
    mov ecx, arraySize      ; Number of elements to shift
    mov esi, OFFSET myArray 
    ; Calculate address of last element
    mov eax, arraySize      
    dec eax                 
    imul eax, 4            
    add esi, eax            ; ESI points to last element

    ; Shift elements to the right
    .WHILE ecx != 0
        mov edx, [esi]      ; Load current element
        mov [esi + 4], edx  ; Shift to the right
        sub esi, 4          ; Move to previous element
        dec ecx             ; Decrement counter
    .ENDW

    ; Insert largest at the beginning
    mov eax, largest        
    mov [myArray], eax      
    ret  
ShiftAndInsert ENDP  

DisplayArray PROC  
    mov ecx, arraySize  
    mov esi, OFFSET myArray  

    ; Display each element
    .WHILE ecx > 0
        mov eax, [esi]      ; Load element
        call WriteInt       ; Display integer
        mov al, ' '         ; Space separator
        call WriteChar      
        add esi, 4          ; Next element
        dec ecx             ; Decrement counter
    .ENDW

    call Crlf               ; New line
    ret  
DisplayArray ENDP  

END main