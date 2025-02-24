Include Irvine32.inc
.data
	MAX = 80
	stringIn BYTE MAX+1 DUP(?)
	prompt BYTE "Enter a string: ",0
.code

main PROC
	; Get a string
	mov edx,OFFSET prompt
	call WriteString
	mov edx, OFFSET stringIn
	mov ecx, MAX
	call ReadString
	
	; Find 'h'
	mov bl, 'h'
	call arrayFind
	movzx edx, al

	push edx


	; Get another string
	mov edx,OFFSET prompt
	call WriteString
	mov edx, OFFSET stringIn
	mov ecx, MAX
	call ReadString

	; Uppercase the string
	call toUpper

	; Find 'R'
	mov bl, 'R'
	call arrayFind

	pop edx
	mov dh, al
	; Sum the results
	add dl, dh

	; Compare with 25
	cmp dl, 25
	jl L1
	jmp L2

	L1:
		invoke ExitProcess,0

	L2:
		; Infinite loop
		jmp L2

main ENDP

; Character to find should be in bl
; Returns value in al
arrayFind PROC USES ecx esi
	mov ecx, LENGTHOF stringIn
	mov esi, OFFSET stringIn
	L1:
		cmp BYTE PTR [esi], bl
		je L2 ;found
		inc esi
		loop L1
	; not found
	mov al, 0
	jmp L3
	L2:
		mov al, BYTE PTR [esi]
	L3:
		ret
arrayFind ENDP

toUpper PROC USES ecx esi
	mov ecx,LENGTHOF stringIn
	mov esi,OFFSET stringIn
	L1:
		and BYTE PTR [esi],11011111b ; clear bit 5
		inc esi
		loop L1
	ret
toUpper ENDP
END main