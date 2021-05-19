#!/bin/sh




# Install and cgroupfs-mount:
apt-get install -y cgroupfs-mount > /dev/null 2>&1




# Install "net-tools" and set interface "docker0" up:
apt-get install -y net-tools > /dev/null 2>&1




# Set docker auto start after others:
mv /etc/rc2.d/S01docker /etc/rc2.d/S99docker > /dev/null 2>&1
mv /etc/rc3.d/S01docker /etc/rc3.d/S99docker > /dev/null 2>&1
mv /etc/rc4.d/S01docker /etc/rc4.d/S99docker > /dev/null 2>&1
mv /etc/rc5.d/S01docker /etc/rc5.d/S99docker > /dev/null 2>&1




# Copy and set up docker_pre_start:
BASEDIR="$(dirname $0)"

while [ ! -f "$BASEDIR/docker_pre_start.sh" ]; do
curl -L https://github.com/tcjj3/My_Scripts/raw/main/Kali%20Linux/docker/docker_pre_start.sh -o "$BASEDIR/docker_pre_start.sh"
done
cp "$BASEDIR/docker_pre_start.sh" /etc/init.d/docker_pre_start.sh > /dev/null 2>&1
chmod +x /etc/init.d/docker_pre_start.sh > /dev/null 2>&1


ln -s /etc/init.d/docker_pre_start.sh /etc/rc2.d/S01docker_pre_start > /dev/null 2>&1
ln -s /etc/init.d/docker_pre_start.sh /etc/rc3.d/S01docker_pre_start > /dev/null 2>&1
ln -s /etc/init.d/docker_pre_start.sh /etc/rc4.d/S01docker_pre_start > /dev/null 2>&1
ln -s /etc/init.d/docker_pre_start.sh /etc/rc5.d/S01docker_pre_start > /dev/null 2>&1








