%include "io.inc"

%define NUM 5

section .text
global CMAIN
CMAIN:
    mov ebp, esp

    ; TODO 1: replace every push by an equivalent sequence of commands
    
    ; pushing an array on the stack
    mov ecx, NUM
push_nums:
    sub esp, 4
    mov [esp], ecx
    loop push_nums

    ; pushing a string on the stack
    mov dword [esp], 0
    sub esp, 4

    mov byte [esp], "e"
    sub esp, 1
    
    mov byte [esp], "r"
    sub esp, 1
    
    mov byte [esp], "e"
    sub esp, 1
    
    mov byte [esp], "m"
    sub esp, 1
    
    mov byte [esp], " "
    sub esp, 1
   
    mov byte [esp], "e"
    sub esp, 1
    
    mov byte [esp], "r"
    sub esp, 1
    
    mov byte [esp], "a"
    sub esp, 1
    
    mov byte [esp], " "
    sub esp, 1
    
    mov byte [esp], "a"
    sub esp, 1
    
    mov byte [esp], "n"
    sub esp, 1
    
    mov byte [esp], "A"


    ; TODO 2: print the stack in "address: value" format in the range of [ESP:EBP]
    ; (from low addresses to high addresses, byte by byte)
lup:
    PRINT_STRING "["
    PRINT_HEX 4, ESP
    PRINT_STRING ":"
    PRINT_HEX 4, EBP
    PRINT_STRING "]"
    PRINT_STRING ":"
    PRINT_UDEC 1, [ESP]
    NEWLINE
    add esp, 1
    cmp ebp, esp
    jnz lup
    NEWLINE
    ; TODO 3: print the string byte by byte
    


    ; TODO 4: print the array element by element

    ; restore the previous value of the EBP (Base Pointer)
    mov esp, ebp

    ; exit without errors
    xor eax, eax
    ret
