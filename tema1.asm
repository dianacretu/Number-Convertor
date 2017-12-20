%include "io.inc"

section .data
   %include "input.inc"
    ;nums dd 4
    ;nums_array dd 612, 1330, 7, 12988
    ;base_array dd 16, 1, 2, 14
    message db "Baza incorecta", 0
    
section .text
global CMAIN

CMAIN:
    mov ebp, esp

   ; mov ecx, [nums]
   mov ecx, 1
base:
   
    cmp ecx, [nums]
    jg exit
    mov eax, [nums_array + 4*(ecx-1)]
    mov ebx, [base_array + 4*(ecx-1)]
    cmp ebx, 2
    jl baza_incorecta
    cmp ebx, 16
    jg baza_incorecta
     
    
impartire:
    xor edx, edx
    div ebx
    cmp edx, 9
    jg bigger_10
    add edx, '0'
    push edx
    cmp eax, 0
    jg impartire
    inc ecx
    jmp print
    
bigger_10:

    add edx, 87
    push edx
    cmp eax, 0
    jg impartire
    inc ecx
    
print:
    cmp ebp, esp
    je linie_noua
    pop eax
    PRINT_CHAR eax
    jmp print

linie_noua:
    NEWLINE
    jmp base
    
baza_incorecta:
    PRINT_STRING message
    NEWLINE
    inc ecx
    cmp ecx, [nums]
    jl base
    
exit:
    xor eax, eax
    ret