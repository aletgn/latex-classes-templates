%% abs2p.cls
%% Copyright 2025 Alessandro Tognan
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   https://www.latex-project.org/lppl.txt
% and version 1.3c or later is part of all distributions of LaTeX
% version 2008 or later.
%
% This work has the LPPL maintenance status `maintained'.
% 
% The Current Maintainer of this work is Alessandro Tognan.
%
% This work consists of the file abs2p.cls.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{abs2p}[2025/02/05 2-page abstract submission]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions\relax
\LoadClass{scrartcl}

\RequirePackage[UKenglish]{babel}
\RequirePackage[top=2.5cm, bottom=2.5cm, left=2.25cm, right=2.25cm]{geometry}
% \usepackage{fancyhdr}
% \pagestyle{fancy}
% \renewcommand{\headrulewidth}{0pt}
% \fancyhf{}
% \fancyhead[L]{\thepage}

\makeatletter
\def\ps@headings{%
    \def\@oddhead{\thepage\hfil}
    \def\@evenhead{\thepage\hfil}
    \def\@oddfoot{}
    \def\@evenfoot{}
}
\pagestyle{headings}

\RequirePackage{booktabs}

\RequirePackage{amsmath, amssymb, amsthm}
\RequirePackage{fontspec}
\setmainfont{Times New Roman}
\setsansfont{Arial}

\RequirePackage{graphicx}
\RequirePackage[labelsep=period, justification=centering, figurename=Fig.]{caption}
\setcapindent{0pt}

\RequirePackage{url}
\RequirePackage{xspace}
\RequirePackage{indentfirst}

\RequirePackage{color}

\RequirePackage{csquotes}
\RequirePackage[%minbibnames=1, maxbibnames=1, maxnames=1,
sorting=none, style=numeric-comp,backend=biber,url=false,isbn=false,doi=true]{biblatex}
\renewcommand*{\bibfont}{\footnotesize}
\renewbibmacro*{in:}{}
\setlength\bibitemsep{.5pt}

\renewcommand*{\finalnamedelim}{\addcomma\space}
\renewcommand*{\labelnamepunct}{\addcomma\space}
\renewcommand*{\revsdnamepunct}{}


\DeclareNameAlias{author}{family-given}
\DeclareNameAlias{byeditor}{family-given}

% \DeclareFieldFormat[thesis,article,inproceedings,misc,online,proceedings,techreport,report]{author}{#1}
\DeclareFieldFormat[thesis,article,inproceedings,misc,online,proceedings,techreport,report]{title}{\mkbibemph{#1},}
\DeclareFieldFormat[thesis,article,inproceedings,misc,online,proceedings,techreport,report]{booktitle}{#1,}
\DeclareFieldFormat[thesis,article,inproceedings,misc,online,proceedings,techreport,report]{journaltitle}{#1,}
\DeclareFieldFormat[thesis,article,inproceedings,misc,online,proceedings,techreport,report]{volume}{Vol. #1}
\DeclareFieldFormat[thesis,article,inproceedings,misc,online,proceedings,techreport,report]{number}{(#1), }
\DeclareFieldFormat[thesis,article,inproceedings,misc,online,proceedings,techreport,report]{pages}{#1}
\DeclareFieldFormat[thesis,article,inproceedings,misc,online,proceedings,techreport,report]{year}{#1}

\DeclareFieldFormat[thesis]{type}{#1,}
\DeclareFieldFormat[inproceedings]{editor}{#1}

\renewbibmacro*{journal+issuetitle}{%
	\usebibmacro{journal}%
	\setunit*{\addcomma\space}%
	\printfield{year}%
	\setunit*{\addcomma\space}%
	\printfield{volume}%
	\printfield{number}%
	\setunit*{\addspace}%
%	\setunit*{\addcomma\space}%
%	\printfield{pages}%
}

\renewbibmacro*{byeditor+others}{%
  \setunit{\space}
  \ifnameundef{editor}
    {}
    {%\usebibmacro{byeditor+othersstrg}%
     \setunit{\addspace}%
     \printnames[byeditor]{editor}\space\printtext{(Eds.),}%
     \clearname{editor}%
     \newunit}%
  % \usebibmacro{byeditorx}%
  % \usebibmacro{bytranslator+others}%
  \printunit*{\newunitpunct}
  }


\renewbibmacro*{publisher+location+date}{%
	\printlist{location}%
	\setunit*{\addcomma\space}%
	\printlist{publisher}%
	\setunit*{\addcomma\space}%
	\printfield{year}%
}


\setlength\parindent{0.5cm}
\setkomafont{section}{\fontsize{11pt}{13pt}\sffamily}
\setkomafont{subsection}{\fontsize{11pt}{0pt}\sffamily}
\RedeclareSectionCommand[%
runin=false,%
afterindent=false,%
beforeskip=20pt,%
afterskip=5.0pt]{section}

\RedeclareSectionCommand[%
runin=false,%
afterindent=false,%
beforeskip=2.0pt,%
afterskip=2.0pt]{subsection}


\newcommand{\abstitle}[1]{\gdef\@abstitle{#1}}
\newcommand{\insertabstitle}{%
	\ifdefined\@abstitle
		\@abstitle
	\else
		TITLE OF ABSTRACT NOT PROVIDED
	\fi
}

\newcommand{\authors}[1]{\gdef\@authors{#1}}
\newcommand{\insertauthors}{%
		\ifdefined\@authors
		      \@authors
		\else
		      AUTHORS NOT PROVIDED
		\fi
	}

\newcommand{\affiliation}[1]{\gdef\@affiliation{#1}}
\newcommand{\insertaffiliation}{%
		\ifdefined\@affiliation
			\@affiliation
		\else
			AFFILIATIONS NOT PROVIDED
		\fi
	}
	
\newcommand{\contact}[1]{\gdef\@contact{#1}}
\newcommand{\insertcontact}{%
	\ifdefined\@contact
		\@contact
	\else
		CONTACT NOT PROVIDED
	\fi
}

\newcommand{\keywords}[1]{\gdef\@keywords{#1}}
\newcommand{\insertkeywords}{%
	\ifdefined\@keywords
		\@keywords
	\else
		KEYWORDS NOT PROVIDED
	\fi
}


\renewcommand*{\maketitle}{%
    \thispagestyle{empty}
    \begin{center}
        {\fontsize{14pt}{0pt} \sffamily \bfseries \insertabstitle}
    \end{center}
    \vskip30pt
    \fontsize{11pt}{0pt}{\insertauthors}\\
    \fontsize{9pt}{0pt}{\normalfont{\insertaffiliation}}
    \vskip15pt
    \noindent \fontsize{9pt}{0pt}{\textbf{Contact:} \normalfont{\insertcontact}}
    \vskip15pt
    \noindent\fontsize{9pt}{0pt}{\textbf{Keywords:} \normalfont{\insertkeywords}}
    \vskip15pt
}