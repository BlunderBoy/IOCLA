%include "io.inc"

section .data
    vector dd 30, 31, 100, 86, 23, 9, 64, 90, 25, 96
    n      dd ($-vector)/4
    format db "Media elementelor: %f", 10, 0
    c      dd 0

section .text
    global CMAIN

extern printf

CMAIN:
    ; incarca valoarea 0 pe stiva FPU
    fldz

    ; TODO: parcurgerea tuturor elementelor si adunare la valoarea din varful stivei FPU (adunare intreaga)
    mov ecx, 10
    xor eax, eax
bucla:
    add eax, dword[vector + ecx * 4]
    loop bucla
    mov [c],eax
    PRINT_UDEC 4, eax
    fild dword[c]
    ; TODO: impartirea sumei la numarul de elemente (impartire intreaga)
    fidiv dword[n]

    ; TODO Afisarea rezultatului
    ; Rezultatul ar trebui sa fie 55.4
    add esp, 8
    fstp qword[esp]
    push format
    call printf
    add esp, 12

    xor eax, eax
    ret
