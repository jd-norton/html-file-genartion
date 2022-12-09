@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

@REM TODO: Switch to using line number instead of checking if line contains substring
set "cssGenStart=link rel="
set "jsGenStart=script src="

set htmlInputPath=..\..\color-progressive\index.html
set cssPath=..\..\color-progressive\styles.css
set jsPath=..\..\color-progressive\script.js
set indexPath=..\index.html

set cssStart=cssStart.txt
set cssEnd=cssEnd.txt
set jsStart=jsStart.txt
set jsEnd=jsEnd.txt
set skipLine=false

IF EXIST %indexPath% (
    del %indexPath%
)

type NUL > %indexPath%

FOR /F "tokens=*" %%x in (%htmlInputPath%) DO (
    set "line=%%x"

    echo."!line!" | findstr /C:"%cssGenStart%">nul && (

        type %cssStart% >> %indexPath%
        type %cssPath% >> %indexPath%
        type %cssEnd% >> %indexPath%

        set skipLine=true
    )

    echo."!line!" | findstr /C:"%jsGenStart%">nul && (

        type %jsStart% >> %indexPath%
        type %jsPath% >> %indexPath%
        type %jsEnd% >> %indexPath%

        set skipLine=true
    )

    IF !skipLine!==false (
        echo !line! >> %indexPath%
    ) ELSE (
        set skipLine=false
    ) 

)
