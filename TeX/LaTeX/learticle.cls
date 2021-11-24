% Modified article class.
%
% Copyright 2004:
% Lance A. Endres
%
% Created:
% April 28, 2004
%
% Author:
% Lance A. Endres
%
% Notes:
%
% Any page numbers in parenthesis refer to:
% "A Guide to LaTeX", 3rd Edition
% by Helmut Kopka & Patrick W. Daly 

\def\update{2004/04/28 v1.0}
\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{learticle}[\update\ Lance A. Endres]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions

\LoadClass[12pt, letterpaper]{article}

% Can use this while writing to make sections that need to be completed.
\newcommand*{\notfinished}{\large \begin{center} \textbf{********** N O T\ \ \ F I N I S H E D **********} \end{center} \normalsize}
\newcommand*{\needsreferences}{\textbf{\Small\ (*** Needs References ***) }}

% Used to calculated lengths.
\usepackage{calc}

% FONTS.
\usepackage{lefontsizes}

% Single (1) or double (2) spaced.
\renewcommand{\baselinestretch}{1}

% REPROGRAMMING THE SECTIONING COMMANDS TO CHANGE SECTION FONTS AND SPACING (pg. 348)
\setcounter{secnumdepth}{3}

\renewcommand{\section}{\@startsection
     {section}                                           % The name.
     {2}                                                 % The level.
     {\z@}
     {-12pt plus -2pt minus -1pt}                        % The beforeskip.
     {+6pt plus -1pt minus -1pt}                         % The afterskip.
     {\large \bfseries \MakeUppercase}}                  % The s-t-y-l-e.

\renewcommand{\subsection}{\@startsection
     {subsection}                                        % The name.
     {3}                                                 % The level.
     {\z@}
     {-12pt plus -2pt minus -1pt}                        % The beforeskip.
     {+6pt plus -1pt minus -1pt}                         % The afterskip.
     {\normalsize \bfseries}}                            % The s-t-y-l-e.
    

% Put a period after the section number.
%\renewcommand{\@seccntformat}[1]{\@nameuse{the#1}.\quad}

% SETUP THE PAGE SIZE AND MARGINS.
\usepackage{lepageformat}

% CHANGE PREPROGRAMMED TEXT AND ADD SOME NEW (pg. 351)
\usepackage{lecaptions}

% TABLE OF CONTENTS, INDEX, AND BIBLIOGRAPHY.
\usepackage{lecontentsindexbibformat}

% PROVIDE STANDARD HEADERS AND FOOTERS.
\usepackage{leheadersandfooters}
