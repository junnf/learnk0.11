mov ax, 2
cmp ax, 0
jz @1


@2:
; Test
    push ax
    mov ax, 0xb800
    mov es, ax
    mov byte [es:0x00], 'X'
    mov byte [es:0x01], 0x07
    pop ax
    jmp near infi
    

@1:
; Test
    push ax
    mov ax, 0xb800
    mov es, ax
    mov byte [es:0x00], 'L'
    mov byte [es:0x01], 0x07
    pop ax
    jmp near infi


 infi: jmp near infi                 ;无限循环
    times 510-($-$$) db 0
    db 0x55,0xaa




; mov ax,0xb800
; mov es,ax
; mov ax,0x5000
; mov ds,ax
; mov byte [ds:0x00], 255
; mov ax, [ds:0x00]
; mov dx, 0x6000
; mov ds, dx
; mov bl, 10
; div bl
; ;商
; mov byte [ds:0x00],al
; ;余数
; mov byte [ds:0x01],ah

; ;mov byte ax, [0x4000:0x00]
; mov byte al,[ds:0x00]
; mov byte ah,0x00
; div bl
; ;商
; mov byte [ds:0x02],al
; ;余数
; mov byte [ds:0x03],ah
; mov byte al,[ds:0x02]
; add al,0x30
; mov byte [es:0x08], al

; mov byte [es:0x09], 0x07

; mov byte al,[ds:0x03]
; add al,0x30
; mov byte [es:0x0a],al
; mov byte [es:0x0b], 0x07
; mov byte al,[ds:0x01]
; add al, 0x30
; mov byte [es:0x0c], al
; mov byte [es:0x0d], 0x07

; mov byte [es:0x00], 'L'
; mov byte [es:0x01], 0x07
; mov byte [es:0x02], 'I'
; mov byte [es:0x03], 0x07
; mov byte [es:0x04], 'K'
; mov byte [es:0x05], 0x07
; mov byte [es:0x06], 'E'
; mov byte [es:0x07], 0x07
; infi: jmp near infi                 ;无限循环
; times 510-($-$$) db 0
          ; db 0x55,0xaa
