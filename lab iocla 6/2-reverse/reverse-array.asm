%include "io.inc"

section .data

%define ARRAY_LEN 7

    input dd 1, 2, 3, 4, 5, 6, 7
    output times ARRAY_LEN dd 0

section .text
global CMAIN
CMAIN:

    PRINT_STRING "Array:"
    NEWLINE
    xor ecx, ecx
print_array:
    PRINT_UDEC 4, [input + 4 * ecx]
    NEWLINE
    inc ecx
    cmp ecx, ARRAY_LEN
    jb print_array
    
    ; TODO push the elements of the array on the stack
    ; TODO retrieve the elements (pop) from the stack into the output array
    xor ecx, ecx
lup:
    push dword [input + 4 * ecx]
    inc ecx
    cmp ecx, ARRAY_LEN
    jb lup
    xor ecx, ecx
lup1:
    pop dword [input + 4 * ecx]
    inc ecx
    cmp ecx, ARRAY_LEN
    jb lup1
    
PRINT_STRING "Reversed array:"
    NEWLINE
    xor ecx, ecx
print_array1:
    PRINT_UDEC 4, [input + 4 * ecx]
    NEWLINE
    inc ecx
    cmp ecx, ARRAY_LEN
    jb print_array1

    xor eax, eax
    ret
