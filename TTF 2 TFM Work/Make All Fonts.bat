REM MAKE ALL FONTS
    set file=t1"%abbr%".fd


REM MAKE VPL FILES
    ttf2tfm "%name%".ttf -q -T T1-WGL4.enc -v ec"%name%".vpl rec"%name%".tfm >> ttfonts.map
    ttf2tfm "%name%"i.ttf -q -T T1-WGL4.enc -v ec"%name%"i.vpl rec"%name%"i.tfm >> ttfonts.map
    ttf2tfm "%name%"bd.ttf -q -T T1-WGL4.enc -v ec"%name%"bd.vpl rec"%name%"bd.tfm >> ttfonts.map
    ttf2tfm "%name%"bi.ttf -q -T T1-WGL4.enc -v ec"%name%"bi.vpl rec"%name%"bi.tfm >> ttfonts.map

    ttf2tfm "%name%".ttf -q -T T1-WGL4.enc -s .167 -v ec"%name%"o.vpl rec"%name%"o.tfm >> ttfonts.map
    ttf2tfm "%name%"bd.ttf -q -T T1-WGL4.enc -s .167 -v ec"%name%"bdo.vpl rec"%name%"bdo.tfm >> ttfonts.map


REM MAKE TFM FILES
    vptovf ec"%name%".vpl ec"%name%".vf ec"%name%".tfm
    vptovf ec"%name%"i.vpl ec"%name%"i.vf ec"%name%"i.tfm
    vptovf ec"%name%"bd.vpl ec"%name%"bd.vf ec"%name%"bd.tfm
    vptovf ec"%name%"bi.vpl ec"%name%"bi.vf ec"%name%"bi.tfm

    vptovf ec"%name%"o.vpl ec"%name%"o.vf ec"%name%"o.tfm
    vptovf ec"%name%"bdo.vpl ec"%name%"bdo.vf ec"%name%"bdo.tfm


REM MAKE AFM FILES (ADOBE FONT METRICS)
    ttf2afm -e T1-WGL4.enc -o rec"%name%".afm "%name%".ttf
    ttf2afm -e T1-WGL4.enc -o rec"%name%"i.afm "%name%"i.ttf
    ttf2afm -e T1-WGL4.enc -o rec"%name%"bd.afm "%name%"bd.ttf
    ttf2afm -e T1-WGL4.enc -o rec"%name%"bi.afm "%name%"bi.ttf


REM WINFONTS.MAP
    afm2tfm rec"%name%".afm -T T1-WGL4.enc rec"%name%".tfm >>winfonts.map
    afm2tfm rec"%name%"i.afm -T T1-WGL4.enc rec"%name%"i.tfm >>winfonts.map
    afm2tfm rec"%name%"bd.afm -T T1-WGL4.enc rec"%name%"bd.tfm >>winfonts.map
    afm2tfm rec"%name%"bi.afm -T T1-WGL4.enc rec"%name%"bi.tfm >>winfonts.map
    afm2tfm rec"%name%".afm -T T1-WGL4.enc -s .167 rec"%name%"o.tfm >>winfonts.map
    afm2tfm rec"%name%"bd.afm -T T1-WGL4.enc -s .167 rec"%name%"bdo.tfm >>winfonts.map


REM CREATE FONT DEFINITION FILE
    echo \ProvidesFile{t1%abbr%.fd}[%desc% TTF] >> "%file%"
    echo.
    echo \DeclareFontFamily{T1}{%abbr%}{} >> "%file%"
    echo.
    echo \DeclareFontShape{T1}{%abbr%}{b}{n}{^<-^>ec %name%bd}{} >> "%file%"
    echo \DeclareFontShape{T1}{%abbr%}{b}{sl}{^<-^> ec%name%bdo}{} >> "%file%"
    echo \DeclareFontShape{T1}{%abbr%}{b}{it}{^<-^> ec%name%bi}{} >> "%file%"
    echo.
    echo \DeclareFontShape{T1}{%abbr%}{m}{n}{^<-^> ec%name%}{} >> "%file%"
    echo \DeclareFontShape{T1}{%abbr%}{m}{sl}{^<-^> ec%name%o}{} >> "%file%"
    echo \DeclareFontShape{T1}{%abbr%}{m}{it}{^<-^> ec%name%i}{} >> "%file%"
    echo.
    echo \DeclareFontShape{T1}{%abbr%}{bx}{n}{^<-^>ssub * %abbr%/b/n}{} >> "%file%"
    echo \DeclareFontShape{T1}{%abbr%}{bx}{sl}{^<-^>ssub * %abbr%/b/sl}{} >> "%file%"
    echo \DeclareFontShape{T1}{%abbr%}{bx}{it}{^<-^>ssub * %abbr%/b/it}{} >> "%file%"
    echo.
    echo \endinput >> t1"%abbr%".fd


REM ADD ENTRIES TO THE FONT.STY FILE
    REM NORMAL
    echo \newcommand*{\%desc%}{\usefont{T1}{%abbr%}{m}{n}} >> "%styfile%"

    REM SLANTED
    echo \newcommand*{\%desc%Slant}{\usefont{T1}{%abbr%}{m}{sl}} >> "%styfile%"

    REM ITALIC
    echo \newcommand*{\%desc%Italic}{\usefont{T1}{%abbr%}{m}{it}} >> "%styfile%"

    REM BOLD
    echo \newcommand*{\%desc%Bold}{\usefont{T1}{%abbr%}{b}{n}} >> "%styfile%"

    REM BOLD SLANTED
    echo \newcommand*{\%desc%BoldSlant}{\usefont{T1}{%abbr%}{b}{sl}} >> "%styfile%"

    REM BOLD ITALIC
    echo \newcommand*{\%desc%BoldItalic}{\usefont{T1}{%abbr%}{b}{it}} >> "%styfile%"

    REM BOLD EXTENDED
    echo \newcommand*{\%desc%BoldEXt}{\usefont{T1}{%abbr%}{bx}{n}} >> "%styfile%"

    REM BOLD EXTENDED SLANTED
    echo \newcommand*{\%desc%BoldExtSlant}{\usefont{T1}{%abbr%}{bx}{sl}} >> "%styfile%"

    REM BOLD EXTENDED ITALIC
    echo \newcommand*{\%desc%BoldExtItalic}{\usefont{T1}{%abbr%}{bx}{it}} >> "%styfile%"

    echo. >> %styfile%


REM MOVE FILES
    move "%file%" ..\TeX\LaTeX\winfonts

    mkdir ..\fonts\tfm\ms\"%name%"
    move *"%name%"*.tfm ..\fonts\tfm\ms\"%name%"

    mkdir ..\fonts\vf\ms\"%name%"
    move *"%name%"*.vf ..\fonts\vf\ms\"%name%"

    mkdir ..\fonts\afm\ms\"%name%"
    move *"%name%"*.afm ..\fonts\afm\ms\"%name%"