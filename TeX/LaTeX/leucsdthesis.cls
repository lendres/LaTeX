% Modified book class.
%
% Copyright:
% Lance A. Endres
%
% Created:
% October 15, 2004
%
% Author:
% Lance A. Endres
%
% Notes:
% This document was originally created for a doctoral dissertation for
% the University of California, San Diego.
%
% Any page numbers in parenthesis refer to:
% "A Guide to LaTeX", 3rd Edition
% by Helmut Kopka & Patrick W. Daly 

\def\update{2004/10/15 v1.0}
\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{leucsdthesis}[\update\ UCSD]


% PROVIDE STANDARD HEADERS AND FOOTERS.
\usepackage{leheadersandfooters}

\newlength{\evenpagemarginstandard}
\newlength{\oddpagemarginstandard}
\setlength{\evenpagemarginstandard}{0.6in}
\setlength{\oddpagemarginstandard}{\evenpagemarginstandard}
\DeclareOption{twoside}
{
    \addtolength{\evenpagemarginstandard}{-0.5in}
    \let\ps@lepagenumbertopright=\ps@lepagenumbertoptwoside
}


\DeclareOption{altpagenumbers}
{
    \let\ps@lepagenumbertopright=\ps@lepagenumbertoptwoside
}


\newcommand*{\@abstractonly}{0}
\DeclareOption{abstractonly}
{
    \renewcommand*{\@abstractonly}{1}
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions
\LoadClass[12pt,titlepage,letterpaper]{book}



% NOTES/EDITING.
% Can use this while writing to make sections that need to be completed.
\newcommand{\notfinished}{\Large \begin{center} \textbf{********** N O T\ \ \ F I N I S H E D **********} \end{center} \normalsize}
\newcommand*{\asteriskfill}{{\noindent\Large\textbf{{*\hfill*\hfill*\hfill*\hfill*\hfill*\hfill*\hfill*\hfill*\hfill*\hfill*\hfill*\hfill*\hfill*\hfill*\hfill*\hfill*\hfill*\hfill*\hfill*\hfill*}}}}
\newcommand{\todo}[1]{\asteriskfill{} \vspace*{-12pt} \\ \vspace*{-6pt} \textbf{{\noindent \centering \large T O\ \ \ D O\\}} {\noindent #1} \\ \asteriskfill{}}


% PROGRAMMING/MACRO CONTROL.
% Used to calculated lengths.
\usepackage{calc}

% Used for logic control.
\usepackage{ifthen}


% GLOSSARY.
\usepackage[number=none,toc=true,style=list]{glossary}
\usepackage{leglossary}


% FONTS.
\usepackage{lefontsizes}


% CAPTIONS - Chapter name, Equation name, et cetera.
\usepackage{lecaptions}


% SECTIONING COMMANDS.
% Specifies how the chapter and sections headers look.
% Override the \def\newchapter in lesections.sty to make use of the different chapter
% header style.
%\usepackage{lesections}
\usepackage[usechapterstyleb, addlofchapterds]{lesections}
%\usepackage[usechapterstyleb]{lesections}
\setchapterheadingpagestyle{pagenumbercenteredinfooter}
\setusechapterheaderfront{1}
\setusechapterheadermain{1}
\setusechapterheaderback{1}


% CONTENTS, INDEX, BIBLIOGRAPHY 
\usepackage[addlofchapterds,lofnoleftlabel,lotnoleftlabel]{lecontentsindexbibformat}
%\usepackage{lecontentsindexbibformat}

% CHANGE FORMAT FOR LIST OF FIGURES AND LIST OF TABLES.
\let\ucsd@listoffigures\listoffigures
\renewcommand*{\listoffigures}
{
    \begingroup
        \let\ucsd@numberline\numberline
        \renewcommand*{\numberline}[1]%
        {
                % More place for the figure number is needed.
                \addtolength{\@tempdima}{\widthof{Figure \ }}
                \ucsd@numberline{Figure ##1: }
        }
        \ucsd@listoffigures
    \endgroup
}

\let\ucsd@listoftables\listoftables
\renewcommand*{\listoftables}
{
    \begingroup
        \let\ucsd@numberline\numberline
        \renewcommand*{\numberline}[1]%
        {
            % More space for the table number is needed.
            \addtolength{\@tempdima}{\widthof{Table }}
            \ucsd@numberline{Table ##1: }
        }
        \ucsd@listoftables
    \endgroup
}

% LIST OF NOTATIONS
\usepackage{lelistofnotations}


% BASELINESTRETCH - CONTROL LINE SPACING.
% Normal line spacing, used everywhere a specific spacing isn't used.
% Single (1) or double (2) spaced.
\usepackage{setspace}
\setstretch{1.5}


\tocbaselinestretch{1.0}
\bibbaselinestretch{1.0}
\lofbaselinestretch{1.0}
\lotbaselinestretch{1.0}
\idxbaselinestretch{1.0}
\lonbaselinestretch{1.0}


% EQUATIONS.
% Original values.
% \abovedisplayskip=12pt plus 3pt minus 9pt
% \abovedisplayshortskip=0pt plus 3pt
% \belowdisplayskip=12pt plus 3pt minus 9pt
% \belowdisplayshortskip=7pt plus 3pt minus 4pt

% Reset to.
\setlength{\abovedisplayskip}{9pt plus 6pt minus 2pt}
\setlength{\belowdisplayskip}{9pt plus 6pt minus 2pt}
\setlength{\abovedisplayshortskip}{4pt plus 6pt minus 2pt}
\setlength{\belowdisplayshortskip}{6pt plus 6pt minus 2pt}

% Spacing between lines of an eqnarray.
\setlength{\jot}{12pt}


% FLOATS.
% Let's not skip a mile between captions and figures.
%\addtolength{\abovecaptionskip}{-24pt}
%\addtolength{\belowcaptionskip}{-24pt}

% The separation between two (or more) floats that are placed all at the top/bottom of a page.
\setlength{\floatsep}{26pt}

% The separation between floats placed using the 'h' option (in the text, not at top or bottom of page).
\setlength{\intextsep}{\textfloatsep}

% From: http://dcwww.camd.dtu.dk/~schiotz/comp/LatexTips/LatexTips.html#figplacement
% LaTeX's figure placement algorithm is quite biased in favor of putting figures on a page by themselves, 
% instead of on the top of a page with some text below it. Often, I find the result aesthetically unappealing 
% (to be polite). Fortunately, the parameters of the algorithm can be changed. The main problem is that LaTeX 
% per default only allows a part of the top of a text-page (70%) to contain figures, and requires at least 20% 
% of a page to be text when text and figures share a page. These parameters should be set to more reasonable 
% values, for example 85% and 10%.

\renewcommand{\topfraction}{0.85}
\renewcommand{\textfraction}{0.1}


% PARAGRAPH.
% Indent first paragraph.
% Indents the first line of a paragraph as required by UCSD guidelines.
% Note: This could also be accomplished by changing the \@sectstart and removing
% the negative values from the pre-skip.
\usepackage{indentfirst}
\setlength{\parindent}{0.5in}

% Spacing between paragraphs.
\setlength{\parskip}{0pt plus 1pt minus 1pt}


% TABLE OF CONTENTS DOTTED LEADERS.
% Specify that the table of contents should have dotted leaders
% for the chapters also.
\usepackage[titles]{tocloft}
\renewcommand{\cftchapleader}{\cftsecleader}
\renewcommand{\cftchapdotsep}{\cftsecdotsep}


% PAGE FORMATTING COMMANDS 
% (See pg. 35 for a diagram on page layout parameters).
% All margins are increased by 0.1 inch to ensure adequate safety factor.
\usepackage{lepageformat}
%\clubpenalty=9999
%\widowpenalty=9999
\clubpenalty=500
\widowpenalty=500

% Horizontal spacing.
% There is a 1 in space on the left and top margins that Latex measures from, so work from there.
\setlength{\oddsidemargin}{\oddpagemarginstandard}        % Get a 1.5 inch left margin + 0.1 safety.
\setlength{\evensidemargin}{\evenpagemarginstandard}      % Get a 1.5 inch left margin + 0.1 safety.
\setlength{\textwidth}{5.8in}                             % Get a 1.0 inch right margin + 0.1 safety.

% Vertical spacing.
\setlength{\pageheight}{11in}

\setlength{\topmargin}{0in}                               % There is already a 1 in space.
\setlength{\voffset}{-0.57in}                             % Pg. 546.  Reduce some of the 1 in standard margin (to get the header higher).  0.5 inch top margin for page numbers + 0.1 for safety.
                                                          % 0.57" Seems to be the required value to get the header at 0.5" from the top.
\setlength{\headheight}{12pt}                             % Height of the header.

\setlength{\headsep}{1.1in-1in-\voffset-\headheight}      % Separation between header and top of top line of body.

\setlength{\topskip}{17pt}                                % Distance from top of body to base of first line of text.

\setlength{\bottommargin}{1.35in}                         % Distance from bottom of the text (\textheight) to the bottom of the page.

% Height of text.
\calctextheight{}

% Distance from bottom of text to bottom of footer.
\setlength{\footmargin}{0.55in}
\calcfootskip{}


% STORE REQUIRED INFORMATION.
\newcommand*{\@authorfirstname}{AuthorFirstName}
\newcommand*{\authorfirstname}{\@authorfirstname}

\newcommand*{\@authormiddlename}{AuthorMiddleName}
\newcommand*{\authormiddlename}{\@authormiddlename}

\newcommand*{\@authorlastname}{AuthorLastName}
\newcommand*{\authorlastname}{\@authorlastname}

\usepackage{xspace}
\renewcommand*{\author}[3]
{
    \renewcommand{\@authorfirstname}{#1}
    \renewcommand{\@authormiddlename}{#2}
    \renewcommand{\@authorlastname}{#3}
    \renewcommand{\@author}{#1\xspace#2 #3}
    
    % For external use.
    \newcommand*{\ucsdauthor}{\@author}
}

\newcommand*{\indexauthor}{\index{\authorlastname{}, \authorfirstname{} \authormiddlename{}}}

%\let\ucsd@title=\title
\renewcommand*{\title}[1]
{
    \renewcommand{\@title}{#1}
    \newcommand*{\ucsdtitle}{#1}
}

\newcommand*{\@department}{Department}
\newcommand*{\department}[1]{\renewcommand{\@department}{#1}}

\newcommand*{\@chair}{Chair}
\newcommand*{\chair}[1]{\renewcommand{\@chair}{#1}}

\newcommand*{\@profa}{Name 1}
\newcommand*{\profa}[1]{\renewcommand{\@profa}{#1}}
\newcommand*{\@profb}{Name 2}
\newcommand*{\profb}[1]{\renewcommand{\@profb}{#1}}
\newcommand*{\@profc}{Name 3}
\newcommand*{\profc}[1]{\renewcommand{\@profc}{#1}}
\newcommand*{\@profd}{Name 4}
\newcommand*{\profd}[1]{\renewcommand{\@profd}{#1}}

\newcommand*{\@gradyear}{2007}
\newcommand*{\gradyear}[1]{\renewcommand{\@gradyear}{#1}}


% PROVIDE SOME USEFUL FORMATTING MACROS.
\newcommand{\printucsdtitlepage}
{
    \begin{titlepage}
    \thispagestyle{leempty}
    \let\@storebaselinestretch=\baselinestretch
    \renewcommand{\baselinestretch}{1.0}
    \begin{center} \large \bfseries
    UNIVERSITY OF CALIFORNIA, SAN DIEGO
    \vfill \normalsize
    \@title
    \vfill
    A dissertation submitted in partial satisfaction of the \\
    requirements for the degree Doctor of Philosophy \\
    \vspace*{18pt}
    in \\
    \vspace*{18pt}
    \@department \\
    \vspace*{18pt}
    by \\
    \vspace*{18pt}
    \@author
    \vfill
    \end{center}
    \bfseries
    Committee in charge: \par
    Professor \@chair, Chair \par
    Professor \@profa \par
    Professor \@profb \par
    Professor \@profc \par
    Professor \@profd \par    
    \vfill
    \center{\@gradyear}
    \normalsize \mdseries
    \let\baselinestretch=\@storebaselinestretch
    \end{titlepage}
}


% COPYRIGHT PAGE.
\newcommand\printcopyright
{
    \clearpage
    \thispagestyle{leempty}
    \vspace*{\fill}
    \begin{center}
    Copyright \\
    \@author, \@gradyear \\
    All rights reserved.
    \end{center}
}


% SIGNATURE PAGE.
\newcommand\printsignaturepage
{
    \newpage
    \thispagestyle{pagenumbercenteredinfooter}
    \setcounter{page}{3}
    \addcontentsline{toc}{chapter}{Signature Page}
    \vspace*{\fill}
    \begin{center}
    \begin{minipage}[t]{0.9\textwidth}

    The dissertation of \@author\ is approved, and it is acceptable in quality and form for publication on microfilm:

    \vspace*{12pt}

    \newcommand*{\signaturespacer}{\rule{0in}{0.65in}}
    \noindent
    \begin{tabular*}{\textwidth}[h]{c}
    \signaturespacer{} \\ \hline
    \signaturespacer{} \\ \hline
    \signaturespacer{} \\ \hline
    \signaturespacer{} \\ \hline
    \signaturespacer{} \\ \hline
    \end{tabular*}
    \rule{0mm}{2.2ex}
    \hspace*{\fill} Chair

    \center{University of California, San Diego}
    
    \@gradyear
    \end{minipage}
    \end{center}
    \vspace*{\fill}
    \pagebreak
}


% VITA.
\newfont{\timesbc}{ptmbc7t at 13pt}
\newcommand{\catagory}[1]{\noindent{\timesbc#1}}
\newlength{\datewidth}
\setlength{\datewidth}{1.5in}
\newcommand{\catentry}[3]
{
    \noindent\begin{minipage}[t]{\textwidth}
        \begin{minipage}[t]{\datewidth}
            \emph{#1}
        \end{minipage}
        \begin{minipage}[t]{\textwidth-\datewidth}
            \emph{#2}\\#3
        \end{minipage}
    \end{minipage}
    \vspace*{8pt}
}

% Publications.
\newcounter{publications}
\renewcommand{\thepublications}{\stepcounter{publications}[\arabic{publications}]}
\newlength{\pubcountwidth}
\setlength{\pubcountwidth}{0.22in}

\newcommand{\publication}[2]
{
    \noindent
    \begin{minipage}[t]{\textwidth}
        \begin{minipage}[t]{\pubcountwidth} #1 \end{minipage}
        \begin{minipage}[t]{\textwidth-\pubcountwidth} #2 \end{minipage}
    \end{minipage}
    \vspace*{8pt}
}

\newcommand{\article}[4]{\publication{\thepublications}{#1.  #2.  \emph{#3}.  #4.}}
\newcommand{\inproceedings}[4]{\publication{\thepublications}{#1.  #2.  In \emph{#3}.  #4.}}


% ABSTRACT.
% \newcommand\beginabstract
% {
%     \chapter*{ABSTRACT OF THE DISSERTATION}
%     \addcontentsline{toc}{chapter}{Abstract}
%     \begin{center}
%     \@title \\
%     \vspace*{15pt}
%     by \\
%     \vspace*{15pt}
%     \@author \\
%     Doctor of Philosophy in \@department \\
%     \vspace*{15pt}
%     University of California, San Diego, \@gradyear \\
%     Professor \@chair, Chair \\
%     \end{center}
%     \vspace*{30pt}
% }

\newcommand\beginabstract
{
    \if@openright\cleardoublepage\else\clearpage\fi
    \thispagestyle{\chapterheadingpagestyle}
    \vspace*{0.85in}%
    {\parindent \z@ \normalfont
    \interlinepenalty\@M
    {\large \begin{center}ABSTRACT OF THE DISSERTATION\end{center}}\par\nobreak
    \vspace*{15pt}
    }
    
    \addcontentsline{toc}{chapter}{Abstract}
    \begin{center}
    \@title \\
    \vspace*{15pt}
    by \\
    \vspace*{15pt}
    \@author \\
    Doctor of Philosophy in \@department \\
    \vspace*{15pt}
    University of California, San Diego, \@gradyear \\
    Professor \@chair, Chair \\
    \end{center}
    \vspace{30pt}
}


\ifthenelse{\equal{\@abstractonly}{1}}
{
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
          \clubpenalty4000
          \@clubpenalty \clubpenalty
          \widowpenalty4000%
          \sfcode`\.\@m}
         {\def\@noitemerr
           {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
}
{}
