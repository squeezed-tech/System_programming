format ELF executable 3
entry start

segment readable executable

start:
    mov esi, text_end - 1
    mov edi, buffer

reverse_loop:
    cmp esi, text
    jb print

    mov al, [esi]
    mov [edi], al

    dec esi
    inc edi
    jmp reverse_loop

print:
    mov byte [edi], 10

    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    mov edx, buffer_end - buffer
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80

segment readable writeable

text db 'PBREUSjkMUTGFNkuEzpyOMLGeDmEHCFHlF'
text_end:

buffer rb text_end - text + 1
buffer_end:
