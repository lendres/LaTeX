% Modified book class.
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

\ProvidesClass{lebook}[\update\ Lance A. Endres]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{lebookbase}}

\ProcessOptions

\LoadClass[12pt, titlepage, oneside, letterpaper]{lebookbase}

% PROVIDE STANDARD HEADERS AND FOOTERS.
\usepackage{leheadersandfooters}

% COMMANDS
\newcommand*{\printtitlepage}[4]
{
	\begin{titlepage}
		\begin{center}
%			\includegraphics[width=\textwidth]{hccheader}\\
			\vspace*{12pt}
			\Huge \bfseries
			#1 \\
			\vfill \Large \bfseries
			#2
			\vfill \large
			#3 \\
			#4\footnote{Last updated: \today}
		\end{center} \normalsize \mdseries
	\end{titlepage}
}
