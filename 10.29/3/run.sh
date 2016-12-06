nasm *.asm
dd if=mbr of=boot.img bs=512
bochs -f ./bochsrc.bxrc


