; filepath: d:\UET\COAL LAB\COAL\Lab8\Project32_VS2022\AddTwo.asm
INCLUDE Irvine32.inc

.data
promptMsg db "Enter student marks (0-100): ", 0
gradeA db "Grade: A", 0
gradeB db "Grade: B", 0
gradeC db "Grade: C", 0
invalidMsg db "Invalid marks!", 0
marksMsg db "Student marks: ", 0

.code
main PROC
    mov edx, OFFSET promptMsg
    call WriteString
    call ReadInt
    mov ebx, eax
    
    mov edx, OFFSET marksMsg
    call WriteString
    mov eax, ebx
    call WriteDec
    call Crlf
    
    cmp ebx, 0
    jl invalid
    cmp ebx, 100
    jg invalid
    
    cmp ebx, 90
    jg gradeIsA
    
    cmp ebx, 80
    jg gradeIsB
    
    cmp ebx, 70
    jg gradeIsC
    
    jmp invalid
    
gradeIsA:
    mov edx, OFFSET gradeA
    jmp displayGrade
    
gradeIsB:
    mov edx, OFFSET gradeB
    jmp displayGrade
    
gradeIsC:
    mov edx, OFFSET gradeC
    jmp displayGrade
    
invalid:
    mov edx, OFFSET invalidMsg
    
displayGrade:
    call WriteString
    call Crlf
    
    exit
main ENDP
END main