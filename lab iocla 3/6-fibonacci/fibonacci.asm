%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ecx, 7      ; vrem sa aflam al N-lea numar; N = 7
    mov eax, 0
    mov ebx, 1

fibo:
    add eax, ebx
    mov edx, eax
    mov eax, ebx
    mov ebx, edx
    dec ecx
    jnz fibo
    PRINT_UDEC 4, edx ; afiseaza minimul
ret