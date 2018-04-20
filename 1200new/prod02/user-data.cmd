rem cmd
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Tcpip\Parameters      /v Domain /t REG_SZ /d otc.nor1tst.com /f
ipconfig /renew
