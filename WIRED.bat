REM SET-UP
@echo off
setlocal enabledelayedexpansion
color 09
mode CON: COLS=125 LINES=40
title W.I.R.E.D 

REM LOGO
echo VERSION: BETA
echo By Fortniteking231 GITHUB
echo "$$\      $$\     $$$$$$\     $$$$$$$\      $$$$$$$$\     $$$$$$$\  "
echo "$$ | $\  $$ |    \_$$  _|    $$  __$$\     $$  _____|    $$  __$$\ "
echo "$$ |$$$\ $$ |      $$ |      $$ |  $$ |    $$ |          $$ |  $$ |"
echo "$$ $$ $$\$$ |      $$ |      $$$$$$$  |    $$$$$\        $$ |  $$ |"
echo "$$$$  _$$$$ |      $$ |      $$  __$$<     $$  __|       $$ |  $$ |"
echo "$$$  / \$$$ |      $$ |      $$ |  $$ |    $$ |          $$ |  $$ |"
echo "$$  /   \$$ |$$\ $$$$$$\ $$\ $$ |  $$ |$$\ $$$$$$$$\ $$\ $$$$$$$  |"
echo "\__/     \__|\__|\______|\__|\__|  \__|\__|\________|\__|\_______/"

echo ~~~~
echo Windows
echo Intrusion
echo Reconnaissance
echo Exploitation
echo Disruption
echo ~~~~
echo  /---------------------\
echo [Use "Help" For Help :) ]
echo  \---------------------/

setlocal

REM Command Line Time
:tpuser
set USER_INPUT=
set /p USER_INPUT="%windir%> " 

REM W.I.R.E.D Preset Var's
set websiteoffline=example.com
set floodinghere=%temp%
set poweroff=3
set taskname=

REM COMMANDS
if /I "%USER_INPUT%" equ "help" (
    echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	echo NetScan -- Listens For Outgoing IP Address Connection 
	echo Webgrabber -- If a Website Is Block You Can Use This To View A Offline Version
	echo Help -- Show This List Of Commands, And What They Do
	echo NetIP -- Shows All The IP Address On Your Network
	echo MyIP -- Shows Infomation About Your Internet Protocol Address
	echo RAMbomb -- This Opens Many Notepad Windows, Overwhelming Your System Resources
	echo ERROR -- IF A COMMAND IS NOT WORKING USE THIS
	echo Flood -- Flood's A Directory With Randomly Generated Folder's
	echo TaskKill -- End Any Task Like Task Manager
	echo Shutdown -- Shutdown/Reset This Device
    echo Cls -- Clear W.I.R.E.D Command Prompt
    echo Exit -- Close W.I.R.E.D Command Prompt
    echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
) else if /I "%USER_INPUT%" equ "RAMbomb" (
	echo Are You Sure?
	echo Press Anything To Confirm
	pause > nul
	echo ARE YOU REALLY SURE?
	pause > nul
	echo LAST WARNING, ARE YOU SURE
	pause > nul	
	echo USE THIS IN RUN APP TO STOP IT: "taskkill /f /im notepad.exe" [Auto Copied]
	echo taskkill /f /im notepad.exe | clip > nul
	pause > nul
    timeout /nobreak 2 > nul
	:RAMbombing
	cls
	start /min notepad.exe
	goto RAMbombing
) else if /I "%USER_INPUT%" equ "Error" (
    echo Checking...
	where getmac > nul | echo Getmac Found || echo Getmac Not Found
	where curl > nul | echo Curl Found || echo Curl Not Found
) else if /I "%USER_INPUT%" equ "MyIP" (
	echo .
    echo ------------------------------------------------------------
	echo YOUR LOCAL IP:
	ipconfig | findstr IPv4
	echo ------------------------------------------------------------
	echo YOUR MAC ADDRESS: 
	getmac /nh /v
	echo ------------------------------------------------------------
	echo YOUR PUBLIC IP: 
	curl ipinfo.io
	echo .
	echo ------------------------------------------------------------
) else if /I "%USER_INPUT%" equ "Webgrabber" (
	set /p websiteoffline=URL OF WEBSITE: 
    curl -s !websiteoffline! > %temp%\offline_site.html
	start %temp%\offline_site.html
	timeout /nobreak 1 > nul
	del %temp%\offline_site.html
) else if /I "%USER_INPUT%" equ "Shutdown" (
    echo 1 - Restart - 1
    echo 2 - Shutdown - 2
    echo 3 - Cancel - 3
    set /p poweroff=Shutdown Option: 
    if "!poweroff!" equ "1" (
		echo Are You Sure You Want To Restart Your Device'?'
		echo Press Anything To Confirm
		pause > nul
		cls
		Shutdown /r /t 1
    ) else if "!poweroff!" equ "2" (
		echo Are You Sure You Want To Shutdown Your Device'?'
		echo Press Anything To Confirm
		pause > nul
		cls
		shutdown /s /t 1
    ) else if "!poweroff!" equ "3" (
        echo Shutdown Operation Canceled
		goto tpuser
    ) else (
        echo INVALID INPUT! TRY AGAIN
		goto tpuser
    )
) else if /I "%USER_INPUT%" equ "Flood" (
    set /p floodinghere=What Directory You Wish To Flood? : 
	cd "!floodinghere!"
	echo Flooding "!floodinghere!" With Randomly Generated Folder's
	:fileflood
	cls
	mkdir %random%\%random%\%random%\%random%
	goto fileflood
) else if /I "%USER_INPUT%" equ "NetScan" (
    netstat -a 1
) else if /I "%USER_INPUT%" equ "NetIP" (
    echo ~~~~~~~~~~~~~~~~~~~~~~~~~~
	echo IP ADDRESSES AND MAC ADDRESSES: 
	arp -a
	echo ~~~~~~~~~~~~~~~~~~~~~~~~~~
) else if /I "%USER_INPUT%" equ "Cls" (
    Cls
) else if /I "%USER_INPUT%" equ "Exit" (
    cls
    echo Exiting W.I.R.E.D Command Prompt
	timeout /nobreak 1 > nul
	exit /b
) else if "%USER_INPUT%%" equ "" ( 
	goto tpuser
) else (
	echo "%USER_INPUT%" Is Not Recognized As An Command
)

goto tpuser
endlocal
exit /b

