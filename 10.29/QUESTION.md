dd if=c08 of=hd.img seek=100 bs=512 conv=notrunc
需要加入conv=notrunc

floppy->disk(100 spec) seek 100spec

0,1,2,3...99  100
------------
    num=100

#####1.mbr 最后字节有规定限制

#####2.endian限制,hexdump阅读困难,可hexdump -C textfile

#####3.执行其他asm文件,及段重定位
