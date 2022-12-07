@ECHO OFF

:: TODO: Loop through starting html file. Loop on it and add lines to output file until find line with "<head>" or where want to insert css. Loop and insert start and end "<styles>" and css file. Then go back to inserting html file until find line last line before "</body>" and insert start and end "<script>" and js file. Then finish inserting html into output. Done

set "middleGenStart=    <body>"
set "middleGenEnd=        </div>"
set inRange=false

set middleGenPath=..\..\color-progressive\index.html
set cssPath=..\..\color-progressive\styles.css
set jsPath=..\..\color-progressive\script.js

set indexPath=..\index.html

del %indexPath%

FOR /F "tokens=* delims=" %%x in (start-gen.html) DO echo %%x >> %indexPath%

:: write css to file
FOR /F "tokens=* delims=" %%x in (%cssPath%) DO echo %%x >> %indexPath%

FOR /F "tokens=* delims=" %%x in (pre-middle-gen.html) DO echo %%x >> %indexPath%


FOR /F "tokens=* delims=" %%x in (%middleGenPath%) DO (

    IF %%x == middleGenStart set inRange=true

    IF %%x == middleGenEnd set inRange=false
    
    IF %inRange% == "true" echo %%x >> %indexPath%
    ::ECHO is OFF??? not working
)

:: write js to file
FOR /F "tokens=* delims=" %%x in (%jsPath%) DO echo %%x >> %indexPath%

FOR /F "tokens=* delims=" %%x in (end-gen.html) DO echo %%x >> %indexPath%
