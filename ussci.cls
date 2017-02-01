\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{ussci}[2017/01/12 v0.1]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions \relax

\LoadClass{article}

\RequirePackage{calc}
\RequirePackage{geometry}
\geometry{
    margin=1in,
    headheight=14.5pt,
    footskip=0.5in,
    headsep=0.5in-\headheight
}

\RequirePackage{biblatex}

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{mathptmx}

\RequirePackage{fancyhdr}
\fancypagestyle{plain}{%
\fancyhf{}%
\fancyhead[L]{Sub Topic: \papertopic}%
\fancyfoot[C]{\thepage}%
\renewcommand{\headrulewidth}{0pt}%
\renewcommand{\footrulewidth}{0pt}%
}
\pagestyle{plain}

\long\def\affiliation#1{\gdef\@affiliation{#1}}
\let\@affiliation\@empty

% \def\corremail#1{\gdef\@corremail{#1}}
% \let\@corremail\@empty

\def\@maketitle{%
  \newpage%
  \begin{center}%
  \let\footnote\thanks%
    {%
    10th U. S. National Combustion Meeting\\%
    Organized by the Eastern States Section of the Combustion Institute\\%
    April 23-26, 2017\\%
    College Park, Maryland\par\vspace{\baselineskip}%
    }%
    {\fontsize{18pt}{21.6pt}\selectfont\@title \par}%
    \vspace{\baselineskip}%
    {\fontsize{14pt}{16.8pt}\selectfont\itshape%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vspace{\baselineskip}%
    {\itshape \@affiliation}%
  \end{center}%
  \par%
}

\renewenvironment{abstract}{%
  \if@twocolumn
    \section*{\abstractname}%
  \else%
    \fontsize{10pt}{12pt}\selectfont%
    \list{{\bfseries\abstractname:}}{%
            \listparindent=0.0in%
            \itemindent=0.5in%
            \leftmargin=0.5in%
            \rightmargin=0.5in%
            \parsep=\z@\@plus\p@}%
    \item\relax
  \fi}
  {\endlist}

\RequirePackage{titlesec}
\titleformat{\section}{\normalfont\bfseries}{\thesection.\space}{0pt}{}

\RequirePackage{hyperref}
\urlstyle{tt}
\newcommand{\email}[1]{\href{mailto:{#1}}{\tt{\nolinkurl{#1}}}}
