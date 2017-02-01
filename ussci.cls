\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{ussci}[2017/01/12 v0.1]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions \relax

\LoadClass{article}

\RequirePackage{biblatex}
\RequirePackage{calc}

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{mathptmx}

\def\@maketitle{%
    \newpage%
    \begin{center}%
    {%
    10\textsuperscript{th} U.S. National Combustion Meeting\\%
    Organized by the Eastern States Section of the Combustion Institute\\%
    April 23--26, 2017\\%
    College Park, Maryland\par\vspace{\baselineskip}%
    }%
    {\fontsize{18pt}{21.6pt}\selectfont\@title\par}%
    {\fontsize{14pt}{16.8pt}\selectfont\itshape%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
  \end{center}%
  \par%
}

\renewenvironment{abstract}{%
    \fontsize{10pt}{12pt}\selectfont%
    \list{{\bfseries\abstractname:}}{%
            \listparindent=0.0in%
            \itemindent=0.4in%
            \leftmargin=0.5in%
            \rightmargin=0.5in%
            \setlength{\topsep}{0pt}%
            \setlength{\partopsep}{0pt}%
            \parsep=\z@}%
    \item\relax
}
{\endlist}

\newenvironment{keyword}{
    \fontsize{10pt}{12pt}\selectfont\bfseries\itshape%
    \list{{Keywords:}}{%
            \listparindent=0.0in%
            \itemindent=0.4in%
            \leftmargin=0.5in%
            \rightmargin=0.5in%
            \parsep=\z@%
            \setlength{\topsep}{0pt}%
            \setlength{\partopsep}{0pt}%
            \parskip=\z@}%
    \item\relax
}{\endlist}

\def\sep{\unskip, }%

\RequirePackage{titlesec}
\titleformat{\section}{\normalfont\bfseries}{\thesection.\space}{\z@}{}

\RequirePackage{authblk}
\renewcommand\Authfont{\itshape}
\renewcommand\Affilfont{\itshape\small}

\RequirePackage{hyperref}
\urlstyle{tt}
\newcommand{\email}[1]{\href{mailto:{#1}}{\tt{\nolinkurl{#1}}}}

\RequirePackage{geometry}
\geometry{
    margin=1in,
    headheight=14.5pt,
    footskip=0.5in,
    headsep=0.5in-\headheight
}

\RequirePackage{fancyhdr}
\fancypagestyle{plain}{%
\fancyhf{}%
\fancyhead[L]{Sub Topic: \papertopic}%
\fancyfoot[C]{\thepage}%
\renewcommand{\headrulewidth}{0pt}%
\renewcommand{\footrulewidth}{0pt}%
}
\pagestyle{plain}
