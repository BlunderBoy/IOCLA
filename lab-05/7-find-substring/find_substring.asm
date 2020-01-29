%include "io.inc"

section .data
source_text: db "ABCABCBABCBABCBBBABABBCBABCBAAACCCB", 0
substring: db "BABC", 0
length db 35

source_length: resd 1
substr_length: dd 4

print_format: db "Substring found at index: ", 0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp

    ; TODO: Fill source_length with the length of the source_text string.
    ; Find the length of the string using scasb.
    
    ; TODO: Print the start indices for all occurrences of the substring in source_text
    mov edi, source_text
    xor edx, edx
    mov ecx, 35
bucla:
    xor edx, edx
    mov al, byte[substring + edx]
    repne scasb
    cmp ecx, 0
    jz final
    mov ebx, edi
    dec ebx
bucla_in:
    inc ebx
    inc edx
    cmp edx, 4
    je gasit
 back:
    push eax
    xor eax, eax
    mov al, byte[ebx]
    cmp al, byte[substring + edx]
    pop eax
    je bucla_in
    
    cmp ecx, 0
    jnz bucla
    
    jmp final
gasit:
    push eax
    mov eax, edi
    sub eax, source_text
    dec eax
    PRINT_STRING "gasit la: "
    PRINT_UDEC 4, eax
     NEWLINE
    pop eax
    jmp back  
    
final:  
    leave
    ret
