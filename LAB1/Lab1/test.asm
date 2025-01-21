; This Code adds two 32-bit integers.
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.code
main proc
mov eax,5 ; Moving 5 to EAX Register
add eax,6 ; Adding 6 to the register EAX

; and store the result in the EAX itself

invoke ExitProcess,0
main endp
end main