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

\def\update{2004/01/23 v1.0}
\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{ikosybusinessletter}[]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{lebusinessletterbase}}
\ProcessOptions
\LoadClass[12pt, oneside, letterpaper]{lebusinessletterbase}

\usepackage{legraphicextensions}

% CONTACT INFO
%\usepackage{lecontactinfo}
%\telephone{\phone{}}

% LETTER HEAD HEADERS AND FOOTERS
\usepackage{ikosyheadersandfooters}
\newcommand*{\ik@letterheadstyle}{\ps@ikosybusinessletterA}
\let\ps@empty\ik@letterheadstyle
\let\ps@firstpage\ik@letterheadstyle
