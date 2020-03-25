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

\ProvidesClass{businessletter}[\update\ Lance A. Endres]
\newcommand*{\authorname}{Lance A. Endres}
\DeclareOption{FullName}
{
    \renewcommand*{\authorname}{Lanson A. Endres}
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{letter}} 
\ProcessOptions \LoadClass[12pt, oneside, letterpaper]{letter} 

\usepackage{calc}

% FONTS.
\usepackage{lefontsizes}

% Single (1) or double (2) spaced.
\renewcommand{\baselinestretch}{1}


% Horizontal spacing.
% There is a 1 in space on the left and top margins that Latex measures from, so set the left margin to zero.
\setlength{\hoffset}{0in}
\setlength{\oddsidemargin}{0in}                         % Get a 1 inch left margin.
\setlength{\evensidemargin}{0in}                        % Get a 1 inch left margin.
\setlength{\textwidth}{6.5in}

% Vertical spacing.
\setlength{\voffset}{0.00in}                            % Reduce some of the 1 in standard margin.
\setlength{\topmargin}{0pt}                             % There is already a 1 in space by default (reduced by above).
\setlength{\headheight}{0pt}
\setlength{\headsep}{0pt}
\setlength{\topskip}{0pt}
\setlength{\footskip}{0pt}
\setlength{\textheight}{11in-2in-\topskip-\voffset-\headheight-\headsep-\footskip}




\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}



\usepackage{leaddress}
\name{\authorname}
\address{\myaddresstwoline}
\signature{\authorname}
\telephone{\myphoneone}

\newcommand{\@senderemail}{\myemailone}
\newcommand{\senderemail}[1]{\renewcommand{\@senderemail}{#1}}

\renewcommand{\enclname}{Enclosure}
\newcommand{\encls}[1]{\renewcommand{\enclname}{Enclosures}\encl{#1}}


\renewenvironment{letter}[1]
{
    \newpage
    \if@twoside
        \ifodd
            \c@page
        \else
            \thispagestyle{empty}\null\newpage
        \fi
    \fi
    \c@page \@ne
    \c@footnote \z@
    \interlinepenalty=200 % smaller than the TeXbook value
    \@processto{\leavevmode\ignorespaces #1}
    \setcounter{page}{1}
}
{
    \stopletter
%   \@@par \pagebreak \@@par
    \if@filesw
        \begingroup
        \let\\=\relax
        \let\protect\@unexpandable@protect
        \immediate\write\@auxout{\string\@mlabel{\returnaddress}{\toname\\\toaddress}}
        \endgroup
    \fi
}

\renewcommand*{\opening}[1]
{
    \ifx\@empty\fromaddress
        \thispagestyle{firstpage}
        {\raggedright\@date\par}
    \else
        \thispagestyle{empty}
        {\raggedright\fromaddress \par \@date\par}
    \fi
    \vspace{2\parskip}
    {\raggedright \toname \\ \toaddress \par}
    \vspace{2\parskip}
    #1\par\nobreak
}
 
\renewcommand{\closing}[1]
{
    \par\nobreak\vspace{\parskip}
    \stopbreaks
    \noindent
    \ifx\@empty\fromaddress\else
        %\hspace*{\longindentation}
    \fi
    \parbox{\textwidth}{\raggedright \ignorespaces #1\\[6\medskipamount]
        \ifx\@empty\fromsig
            \fromname
        \else \fromsig
        \fi
        \strut
    }
    \par
}
