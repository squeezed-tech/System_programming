format ELF executable 3
entry start

M = 15
K = 29

segment readable executable

start:
    mov esi, 1

row_loop:
    mov edi, buffer
    mov ecx, K
    sub ecx, esi

spaces:
    cmp ecx, 0
    je symbols

    mov byte [edi], ' '
    inc edi
    dec ecx
    jmp spaces

symbols:
    mov ecx, esi

symbol_loop:
    mov byte [edi], '!'
    inc edi
    dec ecx
    jnz symbol_loop

    mov byte [edi], 10

    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    mov edx, K + 1
    int 0x80

    inc esi
    cmp esi, K + 1
    jb row_loop

    mov eax, 1
    xor ebx, ebx
    int 0x80

segment readable writeable

buffer rb K + 1
