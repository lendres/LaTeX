REM MAKE ALL FONTS
    set file=t1"%abbr%".fd


REM MAKE VPL FILES
    ttf2tfm "%name%".ttf -q -T T1-WGL4.enc -v ec"%name%".vpl rec"%name%".tfm >> ttfonts.map
    ttf2tfm "%name%".ttf -q -T T1-WGL4.enc -s .167 -v ec"%name%"o.vpl rec"%name%"o.tfm >> ttfonts.map


REM MAKE TFM FILES
    vptovf ec"%name%".vpl ec"%name%".vf ec"%name%".tfm
    vptovf ec"%name%"o.vpl ec"%name%"o.vf ec"%name%"o.tfm


REM MAKE AFM FILES (ADOBE FONT METRICS)
    ttf2afm -e T1-WGL4.enc -o rec"%name%".afm "%name%".ttf


REM WINFONTS.MAP
    afm2tfm rec"%name%".afm -T T1-WGL4.enc rec"%name%".tfm >>winfonts.map
    afm2tfm rec"%name%".afm -T T1-WGL4.enc -s .167 rec"%name%"o.tfm >>winfonts.map


REM CREATE FONT DEFINITION FILE
    echo \ProvidesFile{t1%abbr%.fd}[%desc% TTF] >> "%file%"
    echo.
    echo \DeclareFontFamily{T1}{%abbr%}{} >> "%file%"
    echo.
    echo \DeclareFontShape{T1}{%abbr%}{m}{n}{^<-^> ec%name%}{} >> "%file%"
    echo \DeclareFontShape{T1}{%abbr%}{m}{sl}{^<-^> ec%name%o}{} >> "%file%"
    echo.
    echo \endinput >> t1%abbr%.fd


REM ADD ENTRIES TO THE FONT.STY FILE
    REM NORMAL
    echo \newcommand*{\%desc%}{\usefont{T1}{%abbr%}{m}{n}} >> "%styfile%"

    REM SLANTED
    echo \newcommand*{\%desc%Slant}{\usefont{T1}{%abbr%}{m}{sl}} >> "%styfile%"

    echo. >> %styfile%


REM MOVE FILES
    move "%file%" ..\TeX\LaTeX\winfonts

    mkdir ..\fonts\tfm\ms\"%name%"
    move *"%name%"*.tfm ..\fonts\tfm\ms\"%name%"

    mkdir ..\fonts\vf\ms\"%name%"
    move *"%name%"*.vf ..\fonts\vf\ms\"%name%"

    mkdir ..\fonts\afm\ms\"%name%"
    move *"%name%"*.afm ..\fonts\afm\ms\"%name%"