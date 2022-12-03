@ECHO OFF

set cssPath=style.css
set jsPath=script.js

set indexPath=index.html

FOR /F "tokens=* delims=" %%x in (start-gen.html) DO echo %%x > %indexPath%

:: write css to file
FOR /F "tokens=* delims=" %%x in (%cssPath%) DO echo %%x >> %indexPath%

FOR /F "tokens=* delims=" %%x in (middle-gen.html) DO echo %%x >> %indexPath%

:: write js to file
FOR /F "tokens=* delims=" %%x in (%jsPath%) DO echo %%x >> %indexPath%

FOR /F "tokens=* delims=" %%x in (end-gen.html) DO echo %%x >> %indexPath%
