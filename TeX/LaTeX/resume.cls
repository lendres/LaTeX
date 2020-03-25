% Resume class.
%
% Copyright:
% Lance A. Endres
%
% Created:
% April 4, 2005
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

\ProvidesClass{resume}[\update\ Lance A. Endres]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass[12pt, oneside, notitlepage, letterpaper]{article}
\pagestyle{empty}

% Used to calculated lengths.
\usepackage{calc}
% Used for ifthenelse.
\usepackage{ifthen}


% FONTS.
% Change the font usage to type 1 instead of type 3 (bitmapped)
\RequirePackage{amsfonts,amssymb,amsbsy,amsmath}

% My fonts.
\usepackage{lefonts}

% Set standard font sizes.
\usepackage{lefontsizes}
\newlength{\largefontsize}
\setlength{\largefontsize}{12pt}
%\renewcommand{\normalsize}{\Small}

%Small caps bold times new roman for use with catagory headers.
\newfont{\timesbc}{ptmbc7t at \largefontsize}
%\newfont{\helveticb}{phvb at \largefontsize}
\newfont{\helveticbc}{phvbc7t at 16pt}


% Single (1) or double (2) spaced.
\renewcommand{\baselinestretch}{1}


% PAGE FORMATTING COMMANDS (See pg. 35 for a diagram on page layout parameters).
\flushbottom
\usepackage{lepageformat}

% Vertical spacing.
\setlength{\voffset}{-0.15in}                       % Reduce some of the 1 in standard margin.
\setlength{\topmargin}{0pt}                         % There is already a 1 in space by default (reduced by above).
\setlength{\headheight}{12pt}
\setlength{\headsep}{0.15in}
\setlength{\topskip}{0.15in}
\setlength{\bottommargin}{1.0in}
\setlength{\footmargin}{0.85in}
\calctextheight{}
\calcfootskip{}


% DEFINITIONS.
\newcommand*{\@name}{Name}
\newcommand*{\name}[1]{\renewcommand*{\@name}{#1}}

\newcommand*{\@addresslinea}{Address Line 1}
\newcommand*{\addresslinea}[1]{\renewcommand*{\@addresslinea}{#1}}
\newcommand*{\@addresslineb}{Address Line 2}
\newcommand*{\addresslineb}[1]{\renewcommand*{\@addresslineb}{#1}}

\newcommand*{\phonename}{Phone:}
\newcommand*{\@phone}{555-555-5555}
\newcommand*{\phone}[1]{\renewcommand*{\@phone}{#1}}

\newcommand*{\emailname}{Email:}
\newcommand*{\@email}{name@place.org}
\newcommand*{\email}[1]{\renewcommand*{\@email}{#1}}

\newcommand*{\websitename}{Website:}
\newcommand*{\@website}{www.linkedin.com}
\newcommand*{\website}[1]{\renewcommand*{\@website}{#1}}

\newcommand*{\horline}[1][0pt]{\rule[#1]{6.5in}{1pt}}
\newcommand*{\makeresumeheaderA}
{
    \begin{center}
    \horline \\
    \bfseries \Large
    \vspace{-2pt}   \@name \\
    \mdseries \normalsize
    \@addresslinea \\
    \@addresslineb \\
    Phone: \@phone    \hspace{1in}  Email: \href{mailto: \@email}{\@email} \\
    \horline[6pt]
    \end{center}
    \vspace{-12pt}
}

\newcommand{\contactspace}{\hfill{}$\bullet$\hfill{}}
%\newcommand{\contactspace}{\hspace*{4pt}$\bullet$\hspace*{4pt}}
\newcommand{\makeresumeheaderB}
{
    \vspace*{-44pt}
    \helveticbc
    \noindent \@name \mdseries \normalsize \vspace*{-9pt} \\
    \noindent \horline \vspace*{-5pt}\\
    \noindent{\normalsize \@email{} \contactspace{} \@website{} \contactspace{} \@phone{}}\\
    \vspace*{-16pt}
}

%This command will defer commands until the call to begin document is made.
%\AtBeginDocument{\makeresumeheaderB}
%\AtEndDocument{\catagory{References}\rule{\datewidth}{0in} Available upon request}


% CATAGORIES AND ENTRIES.
\newcommand{\catagory}[1]{\section*{#1}}
%{\vspace*{12pt}\noindent{\timesbc#1}}

\renewcommand{\section}{\@startsection%
{section}%                                           % The name.
{1}%                                                 % The level.
{\z@}%
{-0pt plus -14pt minus -1pt}%                         % The beforeskip.  Negative: 1st paragraph is not indented.
{+1pt plus -1pt minus -1pt}%                         % The afterskip.
{\center\large\ArialBold{}}}%                        % The s-t-y-l-e.
% {\timesbc}}                                          % The s-t-y-l-e.

\newlength{\datewidth}
\setlength{\datewidth}{2.0in}
%\newcommand{\catentry}[3]{\noindent\begin{minipage}[t]{\textwidth}\begin{minipage}[t]{\datewidth}\emph{#1} \end{minipage} \begin{minipage}[t]{\textwidth-\datewidth} \emph{#2} \\ #3 \end{minipage} \end{minipage} \vspace{4pt}}

% Experience
% Arguments: Date, Position Tile, Company Name, Company Address
\newcommand{\catentry}[4]
{
    \noindent\begin{minipage}[t]{\textwidth}
        \begin{minipage}[t]{\textwidth-\datewidth} \textbf{\MakeUppercase{#3}} - #4\hspace{0pt}\\ \emph{\textbf{#2}}\end{minipage}\begin{minipage}[t]{\datewidth}\hfill{}#1\end{minipage}
    \end{minipage}\vspace{4pt}%
}

% Education
% Arguments: Date, Degree, University
\newcommand{\catentryeducation}[3]
{
    \noindent\begin{minipage}[t]{\textwidth}
        \begin{minipage}[t]{\textwidth-\datewidth} \textbf{\MakeUppercase{#3}}\\ \emph{\textbf{#2}} \end{minipage}\begin{minipage}[t]{\datewidth}\hfill{}#1\end{minipage}
    \end{minipage} \vspace{4pt}
}

% Certifications
% Arguments: Date, Title, Address
\newcommand{\catentrycertification}[3]
{
	\noindent\begin{minipage}[t]{\textwidth}
    	\begin{minipage}[t]{\textwidth-\datewidth}#2, #3\end{minipage}\begin{minipage}[t]{\datewidth}\hfill{}#1\end{minipage}
	\end{minipage}%
}

% Memberships
% Arguments: Date, Organization, Description/Title (optional)
\newcommand{\catentrymembership}[3]
{
	\noindent\begin{minipage}[t]{\textwidth}
    	\begin{minipage}[t]{\textwidth-\datewidth}\textbf{#2} \ifthenelse{\equal{#3}{}}{\\ \vspace*{-0.5\baselineskip}}{\\#3\vspace*{0.5\baselineskip}}\end{minipage}\begin{minipage}[t]{\datewidth}\hfill{}#1\end{minipage}
	\end{minipage}%
}

\newcommand{\catentryshort}[3]
{
    \noindent\begin{minipage}[t]{\textwidth}
        \begin{minipage}[t]{\textwidth-\datewidth}#2\end{minipage}
        \begin{minipage}[t]{\datewidth}#1\end{minipage}
    \end{minipage}%
}

% PUBLICATIONS
\let\abstract@bibliography=\bibliography
\renewcommand*{\bibliography}
{
    \abstract@bibliography
    % Don't seem to be able to call any commands here (after \le@bibliography) without screwing up bibliography.
}

\renewenvironment{thebibliography}[1]
    {\list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \setlength{\parskip}{0.5\parskip}
	  \setlength{\itemsep}{0.5\itemsep}
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
  \endlist}
