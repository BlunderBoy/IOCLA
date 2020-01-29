%include "io.inc"

%define ARRAY_SIZE    10

section .data
    byte_array db 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    var db 1

section .text
global CMAIN
CMAIN:
    push ebp
    mov ebp, esp

    mov ecx, ARRAY_SIZE     ; Use ecx as loop counter.
    xor ebx, ebx ;par
    xor edx, edx ;impar

verificare:
    cmp ecx, 0
    je final
    mov al, byte [byte_array + ecx - 1]
    test [var], al
    jz par
    jnz impar
    loop verificare ; Decrement ecx, if not zero, add another element.
    
    jmp final
 
par:
   inc ebx
   dec ecx
   jmp verificare
 
impar:
    inc edx
    dec ecx
    jmp verificare
    
final:
    PRINT_UDEC 4, ebx
    NEWLINE
    PRINT_UDEC 4, edx
    NEWLINE
    leave
    ret
