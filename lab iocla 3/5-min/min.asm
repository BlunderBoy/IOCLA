%include "io.inc"

section .text
global CMAIN
CMAIN:
    ;cele doua numere se gasesc in eax si ebx
    mov eax, 4
    mov ebx, 1
    cmp eax, ebx
    jg ebx_mai_mic
    xchg eax, ebx
    
ebx_mai_mic:
    PRINT_DEC 4, ebx ; afiseaza minimul
    ret