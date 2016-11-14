#!/bin/bash

nasm api.asm
nasm mbr.asm
dd if=api of=hd.img seek=100 bs=512 conv=notrunc
dd if=mbr of=boot.img bs=512 

bochs -f bochsrc.bxrc
