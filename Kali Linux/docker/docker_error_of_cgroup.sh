#!/bin/sh




# Install and run cgroupfs-mount:
apt-get install -y cgroupfs-mount
cgroupfs-mount




# start dockerd again:
systemctl start docker








