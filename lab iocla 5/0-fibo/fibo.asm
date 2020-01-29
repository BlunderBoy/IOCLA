%include "io.inc"
section .data
    N dd 9 ; compute the sum of the first N fibonacci numbers
    
section .text
global CMAIN
CMAIN:
    push ebp
    mov ebp, esp

    mov ecx, [N]  
    xor edx, edx    
    mov eax, 0
    mov ebx, 1
fibo:
   
    add eax, ebx
    mov edx, eax
    mov eax, ebx
    mov ebx, edx
    dec ecx
    jnz fibo

    dec edx
    PRINT_STRING "Sum first "
    PRINT_DEC 4, [N]
    PRINT_STRING " fibo is "
    PRINT_UDEC 4, edx

    leave
    ret
