#!/bin/sh




#curl -fsSL "http://kali.download/kali/dists/kali-rolling/Release.gpg" | apt-key add -qq - >/dev/null

#apt-get update --allow-insecure-repositories

#apt-get update --allow-unauthenticated




# Add new key:
wget -q -O - https://archive.kali.org/archive-key.asc | apt-key add




# Use the original source:
sed -i "s/http.kali.org/kali.download/g" /etc/apt/sources.list




# Apply it:
apt-get update












