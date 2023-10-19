% Modified book class.
%
% Copyright 2023:
% Lance A. Endres
%
% Created:
% July 30, 2023
%
% Author:
% Lance A. Endres
%
% Notes:
%
% Any page numbers in parenthesis refer to:
% "A Guide to LaTeX", 3rd Edition
% by Helmut Kopka & Patrick W. Daly

\def\update{2023/07/30 v1.0}
\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{cnpcreport}[\update\ Lance A. Endres]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{lebookbase}}

\ProcessOptions

\LoadClass[12pt, titlepage, oneside, letterpaper, usechapterstylenumberandname]{lebookbase}

\usepackage{cnpcheadersandfooters}

% HEADERS AND FOOTERS
% Use this to use the CNPC header with the logo and a bottom footer with line and page number.
\pagestyle{cnpcusareportothermatter}

% PAGE SETUP
% See lepageformat.sty for definitions.
\setlength{\voffset}{-61pt}
\setlength{\headheight}{0.6in}
\setlength{\headsep}{30pt}
\setlength{\bottommargin}{0.98in}
\setlength{\footmargin}{0.68in}
\calctextheight{}
\calcfootskip{}
