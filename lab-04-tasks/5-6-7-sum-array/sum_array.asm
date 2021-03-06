%include "io.inc"

%define ARRAY_SIZE    10

section .data
    array dw 8, -2, 1, -3, -6, 200, -128, 19, 78, 102
    byte_array db 8, 19, 12, 3, 6, 200, 128, 19, 78, 102
    word_array dw 1893, 9773, 892, 891, 3921, 8929, 7299, 720, 2590, 28891
    dword_array dd 1392849, 12544, 879923, 8799279, 7202277, 971872, 28789292, 17897892, 12988, 8799201
    print_format db "Array sum is ", 0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp

    mov ecx, ARRAY_SIZE     ; Use ecx as loop counter.
    xor eax, eax            ; Use eax to store the sum.
    xor edx, edx            ; Store current value in dl; zero entire edx.

add_byte_array_element:
    mov dl, byte [byte_array + ecx - 1]
    add eax, edx
    loop add_byte_array_element ; Decrement ecx, if not zero, add another element.

    PRINT_STRING print_format
    PRINT_UDEC 4, eax
    NEWLINE


    ; TODO: Compute sum for elements in word_array and dword_array.
    xor eax, eax
    mov ecx, ARRAY_SIZE
    xor ebx, ebx
    xor edx, edx
add_word_array:
    mov dx, word[word_array + ebx * 2]
    add eax, edx
    inc ebx
    dec ecx
    cmp ecx, 0
    jnz add_word_array
    
    PRINT_STRING print_format
    PRINT_UDEC 4, eax
    NEWLINE
    
    xor eax, eax
    mov ecx, ARRAY_SIZE
    xor ebx, ebx
    xor edx, edx
add_word_array1:
    mov edx, dword[dword_array + ebx * 4]
    add eax, edx
    inc ebx
    dec ecx
    cmp ecx, 0
    jnz add_word_array1
    
    PRINT_STRING print_format
    PRINT_UDEC 4, eax
    
    ;eax nr pozitive
    ;ebx nr negative
    ;esi counter
    xor eax, eax
    xor edx, edx
    xor ebx, ebx
    xor esi, esi
    mov ecx, 10
numere_pozitive:
    mov dx, word[array + esi]
    cmp dx, 0
    jg pozitiv
    jl negativ
next:
    inc esi
    dec ecx
    cmp ecx, 0
    jnz numere_pozitive
    jz final
    
pozitiv:
    inc eax
    jmp next
negativ:
    inc ebx
    jmp next
 final:   
 NEWLINE
 PRINT_UDEC 4, eax
 NEWLINE
 PRINT_UDEC 4, ebx
    xor eax, eax
    leave
    ret
