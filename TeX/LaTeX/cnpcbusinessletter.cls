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

\setlength{\headsep}{0.65in}
\setlength{\bottommargin}{2.0in}
\setlength{\footmargin}{\bottommargin-1in}
\calctextheight{}
\calcfootskip{}

% LETTER HEAD HEADERS AND FOOTERS
\usepackage{cnpcheadersandfooters}
\newcommand*{\cnpc@letterheadstyle}{\ps@cnpcletterheadA}

% PAGE FORMATTING
\let\ps@empty\cnpc@letterheadstyle
\let\ps@firstpage\cnpc@letterheadstyle
