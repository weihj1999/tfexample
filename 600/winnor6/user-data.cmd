rem cmd
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Tcpip\Parameters      /v Domain /t REG_SZ /d otc.nordeatst.com /f
ipconfig /renew
