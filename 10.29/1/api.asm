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

SECTION data align=16 vstart=0

SECTION stack align=16 vstart=0

SECTION trail align=16
program_end:
