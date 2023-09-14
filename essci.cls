%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                             essci.cls
%
% LaTeX class for papers conforming to the United States Sections of
% the Combustion Institute style guide.
%
% Authors:
%     Bryan W. Weber, University of Connecticut
%     Kyle E. Niemeyer, Oregon State University
%  Template slightly modified for ESSCI meetings by:
%     Perrine Pepiot, Cornell University
%     Richard West, Northeastern University
%
% Unofficial USSCI LaTeX Template by Bryan Weber and Kyle Niemeyer is
% marked with CC0 1.0 Universal. To view a copy of this license, visit
% http://creativecommons.org/publicdomain/zero/1.0
%
% The source for this template can be found at
% https://github.com/pr-omethe-us/ussci-latex-template
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{essci}[2023/09/13 v2.0.1-essci
 LaTeX document class for the ESSCI Technical Meetings]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions \relax

\LoadClass{article}

\RequirePackage{calc}

%Set up biblatex
\usepackage[
    backend=biber,
    doi=true,
    sorting=none,
    sortcites=true,
    maxbibnames=99,
    minbibnames=99,
    maxcitenames=2,
    mincitenames=1,
    citestyle=numeric-comp,
    giveninits=true,
    isbn=false,
    date=year
]{biblatex}

% Load the Times New Roman font clone
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{mathptmx}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Redefine \maketitle to produce the typical ESSCI paper header
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@maketitle{%
    \newpage%
    \begin{center}%
    {%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % These lines should be edited before the new conference
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Spring Technical Meeting \\%
    Eastern States Section of the Combustion Institute\\%
    March 10-13, 2024\\%
    Athens, Georgia\par\vspace{\baselineskip}%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % End editing section
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
\titleformat{\subsection}{\normalfont\bfseries}{\thesubsection\space}{\z@}{}
\titleformat{\subsubsection}{\normalfont\bfseries}{\thesubsubsection\space}{\z@}{}

\RequirePackage{authblk}
\renewcommand\Authfont{\fontsize{14pt}{16.8pt}\selectfont\itshape}
\renewcommand\Affilfont{\fontsize{12pt}{14.4pt}\selectfont\itshape}

\RequirePackage{hyperref}
\urlstyle{tt}
\newcommand{\email}[1]{\href{mailto:#1}{\tt{\nolinkurl{#1}}}}

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definition of Bibliography Styles
%
% These are set to match the Combustion and Flame style as closely as
% possible.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                              @article
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareBibliographyDriver{article}{%
  \usebibmacro{bibindex}%
  \usebibmacro{begentry}%
  \usebibmacro{author/translator+others}%
  \newunit\newblock%
  \usebibmacro{title}%
  \newunit%
  \usebibmacro{journal}%
  \setunit*{\addspace}%
  \printfield{volume}%
  \setunit*{\addspace}%
  \printtext[parens]{\usebibmacro{date}}%
  \iffieldundef{pages}{%
    \setunit*{\addcomma\space}%
    }{\setunit*{\addspace}}
  \printfield{pages}%
  \setunit*{\adddot\space}%
  \usebibmacro{doi+eprint+url}%
  \usebibmacro{finentry}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                              @incollection
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareBibliographyDriver{incollection}{%
  \usebibmacro{bibindex}%
  \usebibmacro{begentry}%
  \usebibmacro{author/translator+others}%
  \setunit{\labelnamepunct}\newblock
  \usebibmacro{title}%
  \newunit
  \printlist{language}%
  \newunit\newblock
  \usebibmacro{byauthor}%
  \newunit\newblock
  \usebibmacro{in:}%
  \usebibmacro{byeditor:in}%
  \setunit{\labelnamepunct}\newblock%
  \usebibmacro{maintitle+booktitle}%
  \newunit\newblock
  \usebibmacro{byeditor}%
  \newunit\newblock
  \printfield{edition}%
  \newunit
  \iffieldundef{maintitle}
    {\printfield{volume}%
     \printfield{part}}
    {}%
  \newunit
  \printfield{volumes}%
  \newunit\newblock
  \usebibmacro{series+number}%
  \newunit\newblock
  \printfield{note}%
  \newunit\newblock
  \usebibmacro{publisher+location+date}%
  \newunit\newblock
  \usebibmacro{chapter+pages}%
  \newunit\newblock
  \iftoggle{bbx:isbn}
    {\printfield{isbn}}
    {}%
  \newunit\newblock
  \usebibmacro{doi+eprint+url}%
  \newunit\newblock
  \usebibmacro{addendum+pubstate}%
  \setunit{\bibpagerefpunct}\newblock
  \usebibmacro{pageref}%
  \newunit\newblock
  \iftoggle{bbx:related}
    {\usebibmacro{related:init}%
     \usebibmacro{related}}
    {}%
  \usebibmacro{finentry}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                              @inproceedings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareBibliographyDriver{inproceedings}{%
  \usebibmacro{bibindex}%
  \usebibmacro{begentry}%
  \usebibmacro{author/translator+others}%
  \setunit{\labelnamepunct}\newblock
  \usebibmacro{title}%
  \newunit
  \printlist{language}%
  \newunit\newblock
  \usebibmacro{byauthor}%
  \newunit\newblock
  \printfield{booktitle}%
  \setunit*{\addspace}
  \usebibmacro{publisher+location+pdate}%
  \newunit\newblock
  \printfield{note}%
  \newunit\newblock
  \usebibmacro{chapter+pages}%
  \newunit\newblock
  \iftoggle{bbx:isbn}
    {\printfield{isbn}}
    {}%
  \newunit\newblock
  \usebibmacro{doi+eprint+url}%
  \newunit\newblock
  \usebibmacro{addendum+pubstate}%
  \setunit{\bibpagerefpunct}\newblock
  \usebibmacro{pageref}%
  \newunit\newblock
  \iftoggle{bbx:related}
    {\usebibmacro{related:init}%
     \usebibmacro{related}}
    {}%
  \usebibmacro{finentry}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                              @software
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareBibliographyDriver{software}{%
  \usebibmacro{bibindex}%
  \usebibmacro{begentry}%
  \usebibmacro{author/translator+others}%
  \setunit{\labelnamepunct}\newblock
  \usebibmacro{title}%
  \newunit
  \printfield{howpublished}
  \newunit\newblock
  \printfield{type}
  \newunit
  \printfield{version}
  \newunit
  \printfield{note}
  \newunit\newblock
  \usebibmacro{organization+location+date}%
  \newunit\newblock
  \usebibmacro{doi+url+software}%
  \newunit\newblock
  \usebibmacro{addendum+pubstate}%
  \setunit{\bibpagerefpunct}\newblock
  \usebibmacro{pageref}%
  \newunit\newblock
  \iftoggle{bbx:related}
    {\usebibmacro{related:init}%
     \usebibmacro{related}}
    {}%
  \usebibmacro{finentry}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                              @report
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareBibliographyDriver{report}{%
  \usebibmacro{bibindex}%
  \usebibmacro{begentry}%
  \usebibmacro{author}%
  \setunit{\labelnamepunct}\newblock
  \usebibmacro{title}%
  \newunit
  \printlist{language}%
  \newunit\newblock
  \usebibmacro{byauthor}%
  \newunit\newblock
  \printfield{type}%
  \setunit*{\addspace}%
  \usebibmacro{report+number}%
  \newunit\newblock
  \printfield{version}%
  \newunit
  \printfield{note}%
  \newunit\newblock
  \usebibmacro{institution+location+date}%
  \newunit\newblock
  \usebibmacro{chapter+pages}%
  \newunit
  \printfield{pagetotal}%
  \newunit\newblock
  \iftoggle{bbx:isbn}
    {\printfield{isrn}}
    {}%
  \newunit\newblock
  \usebibmacro{doi+eprint+url}%
  \newunit\newblock
  \usebibmacro{addendum+pubstate}%
  \setunit{\bibpagerefpunct}\newblock
  \usebibmacro{pageref}%
  \newunit\newblock
  \iftoggle{bbx:related}
    {\usebibmacro{related:init}%
     \usebibmacro{related}}
    {}%
  \usebibmacro{finentry}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         Other Definitions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Define a new string for Report Numbers
\NewBibliographyString{report-number}
\DefineBibliographyStrings{english}{
  report-number = {Report No\adddot\space}
}

% Define a macro to print the string and report number
\newbibmacro*{report+number}{%
  \printtext{\bibstring{report-number}}
  \printfield{number}
}

% Reformat the editor field of edited books to match CNF
% Should look like E. Editor (Ed.) or E. Editor, E. Editor (Eds.)
\DeclareNameAlias{editorin}{given-family}
\newbibmacro*{byeditor:in}{%
  \ifnameundef{editor}{}{\printnames[editorin]{editor}%
  \addspace\bibsentence%
  \mkbibparens{\usebibmacro{editorstrg}}%
  \clearname{editor}%
  \printunit{\addcomma\space}}
}

% Make sure that URL is not printed if DOI is available
\renewbibmacro*{doi+eprint+url}{%
  \iftoggle{bbx:doi}
  {\iffieldundef{url}{\printfield{doi}}{\iffieldundef{doi}{}{\printfield{doi}}}}
  {}%
  \newunit\newblock
  \iftoggle{bbx:eprint}
  {\usebibmacro{eprint}}
  {}%
  \newunit\newblock
  \iftoggle{bbx:url}
  {\iffieldundef{doi}{\usebibmacro{url+urldate}}{}}
  {}
}

% New macro for @software to print both URL and DOI
\newbibmacro*{doi+url+software}{%
  \iftoggle{bbx:doi}
  {\printfield{doi}}{}%
  \newunit\newblock
  \iftoggle{bbx:url}
  {\usebibmacro{url+urldate}}{}%
}

% New macro for publisher+location+parentheses around date
% For @inproceedings
\newbibmacro*{publisher+location+pdate}{%
  \printlist{publisher}%
  \setunit*{\addcomma\space}%
  \printlist{location}%
  \setunit*{\addcomma\space}%
  \printtext[parens]{\usebibmacro{date}}%
  \newunit}

% Reorder publisher and location
% For @book and @incollection
\renewbibmacro*{publisher+location+date}{%
  \printlist{publisher}%
  \setunit*{\addcomma\space}%
  \printlist{location}%
  \setunit*{\addcomma\space}%
  \usebibmacro{date}%
  \newunit}

% Change the separator between bibliography "units" to comma
\renewcommand*{\newunitpunct}{\addcomma\space}

%Change the name of the bibliography section to "References"
\DefineBibliographyStrings{english}{bibliography = {References}}

% Print the article/book title in plain font without quotes
\DeclareFieldFormat[article,book,inproceedings,incollection,thesis,software,report]{title}{#1}
\DeclareFieldFormat{booktitle}{#1}

% Print the journal title in upright font
\DeclareFieldFormat{journaltitle}{#1}

% remove pp. from pages
\DeclareFieldFormat[article]{pages}{#1}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% End bibliography formatting section
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
