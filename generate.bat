@ECHO OFF

:: TODO: Variable to When to stop for start-gen, start and stop for middle-gen, and start for end-gen

set cssPath=..\..\color-progressive\styles.css
set jsPath=..\..\color-progressive\script.js

set indexPath=..\index.html

del %indexPath%

FOR /F "tokens=* delims=" %%x in (start-gen.html) DO echo %%x >> %indexPath%

:: write css to file
FOR /F "tokens=* delims=" %%x in (%cssPath%) DO echo %%x >> %indexPath%

FOR /F "tokens=* delims=" %%x in (middle-gen.html) DO echo %%x >> %indexPath%

:: write js to file
FOR /F "tokens=* delims=" %%x in (%jsPath%) DO echo %%x >> %indexPath%

FOR /F "tokens=* delims=" %%x in (end-gen.html) DO echo %%x >> %indexPath%
