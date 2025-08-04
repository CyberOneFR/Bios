BITS 16
org 0x0000

start:
    cli
    mov dx, 0x3D4
    mov al, 0x0A
    out dx, al
    inc dx
    in al, dx
    and al, 0x1F
    out dx, al
    mov ax, 0xB800
    mov es, ax
    mov byte [es:0], 'B'
    mov byte [es:1], 0x07
    jmp $

%assign CODE_SIZE ($ - $$)
%if CODE_SIZE > 0xFFF0
    %error "BIOS TROP GROS"
%endif
times 0xFFF0 - CODE_SIZE db 0

reset_vector:
    db 0xEA
    dw start
    dw 0xF000

times 65536 - ($ - $$) db 0