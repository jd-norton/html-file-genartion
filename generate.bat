@ECHO OFF

FOR /F "tokens=* delims=" %%x in (start-gen.html) DO echo %%x > test.html

:: write css to file
FOR /F "tokens=* delims=" %%x in (style.css) DO echo %%x >> test.html

FOR /F "tokens=* delims=" %%x in (middle-gen.html) DO echo %%x >> test.html

:: write js to file
FOR /F "tokens=* delims=" %%x in (script.js) DO echo %%x >> test.html

FOR /F "tokens=* delims=" %%x in (end-gen.html) DO echo %%x >> test.html
