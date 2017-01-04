nasm ./simple_kernel.asm
dd if=mbr of=boot.img bs=512
dd if=simple_kernel of=disk.img seek=1 bs=512 conv=notrunc

bochs -f ./bochsrc.bxrc

