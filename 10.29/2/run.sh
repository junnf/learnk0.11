#!/bin/bash
nasm c09_1.asm
dd if=c09_1 of=hd.img seek=100 bs=512 conv=notrunc
bochs -f bochsrc.bxrc


