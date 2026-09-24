format ELF executable 3
entry start

N = 2269503710

segment readable executable

start:
    mov eax, N
    xor esi, esi
    mov ebx, 10

sum_loop:
    xor edx, edx
    div ebx

    add esi, edx

    cmp eax, 0
    jne sum_loop

    ; Сумма = 35
    ; Выводим десятки и единицы отдельно
    mov eax, esi
    xor edx, edx
    mov ebx, 10
    div ebx

    add al, '0'
    mov [result], al

    add dl, '0'
    mov [result + 1], dl

    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 3
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80

segment readable writeable

result db 0, 0, 10
