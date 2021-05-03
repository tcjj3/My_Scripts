#!/bin/sh




apt install -y open-vm-tools-desktop open-vm-tools




rm /etc/init.d/vmhgfs-fuse-mount > /dev/null 2>&1
touch /etc/init.d/vmhgfs-fuse-mount
echo "#!/bin/sh" >> /etc/init.d/vmhgfs-fuse-mount
echo "" >> /etc/init.d/vmhgfs-fuse-mount
echo "" >> /etc/init.d/vmhgfs-fuse-mount
echo "mkdir -p /mnt/hgfs > /dev/null 2>&1" >> /etc/init.d/vmhgfs-fuse-mount
echo "vmhgfs-fuse .host:/ /mnt/hgfs > /dev/null 2>&1" >> /etc/init.d/vmhgfs-fuse-mount
echo "" >> /etc/init.d/vmhgfs-fuse-mount
echo "" >> /etc/init.d/vmhgfs-fuse-mount
echo "exit 0" >> /etc/init.d/vmhgfs-fuse-mount
echo "" >> /etc/init.d/vmhgfs-fuse-mount
echo "" >> /etc/init.d/vmhgfs-fuse-mount
echo "" >> /etc/init.d/vmhgfs-fuse-mount
chmod +x /etc/init.d/vmhgfs-fuse-mount




mv /etc/rc2.d/S01docker /etc/rc2.d/S99docker > /dev/null 2>&1
mv /etc/rc3.d/S01docker /etc/rc3.d/S99docker > /dev/null 2>&1
mv /etc/rc4.d/S01docker /etc/rc4.d/S99docker > /dev/null 2>&1
mv /etc/rc5.d/S01docker /etc/rc5.d/S99docker > /dev/null 2>&1




ln -s /etc/init.d/vmhgfs-fuse-mount /etc/rc2.d/S01vmhgfs-fuse-mount > /dev/null 2>&1
ln -s /etc/init.d/vmhgfs-fuse-mount /etc/rc3.d/S01vmhgfs-fuse-mount > /dev/null 2>&1
ln -s /etc/init.d/vmhgfs-fuse-mount /etc/rc4.d/S01vmhgfs-fuse-mount > /dev/null 2>&1
ln -s /etc/init.d/vmhgfs-fuse-mount /etc/rc5.d/S01vmhgfs-fuse-mount > /dev/null 2>&1




exit 0














