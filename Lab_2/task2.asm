format ELF executable 3
entry start

M = 15
K = 29

segment readable executable

start:
    mov esi, M

row_loop:
    mov edi, buffer
    mov ecx, K

col_loop:
    mov byte [edi], '!'
    inc edi
    loop col_loop

    mov byte [edi], 10

    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    mov edx, K + 1
    int 0x80

    dec esi
    jnz row_loop

    mov eax, 1
    xor ebx, ebx
    int 0x80

segment readable writeable

buffer rb K + 1
