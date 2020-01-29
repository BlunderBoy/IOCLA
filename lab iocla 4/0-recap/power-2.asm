%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp

    mov eax, 211    ; to be broken down into powers of 2
    mov ebx, 1      ; stores the current power

    test eax, ebx
    jz par
    jnz continuare
    
par:
    shr eax, 1
    test eax, ebx
    jz continuare

impar:
    PRINT_UDEC 4, ebx
    shl ebx, 1
    
continuare:
    test eax, ebx
    jz shift
    jnz print
    
shift:
    cmp eax, ebx
    jb final
    shl ebx, 1
    ja continuare

print:
    NEWLINE
    PRINT_DEC 4, ebx 
    shl ebx, 1
    jmp continuare
    
final:   
leave
ret

