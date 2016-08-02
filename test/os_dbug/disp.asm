org 07c00h;
mov ax, cs
mov ds, ax
mov es, ax
call DispA;
jmp $;
DispA:
mov ax, BootMess
mov bp, ax;
mov cx, 16;
mov ax, 01301h;
mov bx, 001bh;
mov dl, 0;
int 10h;
ret
BootMess: dw "Hello  OS world "
times 510 - ($-$$) db 0 ;
dw 0xaa55;
