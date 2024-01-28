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

\ProvidesClass{lebusinessletter}[]

\usepackage{leheadersandfooters}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{lebusinessletterbase}}

% LETTER HEAD HEADERS AND FOOTERS
\newcommand*{\bl@letterheadstyle}{\ps@leletterheada}
\DeclareOption{HeaderStyleC}
{
	\renewcommand{\bl@letterheadstyle}{\ps@leletterheadc}
}
\DeclareOption{HorizontalLineHeaderFooter}
{
	\renewcommand{\bl@letterheadstyle}{\ps@lehorizontalline}
}
\DeclareOption{BlankLetterHead}
{
	\renewcommand{\bl@letterheadstyle}{\ps@leempty}
}

\ProcessOptions
\LoadClass[12pt, oneside, letterpaper]{lebusinessletterbase}

% LETTER HEAD HEADERS AND FOOTERS
\let\ps@empty\bl@letterheadstyle
\let\ps@firstpage\bl@letterheadstyle
