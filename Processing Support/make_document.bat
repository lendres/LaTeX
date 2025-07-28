@echo off
title Make LaTeX Document
echo.
echo.
echo MAKE DOCUMENT

rem Calling signature: makedocument arg1 arg2
rem arg1 - The root file name passed to this file (no directory or file extension).
rem arg2 - The type of glossary package processing.
rem		0 - No processing.
rem		1 - Processing for the "glossary" package.
rem		2 - Processing for the "glossaries" package.


rem Do not put spaces around the equal sign.
rem Tilde removes the quotes require to pass an argument with spaces.
set FILEROOTNAME=%~1

echo Root file name: %FILEROOTNAME%
echo Main Tex file name: "%FILEROOTNAME%.tex"
echo Glossary package processing option: %~2

echo.
echo.
echo Do LaTeX...
rem This pass will do the initial processing of the document.  It will output data needed for the index, bibliography, and glossaries.
pdflatex --synctex=-1 "%FILEROOTNAME%"

echo.
echo.
echo Do BibTeX...
bibtex "%FILEROOTNAME%"

echo.
echo.
rem echo Make Index...
rem makeindex "%FILEROOTNAME%"

echo.
echo.
echo Make Glossary...
rem For older "glossary" package.
if %~2==1 (
	makeindex -t "%FILEROOTNAME%.glg" -o "%FILEROOTNAME%.gls" -s "%FILEROOTNAME%.ist" "%FILEROOTNAME%.glo"
)

rem For newer "glossaries" package.
rem This version doesn't work unless you have Perl installed on your computer.  https://strawberryperl.com/
if %~2==2 (
	makeglossaries "%FILEROOTNAME%"
)

echo.
echo.
echo Do LaTeX (again)...
rem This pass will collect table of contents entries from the index, bibliography, and glossaries.
latex "%FILEROOTNAME%.tex" -output-format dvi --src

echo.
echo.
echo Do pdf...
rem A final pass to incorporate the table of contents entries into the main body.  This pass for PDF output.
pdflatex --synctex=-1 "%FILEROOTNAME%"

echo.
echo.
echo Do LaTeX (again, again)...
rem A final pass to incorporate the table of contents entries into the main body.  This pass for DVI output.
rem latex "%FILEROOTNAME%.tex" -output-format dvi --src

rem pause