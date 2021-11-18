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

\ProvidesClass{lebusinessletter}[]

\usepackage{calc}

% SIGNITURE SPACE OPTIONS
% Option to shorten the space between the closing and name.
\newlength{\signaturespace}
\setlength{\signaturespace}{6\medskipamount}
\DeclareOption{NoSignatureSpace}
{
    \setlength{\signaturespace}{2\medskipamount}
}
\DeclareOption{SmallSignatureSpace}
{
    \setlength{\signaturespace}{4\medskipamount}
}

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

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{letter}} 
\ProcessOptions \LoadClass[12pt, oneside, letterpaper]{letter} 

% CONTACT INFO
\usepackage{lecontactinfo}
\telephone{\phone{}}

% PAGE FORMATTING
\usepackage{leheadersandfooters}
\let\ps@empty\bl@letterheadstyle
\let\ps@firstpage\bl@letterheadstyle

% FONTS.
\usepackage{lefontsizes}

% Single (1) or double (2) spaced.
\renewcommand{\baselinestretch}{1}


% PAGE FORMATTING COMMANDS (See pg. 35 for a diagram on page layout parameters).
\flushbottom
\usepackage{lepageformat}

% Address and date separation.
\newlength{\addressskip}
\setlength{\addressskip}{\parskip}

% Vertical spacing.
\setlength{\voffset}{-0.45in}                           % Reduce some of the 1 in standard margin.
\setlength{\headheight}{24pt}
\setlength{\headsep}{20pt+\addressskip}
\setlength{\topskip}{12pt}
\setlength{\bottommargin}{1.0in}
\setlength{\footmargin}{\bottommargin-24pt}
\calctextheight{}
\calcfootskip{}


% Figures
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}


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
    \vspace{\addressskip}
    {\raggedright \toname \\ \toaddress \par}
    \vspace{\addressskip}
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
    \parbox{\textwidth}{\raggedright \ignorespaces #1\\[\signaturespace]
        \ifx\@empty\fromsig
            \fromname
        \else \fromsig
        \fi
        \strut
    }
    \par
}

%6\medskipamount
