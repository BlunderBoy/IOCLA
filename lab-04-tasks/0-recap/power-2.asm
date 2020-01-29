%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp

    mov eax, 128    ; to be broken down into powers of 2
    mov ebx, 1      ; stores the current power

    ; TODO - print the powers of 2 that generate number stored in EAX
    
bucla:
    test eax, ebx
    jnz print
back:
    shl ebx, 1
    cmp eax, ebx
    jae bucla

    jmp final
print:
    PRINT_UDEC 4, ebx
    NEWLINE
    jmp back
final:
    leave
    ret
