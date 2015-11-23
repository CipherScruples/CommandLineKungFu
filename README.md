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
$WebClient = New-Object System.Net.WebClient
$WebClient.DownloadFile("https://www.contoso.com/file","C:\path\file")
```
Or wget for newer PowerShell
```
Invoke-WebRequest -Uri "http://www.contoso.com" -OutFile "C:\path\file"
```
