% Letter class.
%
% Copyright:
% Lance A. Endres
%
% Created:
% April 7, 2005
%
% Author:
% Lance A. Endres
%
% Notes:
% Any page numbers in parenthesis refer to:
% "A Guide to LaTeX", 3rd Edition
% by Helmut Kopka & Patrick W. Daly

\def\update{2023/08/20 v1.0}
\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{cnpcbusinessletter}[]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{lebusinessletterbase}}
\ProcessOptions
\LoadClass[12pt, oneside, letterpaper]{lebusinessletterbase}

% PAGE SETUP
% See lepageformat.sty for definitions.
\setlength{\voffset}{-52pt}
\setlength{\headheight}{0.65in}
\setlength{\headsep}{14pt}
\setlength{\footmargin}{0.35in}
\setlength{\bottommargin}{1.6in}
\setlength{\addressskip}{0\parskip}
\calctextheight{}
\calcfootskip{}

% HEADERS AND FOOTERS
\usepackage{cnpcheadersandfooters}

% In the letter document class, \opening issues \thispagestyle{firstpage}, where \ps@firstpage is defined in letter.cls for the first page of a letter.
\let\ps@empty\ps@cnpcletterheadA
\let\ps@firstpage\ps@cnpcletterheadA

% Remaining page styles.
\pagestyle{cnpcletterheadA}
