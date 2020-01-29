%include "io.inc"
extern printf

section .data
    before_format db "before %s", 13, 10, 0
    after_format db "after %s", 13, 10, 0
    mystring db "abcdefghij", 0

section .text
global CMAIN

toupper:
    push ebp
    mov ebp, esp
    xor ebx, ebx
    
    mov ecx, 9
    mov eax, [ebp+8]
lup:
    mov bl, byte[eax + ecx]
    sub bl, 32
    mov byte[eax + ecx], bl
    loop lup
    
    mov bl, byte[eax]
    sub bl, 32
    mov byte[eax + ecx], bl

    leave
    ret

CMAIN:
    push ebp
    mov ebp, esp

    push mystring
    push before_format
    call printf
    add esp, 8

    push mystring
    call toupper
    add esp, 4

    push mystring
    push after_format
    call printf
    add esp, 8

    leave
    ret
