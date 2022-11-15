#!/bin/sh






# Auto sync Date & Time:
service ntp start
systemctl enable ntp






# Update Date & Time to avoid "Release file for xxxxxx is not vaild yet (invaild for another xxxd xxh xxmin xxs)" error:
ntpdate time.windows.com






#curl -fsSL "http://kali.download/kali/dists/kali-rolling/Release.gpg" | apt-key add -qq - >/dev/null 2>&1

#apt-get update --allow-insecure-repositories

#apt-get update --allow-unauthenticated




# Add new key:
wget -q -O - https://archive.kali.org/archive-key.asc | apt-key add




# Use the original source:
sed -i "s/http.kali.org/kali.download/g" /etc/apt/sources.list




# Apply it:
apt-get update




# Fix-broken:
#apt-get dist-upgrade












