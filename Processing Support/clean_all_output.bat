@echo off

echo.
echo Removing output files...

del *.pdf
del *.dvi

del .\Figures\*.eps
del .\Figures\*.jpg

call clean_temp_files.bat