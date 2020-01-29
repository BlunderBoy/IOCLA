%include "io.inc"
extern puts

section .data
    mystring db "This is my string", 0
    format db "String length is %u", 10, 0

section .text
global CMAIN

CMAIN:
    push ebp
    mov ebp, esp

    mov eax, mystring
    xor ecx, ecx
test_one_byte:
    mov bl, byte [eax]
    test bl, bl
    je out
    inc eax
    inc ecx
    jmp test_one_byte

out:
    PRINT_DEC 4, ecx
    push 5
    push ecx
    push format
    call printf
    add esp, 8
    pop eax
    PRINT_DEC 4, eax
    
    

    leave
    ret
