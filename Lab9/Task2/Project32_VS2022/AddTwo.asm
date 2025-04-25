.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
INCLUDE Irvine32.inc

.data
testVal SWORD -170    

.code
main PROC
    
    and eax, 0      
    mov ax, testVal    
    
  
    shl eax, 16        
    sar eax, 16        
    


    call WriteInt      
    call Crlf
    
    INVOKE ExitProcess, 0
main ENDP
END main