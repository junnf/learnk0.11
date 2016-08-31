start_sector_app equ 100
SECTION mbr align=16 vstart=0x7c00

mov ax, 0
mov ss, ax
mov sp, ax

mov ax, [cs:phy_base]
mov dx, [cs:phy_base+0x02]
mov bx, 16
div bx
;DX:AX / 16 ,商储存在AX

mov ds, ax
mov es, ax

    xor di, di
    xor bx, bx
    mov si, start_sector_app 
    call read_hard_disk

    mov dx, [2]
    mov ax, [0]
    mov bx, 512
    div bx
    cmp dx,0
    jnz c_
    dec ax 

  @1:
    cmp ax,0
    jz direct

    push ds
    mov cx,ax

  @2:


;读取磁盘
read_hard_disk:

    push ax 
    push bx
    push cx
    push dx

    ;主磁盘端口号
    mov dx,0x1f2

    ;1扇区
    mov al,1
    out dx,al

    inc dx   ;自增1
    mov ax,si
    out dx,al  ;LBA地址7~0

    inc dx
    mov al,ah
    out dx,al ;8~15

    inc dx 
    mov ax, di
    out dx, al ;16~23

    ;-------------------------
    ;ah --- 24-27
    ;且 24-27 需与0xe0异或
    ;-------------------------

    inc dx
    mov al,0xe0
    or  al,ah
    out dx,al

    inc dx
    mov al,0x20     ;读命令
    out dx,al

  .waits:
    in al,dx
    and al,0x88
    cmp al,0x08
    jnz .waits                      ;不忙，且硬盘已准备好数据传输 

    mov cx,256                      ;总共要读取的字数,cx决定loop循环次数
    mov dx,0x1f0
  .readw:
    in ax,dx
    mov [bx],ax
    add bx,2
    loop .readw

    pop dx
    pop cx
    pop bx
    pop ax

    ret





phy_base dd 0x10000

times 510-($-$$) db 0
        db 0x55, 0xaa
