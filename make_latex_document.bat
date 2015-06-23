@echo off
title Make LaTeX Document

rem Print the help if requested, then exit the batch file.
if %1==help (goto :printusage)

set BASENAME=%~1
set PAGENUMBER=%~2

rem Close the existing PDF if it is open.
close "%BASENAME%.pdf - Adobe Reader"

echo.
echo.
echo.

echo Do pdfLaTeX...
pdflatex "%BASENAME%.tex"

echo.
echo.
echo.
echo.
echo.
echo.
echo.

echo Do BibTeX...
bibtex "%BASENAME%"

echo.
echo Make Index...
makeindex "%BASENAME%"

echo.
echo Make Glossary...
makeindex -t "%BASENAME%.glg" -o "%BASENAME%.gls" -s "%BASENAME%.ist" "%BASENAME%.glo"

echo.
echo.
echo.
echo.
echo.
echo.
echo.

echo Do pdf (again)...
rem pdflatex "%BASENAME%.tex"

echo Do pdf (again, again)...
rem pdflatex "%BASENAME%.tex"


echo Launch PDF.
set PDFFILE="%CD%\%BASENAME%.pdf"

rem pagemode=bookmarks
rem pagemode=thumbs
set PAGEMODE=bookmarks

rem Set Acrobat open options.
rem "pagemode" has to be the first open action.
set ACROBATOPTIONS="pagemode=%PAGEMODE%&page=%PAGENUMBER%&zoom=80&scrollbar=1=OpenActions"

if not %PAGENUMBER%==0 (start "" /max "C:\Program Files\Adobe\Reader 9.0\Reader\AcroRd32.exe" /A %ACROBATOPTIONS% %PDFFILE%)



echo Do LaTeX...
latex "%BASENAME%.tex" -output-format dvi --src



REM CLEAN UP!
echo echo. >> cleanup.bat
echo echo Cleaning up... >> cleanup.bat
echo del _temp.* >> cleanup.bat
echo del *.aux >> cleanup.bat
echo del *.aux >> cleanup.bat
echo del *.bbl >> cleanup.bat
echo del *.blg >> cleanup.bat
echo del *.idx >> cleanup.bat
echo del *.ilg >> cleanup.bat
echo del *.ind >> cleanup.bat
echo del *.log >> cleanup.bat
echo del *.toc >> cleanup.bat
echo del *.lof >> cleanup.bat
echo del *.out >> cleanup.bat
echo del *.lot >> cleanup.bat
echo del *.bak >> cleanup.bat
echo del *.glo >> cleanup.bat
echo del *.sav >> cleanup.bat
rem call cleanup.bat

del cleanup.bat


echo.
echo Done!


rem pause
goto :eof


:printusage
echo.
echo Makes a LaTeX document including the bibliography, index, and glossary if they exist.
echo.
echo make_latex_document document pagenumber
echo.
echo   document        Root document of your LaTeX project WITH OUT the file extension.
echo                     Quotes are required around file names with spaces in them.
echo   pagenumber      Page number of the PDF file to open to after completion or zero
echo                     if the user does not want to open the PDF.
echo.
echo make_latex_document help
echo   Prints this help section.
echo.
goto :eof