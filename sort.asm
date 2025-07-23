section .data
    numArray db 12h, 62h, 24h, 22h, 26h
    
    msg db "Sorted array ascending-", 10
    msgLen equ $-msg
    
    msg2 db "Sorted array descending-", 10
    msgLen2 equ $-msg2
    
section .bss
    
%macro rw 4
    mov rax,%1
    mov rdi,%2
    mov rsi,%3
    mov rdx,%4
    syscall
%endmacro

section .text
    global _start
    
_start:
    rw 1, 1, msg, msgLen
    
    mov al, 05
    outerLoop:
    	mov bl, 05
    	innerLoop:
    		cmp 
    		sub bl, 01
    		cmp bl, 00
    		jne innerLoop
    		
    	sub al, 01
    	cmp al, 00
    	jne outerLoop
    
    rw 1, 1, msg2, msgLen2
    rw 60,0,0,0
