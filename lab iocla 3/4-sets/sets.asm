%include "io.inc"

section .text
global CMAIN
CMAIN:
    ;cele doua multimi se gasesc in eax si ebx
    mov eax, 139 
    mov ebx, 169
    PRINT_DEC 4, eax ; afiseaza prima multime
    NEWLINE
    PRINT_DEC 4, ebx ; afiseaza cea de-a doua multime
    NEWLINE

    ;reuniune
    mov ecx, eax
    or ecx, ebx
    PRINT_UDEC 4, ecx
    NEWLINE

    ; TODO2: adaugarea unui element in multime
    or eax, 2
    or ebx, 4

    ; TODO3: intersectia a doua multimi
    mov ecx, eax
    and ecx, ebx
    PRINT_UDEC 4, ecx
    NEWLINE

    ; TODO4: complementul unei multimi
    mov ecx, eax
    not ecx
    inc ecx
    PRINT_DEC 4, ecx
    NEWLINE

    ; TODO5: eliminarea unui element
    xor eax, 1
    PRINT_DEC 4, eax
    NEWLINE


    ; TODO6: diferenta de multimi EAX-EBX
    mov ecx, eax
    and ecx, ebx
    sub ebx, ecx

 ret