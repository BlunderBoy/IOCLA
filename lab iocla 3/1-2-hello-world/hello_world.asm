%include "io.inc"

section .data
    myString: db "Hello, World!",0
    PapaLume: db "Goodbye, World!",0

section .text
global CMAIN
CMAIN:
    mov ecx, 6   ; Numar de repetari ale lui hellow world               
    mov eax, 2
    mov ebx, 1
    cmp eax, ebx
    jne print                   ; TODO1: eax > ebx? //DONE
    ret
print:
    PRINT_STRING myString
    NEWLINE
    PRINT_STRING PapaLume
                               ; TODO2.1: afisati "Goodbye, World!" //done
                               ; TODO2.2: afisati "Hello, World!" de N ori
    NEWLINE
ciclu:
    PRINT_STRING myString
    NEWLINE
    dec ecx
    jnz ciclu

    ret
