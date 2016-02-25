cd atmark-dist-20160126
make romfs image
cd images
cp romfs.img.gz /var/lib/tftpboot
cp linux.bin.gz /var/lib/tftpboot
