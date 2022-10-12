# Installation

1) To enable MiKTeX to use the files in this directory, install the "C:\Custom Program Files\LaTeX" 
   directory as a TEXMF directory.  Choose "MiKTeX Options" from the program files directory and 
   then choose the tab "roots."
2) Run "Refresh FNDB."

For MiKTeX 2.9 and above, step 3 should no longer be needed.  Ensure the following files are inplace and run "Refresh FNDB":
.\ttf2tfm\ttf2pk.cfg
.\ttf2tfm\ttfonts.map
.\pdftex\base\pdftex.cfg
.\pdftex\base\winfonts.map


3) Follow the instructions that are printed at the end of the "Make TT Fonts.bat" file in the "TTF 2 TFM Work" directory.
   It shouldn't be necessary to run the file, but it will not hurt anything to run it.