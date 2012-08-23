\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{apextr}
[2011/10/07 v0.1
LaTeX document class for technical report of APEXLAB]
\LoadClassWithOptions{article}

\usepackage{graphicx}
\usepackage{fancyhdr}

% report number
\def\apextr#1{\gdef\@apextr{#1}}
\gdef\@apextr{APEX-TR-DEFAULT}  %Default DERI-TR-number

\typeout{Document Style `APEX TR (Technical Report)' -- version 0.1 (October 2011)}


\def\title#1{\gdef\@title{#1}}

\newif\ifinnertitle
\def\innertitle#1{\innertitletrue\gdef\@innertitle{#1}}

\def\author#1{\gdef\@author{#1}}

\def\authornames#1{\gdef\@authornames{#1}}

\newif\iffulldate
\def\fulldate{\fulldatetrue}

\gdef\thismonth{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \iffulldate\space\number\day,\fi \hskip .5em \number\year}

\def\date#1{\gdef\@date{#1}}
\gdef\@date{\thismonth}

\def\abstract#1{\gdef\@abstract{#1}}

\def\@abstract{}

% acknowledgement put on the bottom of titlepage (not specific to an author)
\newcounter{ack}
\def\acknowledgement#1{\stepcounter{ack}\gdef\@acknowledgement{#1}}
\def\@acknowledgement{}

% publication information, put on the bottom of titlepage (not specific to an author)
\newcounter{pub}
\def\published#1{\stepcounter{pub}\gdef\@published{#1}}
\def\@published{}

% acknowledgement put on the bottom of titlepage (specific to an author)
\def\thanks#1{\def\thefootnote{\arabic{footnote}}~\footnotemark\begingroup\def\protect{
    \noexpand\protect\noexpand}\xdef\@affiliation{\@affiliation
    \protect\footnotetext[\the\c@footnote]{#1}}\endgroup
}

% affiliation of authors
\def\affiliation#1{\def\thefootnote{\arabic{footnote}}\footnotemark\begingroup\def\protect{
    \noexpand\protect\noexpand}\xdef\@affiliation{\@affiliation
    \protect\footnotetext[\the\c@footnote]{#1}}\endgroup
}

\def\@affiliation{}

\def\and{%%                             % \begin{tabular}
\end{tabular}\hskip 1em plus .17fil\begin{tabular}[t]{c}%% \end{tabular}
}

% \def\thefootnote{\arabic{footnote}}

\long\def\@apextrtext#1{\insert\footins{\footnotesize
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth \@parboxrestore
    \edef\@currentlabel{\csname p@footnote\endcsname}%\@thefnmark}
    \parindent 1em\noindent\hbox to 1em{\hss$^{\ }$}
    \rule{\z@}{2\footnotesep}\ignorespaces
    #1\strut}}

\def\maketitle{

  \begin{titlepage}
    \thispagestyle{empty}
    \samepage
    \let\footnotesize\small \let\footnoterule\relax


    \begin{center}
      \begin{minipage}[c]{1.0\linewidth}
        \includegraphics[width=\linewidth]{logo/apexlogo}
      \end{minipage}
    \end{center}


    \addvspace{\stretch{1}}

    \begin{center}
      \begin{minipage}[c]{5in}
        \vbox to 4in
        {
          \begin{center}
            \vspace*{\stretch{2}}
            {
              \LARGE \sc\@title \par
            }
            \vskip 5em
            {
              \large \lineskip .75em
              \begin{tabular}[t]{c}\@authornames
              \end{tabular}\par
            }

            \vskip 6em
            {
              \sc APEX Technical Report\space
              \@apextr \\[1ex]
              \@date
            }
            \vspace*{\stretch{3}
            }
          \end{center}
        }
      \end{minipage}
    \end{center}

    \vfill

    \begin{center}
      \begin{minipage}[c]{5in}
        \begin{center}
          \begin{tabular}{c}
            % \vspace*{-7.5mm}
            % \hspace*{-4mm}
            \textsc{APEX Data \& Knowledge Management Lab}\\
            \vspace*{6pt}
          \end{tabular}

          {\scriptsize\sf%\raggedleft
            311, Yifu Building,\\
            800, Dongchuan Road,\\
            Shanghai, China, 200240.\\
            www.apexlab.org\\
          }
        \end{center}
      \end{minipage}
    \end{center}
  \end{titlepage}

  \setcounter{footnote}{0}


  \thispagestyle{empty}
  \cleardoublepage

  \setcounter{footnote}{0}

  \begin{titlepage}
    \thispagestyle{empty}
    \let\footnotesize\small \let\footnoterule\relax
    \null
    \centerline{{\large\sc APEX Technical Report}}
    \vskip 5pt
    \centerline{{\sc APEX Technical Report\space \@apextr, \@date}}
    \addvspace{\stretch{1.5}}
    \begin{center}
      \begin{minipage}{\textwidth}
        \begin{center}
          {\Large \sc\ifinnertitle\@innertitle\else\@title\fi\par}
          \vskip 3em
          {\large \lineskip .75em
            \begin{tabular}[t]{c}
              \@author
            \end{tabular}}
        \end{center}
      \end{minipage}
    \end{center}
    \par
    \bigskip

    \begin{center}
      \parbox{\textwidth}{\small {\bf Abstract.}\@abstract}
    \end{center}
    \vskip 1em
    \vfill
    \rule{3in}{.2pt}
    \@affiliation
    \ifcase \theack \else
    \@apextrtext{
      \parbox[t]{6in}{
        %%%% \rule{6in}{.2pt}
        {\bf Acknowledgements}: \@acknowledgement
      }
    }
    \fi\par
    \ifcase \thepub \else
    \@apextrtext{
      \parbox[t]{6in}{
        %%%% \rule{6in}{.2pt}
        \@published
      }
    }
    \fi\par
    \@apextrtext{
      \parbox[t]{6in}{Copyright
        \copyright\space\number\year\space by the authors
      }}
  \end{titlepage}

  \setcounter{page}{2}
  \setcounter{footnote}{0}
  \def\thefootnote{\arabic{footnote}}
}

\pagestyle{fancy}
\lhead[{\sc \thepage}]%
{\fancyplain{}{{\sc APEX TR} \@apextr}}
\chead[]{}
\rhead[\fancyplain{}{{\sc APEX TR} \@apextr}]%
{{\sc \thepage}}
\lfoot[]{}
\rfoot[]{}
\cfoot[]{}

\normalmarginpar
