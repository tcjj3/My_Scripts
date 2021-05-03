#!/bin/sh




# Install wine32 & ".Net 4.0" & ".Net 4.8":
apt-get install -y wine wine64
dpkg --add-architecture i386 && apt-get update && apt-get install -y wine32
apt-get install -y winetricks
winetricks dotnet40
winetricks dotnet48




# Download goesrecv-monitor:
apt-get install -y unzip
mkdir goestools-monitor
curl -L https://github.com/sam210723/goesrecv-monitor/releases/latest/download/goesrecv-monitor.zip -o goestools-monitor/goesrecv-monitor.zip
unzip -o goestools-monitor/goesrecv-monitor.zip -d goestools-monitor




# Run goesrecv-monitor:
wine goestools-monitor/goesrecv-monitor.exe










