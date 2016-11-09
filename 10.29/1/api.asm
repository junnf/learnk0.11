SECTION header vstart=0
    program_length dd program_end
    code_entry dw start
               dd section.code.start

SECTION code align=16 vstart=0
start:
    mov ax,0xb800
    mov es,ax
    mov byte [es:0x00],'L'
    mov byte [es:0x01],0x07
    mov byte [es:0x02],'J'
    mov byte [es:0x03],0x07
    mov byte [es:0x04],'N'
    mov byte [es:0x05],0x07
    mov byte [es:0x06],'O'
    mov byte [es:0x07],0x07
    mov byte [es:0x08],'P'
    mov byte [es:0x09],0x07

SECTION code_func align=16 vstart=0
put_char:                                ;显示一个字符
;输入：cl=字符ascii
push ax
push bx
push cx
push dx
push ds
push es

;以下取当前光标位置
mov dx,0x3d4
mov al,0x0e
out dx,al
mov dx,0x3d5
in al,dx                        ;高8位 
mov ah,al

mov dx,0x3d4
mov al,0x0f
out dx,al
mov dx,0x3d5
in al,dx                        ;低8位 
mov bx,ax                       ;BX=代表光标位置的16位数

cmp cl,0x0d                     ;回车符？
jnz .put_0a                     ;不是。看看是不是换行等字符 
mov ax,bx                       ;此句略显多余，但去掉后还得改书，麻烦 
mov bl,80                       
div bl
mul bl
mov bx,ax
jmp .set_cursor

.put_0a:
cmp cl,0x0a                     ;换行符？
jnz .put_other                  ;不是，那就正常显示字符 
add bx,80
jmp .roll_screen

.put_other:                             ;正常显示字符
mov ax,0xb800
mov es,ax
shl bx,1
mov [es:bx],cl

;以下将光标位置推进一个字符
shr bx,1
add bx,1

.roll_screen:
cmp bx,2000                     ;光标超出屏幕？滚屏
jl .set_cursor

mov ax,0xb800
mov ds,ax
mov es,ax
cld
mov si,0xa0
mov di,0x00
mov cx,1920
rep movsw
mov bx,3840                     ;清除屏幕最底一行
mov cx,80
.cls:
mov word[es:bx],0x0720
add bx,2
loop .cls

mov bx,1920

.set_cursor:
mov dx,0x3d4
mov al,0x0e
out dx,al
mov dx,0x3d5
mov al,bh
out dx,al
mov dx,0x3d4
mov al,0x0f
out dx,al
mov dx,0x3d5
mov al,bl
out dx,al

pop es
pop ds
pop dx
pop cx
pop bx
pop ax

ret


SECTION data align=16 vstart=0
    msg db "hello every one !"
    msg db "hello every two !"

SECTION stack align=16 vstart=0

SECTION trail align=16
program_end:
