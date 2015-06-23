@echo off

title Convert TTF to TFM

del ttfonts.map
del winfonts.map
del *.fd

REM SETUP FONTS.STY
    set styfile=..\TeX\LaTeX\lefonts.sty
    del "%styfile%"
    echo \NeedsTeXFormat{LaTeX2e} \ProvidesPackage{lefonts}[2005/10/30 Provides easy access to true type >> "%styfile%"
    echo fonts.  They have to be present and installed to use.  See "Read Me.txt" in "LaTeX" directory in >> "%styfile%"
    echo "Custom Program Files" folder for information on installation.] >> "%styfile%"
    echo. >> "%styfile%"




REM =======================================
REM MAKE FONTS
REM ADD NEW FONTS HERE!!
REM =======================================
    set name=times
    set abbr=tnr
    set desc=TimesNR
    call "Make All Fonts.bat"

    set name=arial
    set abbr=arl
    set desc=Arial
    call "Make All Fonts.bat"

    set name=cour
    set abbr=cor
    set desc=CourierNew
    call "Make All Fonts.bat"

    set name=handgotn
    set abbr=hndgot
    set desc=HandelGothic
    call "Make Base Fonts.bat"

    set name=Bau_hb
    set abbr=bauhb
    set desc=BauhHeavy
    call "Make Base Fonts.bat"
REM =======================================
REM End MAKE FONTS
REM =======================================




REM CLEANUP AND PRINT INFO.
del *.vpl


REM MOVE THE WINFONTS FILE TO THE PROPER LOCATION.
move /Y winfonts.map ..\pdftex\base\winfonts.map



echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo STEP 1) IS FOR MIKTEX 2.4 AND BELOW ONLY (2.5 AND ABOVE DO NOT SEEM TO REQUIRE THIS STEP):
echo.
echo 1) Edit the file "...\miktex\config\miktex.ini" 
echo    (e.g. "c:\Program Files\MiKTeX\miktex\config\miktex.ini":
echo    find the line which starts with "TTFPath=" and add windows fonts directory:
echo.
echo    "TTFPath=.;%R\fonts\truetype//;c:\windows\fonts"
echo.
echo STEP 2) IS FOR MIKTEX 2.5 (2.9 AND ABOVE DO NOT SEEM TO REQUIRE THIS STEP):
echo.
echo 2) Copy the contents of "ttfonts.map" (from the "TTF 2 TFM Work" directory) to
echo    "C:\Program Files\MiKTeX 2.6\ttf2tfm\base\ttfonts.map"
echo.
echo 3) Refresh the MIKTEX file name database.
echo.
echo.
pause
@echo on