#!/bin/sh




## Install and run cgroupfs-mount:
#apt-get install cgroupfs-mount > /dev/null 2>&1
cgroupfs-mount > /dev/null 2>&1




## start dockerd again:
#systemctl start docker > /dev/null 2>&1




# Add an interface named "docker0" and set IP address:
ip link add name docker0 type bridge > /dev/null 2>&1
ip addr add dev docker0 172.17.0.1/16 > /dev/null 2>&1




## Install "net-tools" and set interface "docker0" up:
#apt-get install -y net-tools > /dev/null 2>&1
ifconfig docker0 up > /dev/null 2>&1




# Start dockerd again:
systemctl start docker > /dev/null 2>&1








exit 0








