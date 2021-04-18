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




# Set up docker_pre_start:
ln -s /etc/init.d/docker_pre_start.sh /etc/rc2.d/S01docker_pre_start > /dev/null 2>&1
ln -s /etc/init.d/docker_pre_start.sh /etc/rc3.d/S01docker_pre_start > /dev/null 2>&1
ln -s /etc/init.d/docker_pre_start.sh /etc/rc4.d/S01docker_pre_start > /dev/null 2>&1
ln -s /etc/init.d/docker_pre_start.sh /etc/rc5.d/S01docker_pre_start > /dev/null 2>&1








