.386
.model flat,stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword
include irvine32.inc

.data
testVal dword 0F16Bh
.code
main PROC

    and eax, 0
    and ebx, 0
mov ebx,testVal
shl ebx,16
SHLD eax,ebx,16
Call WriteHex



    INVOKE ExitProcess, 0
main ENDP
END main
