@echo off
REM Start network drivers for TCP/IP support.
REM Love, TJBChris

REM Start the packet driver.
c:\net\clarkson\ni5210 0x78 3 0x360 0xd000

REM Get an IP address
SET MTCPCFG=c:\net\mtcp.cfg
c:\net\tcp\dhcp
set PATH=%PATH%;C:\NET\TCP
sntp -set 216.239.35.0
