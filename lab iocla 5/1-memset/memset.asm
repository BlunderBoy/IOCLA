%include "io.inc"

extern printf

%DEFINE LENGTH 20

section .data
    string db "Nunc tristique ante maximus, dictum nunc in, ultricies dui.", 0
    char db 'a'

section .text
global CMAIN
CMAIN:
    push ebp
    mov ebp, esp

    mov al, [char]

    mov edi, string

    mov ecx, 20

    ; TODO: use a stosb loop to store to string; use no more than 1 instruction
    rep stosb

    ; print the string
    PRINT_STRING string

    xor eax, eax
    leave
    ret
