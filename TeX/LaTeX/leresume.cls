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

\ProvidesClass{leresume}[\update\ Lance A. Endres]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions

\LoadClass[12pt, oneside, notitlepage, letterpaper]{article}
\pagestyle{empty}

% Used to calculated lengths.
\usepackage{calc}
% Used for ifthenelse.
\usepackage{ifthen}

% CONTACT INFO
\usepackage{lecontactinfo}

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
\setlength{\voffset}{-0.20in}                       % Reduce some of the 1 in standard margin.
\setlength{\topmargin}{0pt}                         % There is already a 1 in space by default (reduced by above).
\setlength{\headheight}{12pt}
\setlength{\headsep}{0.15in}
\setlength{\topskip}{0.15in}
\setlength{\bottommargin}{0.9in}
\setlength{\footmargin}{0.85in}
\calctextheight{}
\calcfootskip{}


% DEFINITIONS.
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

\newcommand{\makeresumeheaderC}
{
	\vspace*{-44pt}
	\helveticbc
	\noindent \@name \mdseries \normalsize \vspace*{-9pt} \\
	\noindent \horline \vspace*{-5pt}\\
	\noindent{\normalsize \@email{} \contactspace{} \@website{} \contactspace{} \@websitetwo{} \contactspace{} \@phone{}}\\
	\vspace*{-18pt}
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
{-1pt plus 2pt minus 8pt}%                           % The beforeskip.  Negative: 1st paragraph is not indented.
{+1pt plus 1pt minus 2pt}%                           % The afterskip.
{\center\large\ArialBold}}%                          % The font style.

\newlength{\datewidth}
\setlength{\datewidth}{1.4in}
\newlength{\yeardatewidth}
\setlength{\yeardatewidth}{0.65in}

% Experience
% Arguments: Date, Position Tile, Company Name, Company Address
\newcounter{categoryentries}
\newcommand{\catentry}[4]
{
	\stepcounter{categoryentries}
	\ifthenelse{\equal{\value{categoryentries}}{1}}
	{
		% First entry, do nothing.
	}
	{
		% Add a little space between the end of the last entry and the beginning of this one.
		\vspace{10pt}
	}
	\noindent\begin{minipage}[t]{\textwidth}
		\begin{minipage}[t]{\textwidth-\datewidth} \textbf{\MakeUppercase{#3}} - #4\hspace{0pt}\\ \emph{\textbf{#2}}\end{minipage}\begin{minipage}[t]{\datewidth}\hfill{}#1\end{minipage}
	\end{minipage}\vspace{4pt}%
}

% Projects
% Arguments: Title, Description, Skills
\newcounter{projectentries}
\newcommand{\project}[3]
{
	\stepcounter{projectentries}
	\ifthenelse{\equal{\value{projectentries}}{1}}
	{
		% First entry, do nothing.
	}
	{
		% Add a little space between the end of the last entry and the beginning of this one.
		\vspace*{6pt}
	}
	\textbf{#1}\\
	#2\\
	\textbf{Skills}:\ #3%
}

% Education
% Arguments: Date, Degree, University
\newcommand{\catentryeducation}[3]
{
	\noindent\begin{minipage}[t]{\textwidth}
		\begin{minipage}[t]{\textwidth-\yeardatewidth} \textbf{\MakeUppercase{#3}}\\ \emph{\textbf{#2}} \end{minipage}\begin{minipage}[t]{\yeardatewidth}\hfill{}#1\end{minipage}
	\end{minipage} \vspace{4pt}
}

% Certifications
% Arguments: Date, Title, Address
\newcommand{\catentrycertification}[3]
{
	\noindent\begin{minipage}[t]{\textwidth}
		\begin{minipage}[t]{\textwidth-\yeardatewidth}#2, #3\end{minipage}\begin{minipage}[t]{\yeardatewidth}\hfill{}#1\end{minipage}
	\end{minipage}%
}

% Memberships
% Arguments: Date, Organization, Description/Title (optional)
\newcommand{\catentrymembership}[3]
{
	\noindent\begin{minipage}[t]{\textwidth}
		\begin{minipage}[t]{\textwidth-\yeardatewidth}\textbf{#2} \ifthenelse{\equal{#3}{}}{\\ \vspace*{-0.5\baselineskip}}{\\#3\vspace*{0.5\baselineskip}}\end{minipage}\begin{minipage}[t]{\yeardatewidth}\hfill{}#1\end{minipage}
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
