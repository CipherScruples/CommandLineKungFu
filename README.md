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
