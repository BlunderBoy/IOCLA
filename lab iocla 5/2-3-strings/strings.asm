%include "io.inc"

section .data
    string db "Lorem ipsum dolor sit amet.", 0
    print_strlen db "strlen: ", 10, 0
    print_occ db "occurences of `i`:", 10, 0
    
    occurences dd 0
    length dd 0    
    char db 'o'
    var dd 100

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp

    ; TODO1: compute the length of a string
     mov edi, string
     mov al, 0
     mov ecx, [var]
     repne scasb

    ; TODO1: save the result in at address length
    inc ecx
    sub [var], ecx
    mov ecx, [var]
    mov [length], ecx

    ; print the result of strlen
    PRINT_STRING print_strlen
    PRINT_UDEC 4, [length]
    NEWLINE

    ; TODO2: compute the number of occurences
    xor edx, edx
    mov edi, string
    mov al, [char]
    mov ebx, string
    add ebx, [length]
    cld
    
eticheta:
    repne scasb
    inc edx
    cmp ebx, edi
    jnz eticheta
    
    dec edx
    
    ; TODO2: save the result in at address occurences


    ; print the number of occurences of the char
    PRINT_STRING print_occ
    PRINT_UDEC 4, edx
    NEWLINE

    xor eax, eax
    leave
    ret
