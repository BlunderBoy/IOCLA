%include "io.inc"

section .data
    string db "Lorem ipsum dolor sit amet.", 0
    print_strlen db "strlen: ", 10, 0
    print_occ db "occurences of `m`:", 10, 0

    occurences dd 0
    length dd 0    
    char db 'm'

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp

    ; TODO1: compute the length of a string
    mov al, 0
    mov edi, string
    repne scasb
    mov ebx, string
    sub edi, ebx
    dec edi

    ; TODO1: save the result in at address length
    mov [length], edi
    ; print the result of strlen
    PRINT_STRING print_strlen
    PRINT_UDEC 4, [length]
    NEWLINE

    ; TODO2: compute the number of occurences
    mov ebx, string ; old pos
    mov ecx, [length] ;conditia de oprire
    mov al, [char]
    mov edi, string
bucla:
    repne scasb
    inc byte[occurences]
    cmp ecx, 0
    ja bucla
    dec byte[occurences]

    ; TODO2: save the result in at address occurences

    ; print the number of occurences of the char
    PRINT_STRING print_occ
    PRINT_UDEC 4, [occurences]
    NEWLINE

    xor eax, eax
    leave
    ret
