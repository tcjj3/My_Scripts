#!/bin/sh




# Add an interface named "docker0" and set IP address:
ip link add name docker0 type bridge
ip addr add dev docker0 172.17.0.1/16




# Install "net-tools" and set interface "docker0" up:
apt-get install -y net-tools
ifconfig docker0 up




# Start dockerd again:
systemctl start docker








