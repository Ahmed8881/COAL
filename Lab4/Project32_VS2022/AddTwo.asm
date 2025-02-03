.386
.model flat,stdcall
.stack 4096
Include Irvine32.inc
ExitProcess proto, dwExitCode:dword
A = 17
B = 6
C1 = 9
D = 3
string1 EQU <"Hello World",0>
string2 EQU <"Assembly Language",0>
day1 EQU <"Monday",0>
day2 EQU <"Tuesday",0>
day3 EQU <"Wednesday",0>
day4 EQU <"Thursday",0>
day5 EQU <"Friday",0>
day6 EQU <"Saturday",0>
day7 EQU <"Sunday",0>
.data
var1 BYTE string1
var1_size = ($ - var1)
var2 BYTE string2
var2_size = ($ - var2)
weekdays BYTE day1, day2, day3, day4, day5, day6, day7
.code
main proc
    mov eax, A 
    mov ebx, B 
    mov ecx, C1 
    mov edx, D 
    add eax, ebx
    add ecx, edx
    sub eax, ecx
    call WriteInt
  call crlf

  
  mov eax , var1_size
  call WriteInt
  call crlf
  mov eax , var2_size
  call WriteInt


    INVOKE ExitProcess, 0
main ENDP
END main