@echo off

rem Removes temporary LaTeX files.  This has a few more file types than WinEdt.  In addition, it removes additional glossary output files.
rem Specifically, it removes files associated with custom glossaries produced by the "glossaries" package.  To do this, each custom glossary
rem must follow the naming convention of ending its 3 output files in ".??g", ".??s", and ".??o", where the "??" are replaced by two letters
rem unique to that custom glossary.

echo.
echo Removing temporary files...

del _temp.*
del *.aux
del *.bbl
del *.idx
del *.ind
del *.toc
del *.lof
del *.out
del *.lot
del *.bak
del *.sav
del *.stn
del *.ist
del *.glsdefs

del *.synctex
del *.run.xml
del *.bcf

rem Additional acronym files.  The ".alg" file is deleted by the command to capture all glossary output.
del *.acn
del *.acr


rem Delete glossary output files.  These types of files are use by glossary, bibliography, and other packages.
rem Example files this deletes:
rem del *.ilg
rem del *.log
rem del *.blg
rem del *.stg
rem del *.glg
rem del *.alg
rem et cetera

del *.??g


rem Delete glossary output files.
rem del *.gls
rem del *.sts
rem et cetera

rem Delete files with 3 letter extensions ending is "s" except ones ending in "cls".
for %%a in (.\*.??s) do (
    if /i not "%%~xa"==".cls" del "%%a"
)
rem del *.??s

rem Delete glossary output files.
rem del *.glo
rem del *.sto
rem et cetera

del *.??o