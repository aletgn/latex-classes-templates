%% uniudthesis.cls
%% Copyright 2024 Alessandro Tognan.
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
% This work consists of the file uniudthesis.cls.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uniudthesis}[2024/09/09 UniUD PhD Thesis]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrbook}}
\ProcessOptions\relax
\LoadClass{scrbook}

% KOMASCRIPT customisation
\KOMAoptions{headsepline=on}
%\KOMAoptions{appendixprefix=true}
\setkomafont{pageheadfoot}{\sffamily\bfseries}
\addtokomafont{pagenumber}{\small\sffamily\bfseries}
\setcounter{tocdepth}{\subsubsectiontocdepth}
\setcounter{secnumdepth}{\subsubsectionnumdepth}
\setlength{\footskip}{80pt}
\BeforeStartingTOC{\sffamily\renewcommand\familydefault{\sfdefault}}
\renewcommand{\partformat}{Part \thepart\enskip}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{indentfirst}
\RequirePackage{lmodern}
\RequirePackage[UKenglish]{babel}
\RequirePackage[left=2.5cm, right=3.5cm, bottom=5cm, top=5cm]{geometry}
%
\RequirePackage[singlespacing]{setspace}%onehalfspacing
\linespread{1.125}
\RequirePackage[colorlinks = true, linkcolor = blue, citecolor = blue, urlcolor = blue]{hyperref}
\RequirePackage{graphicx}
\RequirePackage{booktabs, makecell, rotating, multicol}
\RequirePackage{amsfonts, amsmath, amsthm, amssymb}
\RequirePackage{algorithm, algorithmicx, algpseudocode}
%
\RequirePackage{color}
\definecolor{uniblue}{RGB}{119,154,171}
\definecolor{uniorange}{RGB}{255,102,0}
\definecolor{unibrown}{RGB}{92,64,60}
\definecolor{unigrey}{RGB}{173,159,157}
%
\RequirePackage[font=sf, labelfont=bf, justification=justified, labelsep=period]{caption}
\setcapindent{0cm}
%
%\RequirePackage[a-1b]{pdfx} %pdf-a compliant
%
% Custom Commands
\newcommand{\strip}[1]{\noindent\emph{#1}}
\renewcommand*{\figureformat}{\small\figurename~\thefigure}
\renewcommand*{\tableformat}{\small\tablename~\thetable}
%
\raggedbottom
%
% bibliography -- biblatex
\RequirePackage[sorting=none, style=numeric, backend=biber, isbn=false, doi=true, natbib=true]{biblatex}
\DeclareFieldFormat[article]{title}{#1}
\DeclareFieldFormat[book]{title}{\textit{#1}}
%\AtEveryBibitem{\clearfield{day}\clearfield{month}\clearfield{endday}\clearfield{endmonth}\clearfield{pages}\clearfield{volume}\clearfield{abstract}}
\renewcommand*{\bibfont}{\footnotesize}
\newcommand{\references}{{\singlespacing \printbibliography[title = References]}}

% Data
\newcommand{\programme}[1]{\gdef\@programme{#1}}
\newcommand{\insertprogramme}{%
	\ifdefined\@programme
		\@programme
	\else
		No PhD programme provided
	\fi
}

\newcommand{\cycle}[1]{\gdef\@cycle{#1}}
\newcommand{\insertcycle}{%
	\ifdefined\@cycle
		\@cycle
	\else
		No PhD cycle provided (Roman Numbers)
	\fi
}

\newcommand{\defenseyear}[1]{\gdef\@defenseyear{#1}}
\newcommand{\insertdefenseyear}{%
	\ifdefined\@defenseyear
		\@defenseyear
	\else
		No year of the defense provided
	\fi
}

\newcommand{\inserttitle}{%
	\ifdefined\@title
		\@title
	\else
		No Title Provided
	\fi
}

\newcommand{\insertauthor}{%
	\ifdefined\@author
		\@author
	\else
		No Author Provided
	\fi
}

\newcommand{\supervisor}[1]{\gdef\@supervisor{#1}}
\newcommand{\insertsupervisor}{%
	\ifdefined\@supervisor
		\@supervisor
	\else
		No supervisor provided (Roman Numbers)
	\fi
}

\newcommand{\logo}[2][]{\gdef\@logo{#2}\gdef\@logooptions{#1}}
\newcommand{\insertlogo}{
	\ifdefined\@logo
		\includegraphics[width=\@logooptions\linewidth]{\@logo}%
	\else
		NO Logo Provided
	\fi
}

\newcommand{\abstract}[1]{\gdef\@abstract{#1}}
\newcommand{\makeabstract}{%
	\ifdefined\@abstract
		\chapter{Abstract}
			\noindent\@abstract
	\else
		No abstract provided
	\fi
}

% Frontispiece
\renewcommand*{\maketitle}{%
	\newgeometry{top=0.7cm, bottom=1cm, left=1.5cm, right=1.5cm}
	\begin{titlepage}
		\sffamily % remove this for serif font (as in the default setting)
		\noindent
		\begin{minipage}[t]{0.1\linewidth}
			\colorbox{unibrown}{\rule{\linewidth}{0pt}\rule{0pt}{0.3 cm}}
		\end{minipage}%
		\begin{minipage}[t]{0.3\linewidth}
			\colorbox{uniorange}{\rule{\linewidth}{0pt}\rule{0pt}{0.3 cm}}
		\end{minipage}%
		\begin{minipage}[t]{0.6\linewidth}
			\colorbox{uniblue}{\rule{\linewidth}{0pt}\rule{0pt}{0.3 cm}}
		\end{minipage}


		\begin{minipage}[t][1.2cm][c]{0.5\linewidth}
			\insertlogo
		\end{minipage}%
		\begin{minipage}[t][1.2cm][c]{0.5\linewidth}
			\raggedleft
			\href{www.uniud.it}{\texttt{\textcolor{unigrey}{www.uniud.it}}}
			\vspace{1cm}
		\end{minipage}%

		\vspace*{1.0cm}\centering
		\insertprogramme \\\vskip5pt \insertcycle\ CYCLE

		\vspace{6.5cm}\centering
		{\large \textbf{\inserttitle}}

		\vspace{7.5cm}
		\begin{minipage}[t]{0.5\linewidth}
			\textbf{PhD Candidate}\\
			\insertauthor
		\end{minipage}%
		\begin{minipage}[t]{0.5\linewidth}
			\raggedleft
			\textbf{Supervisor}\\
			\insertsupervisor
		\end{minipage}%

		\vfill\hrule\vskip8pt
		{\small \textbf{Year \insertdefenseyear}} % dissertation year
	\end{titlepage}
	\restoregeometry
}
