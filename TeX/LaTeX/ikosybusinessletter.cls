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


% LETTER HEAD HEADERS AND FOOTERS
\usepackage{ikosyheadersandfooters}
\newcommand*{\ik@letterheadstyle}{\ps@ikosybusinessletterA}
%\DeclareOption{HeaderStyleC}
%{
%	\renewcommand{\ik@letterheadstyle}{\ps@ikosybusinessletterA}
%}
%\DeclareOption{HorizontalLineHeaderFooter}
%{
%	\renewcommand{\ik@letterheadstyle}{\ps@lehorizontalline}
%}
%\DeclareOption{BlankLetterHead}
%{
%	\renewcommand{\ik@letterheadstyle}{\ps@leempty}
%}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{lebusinessletter}}
\ProcessOptions \LoadClass[12pt, oneside, letterpaper]{lebusinessletter}

\usepackage{legraphicextensions}

% CONTACT INFO
\usepackage{lecontactinfo}
\telephone{\phone{}}

% PAGE FORMATTING
\let\ps@empty\ik@letterheadstyle
\let\ps@firstpage\ik@letterheadstyle

