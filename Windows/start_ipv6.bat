@echo off





REM netsh int ter set state client
REM netsh int teredo set state client teredo.remlab.net



netsh int ter set state natawareclient
netsh int teredo set state natawareclient teredo.remlab.net






REM netsh int ipv6 show teredo state








