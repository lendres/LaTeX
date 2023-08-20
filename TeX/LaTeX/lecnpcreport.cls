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

\ProvidesClass{lecnpcreport}[\update\ Lance A. Endres]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{lebook}}

\ProcessOptions

\LoadClass[12pt, titlepage, oneside, letterpaper, usechapterstylenumberandname]{lebook}

\usepackage{cnpcheadersandfooters}

% HEADERS AND FOOTERS
% Use this to use the CNPC header with the logo and a bottom footer with line and page number.
\pagestyle{cnpcusareportothermatter}
\cnpctopbottommargins{}
