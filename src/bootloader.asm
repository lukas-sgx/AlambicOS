[org 0x7C00]
    bits 16

    xor ax, ax
    mov ds, ax
    mov es, ax
    mov si, msg
    call print
    cli
    hlt
print:
    lodsb
    or al, al
    jz done
    mov ah, 0x0e
    int 0x10
    jmp print
done:
    ret
msg:
    db "Hello World!!!", 0
times 510-($-$$) db 0
dw 0xAA55