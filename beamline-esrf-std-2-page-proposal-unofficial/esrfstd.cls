%% esrfstd.cls
%% Copyright 2025 Alessandro Tognan.
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
% This work consists of the file esrfstd.cls.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{esrfstd}[2025/03/04 ESRF STD Beamline proposal]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions\relax
\LoadClass{scrartcl}

\RequirePackage[UKenglish]{babel}

\RequirePackage{fontspec}
\setmainfont{Times New Roman}
\setsansfont{Titillium Web}

%, bottom=1.3cm, top=2.25cm from word
\RequirePackage[papersize={21.59 cm, 27.94 cm}, left=1.5cm, right=1.34cm, bottom=4cm, top=2.25cm]{geometry}
\setlength{\parindent}{0pt}
\setlength{\footskip}{-45pt}

\RequirePackage{color}
\definecolor{esrfblue}{RGB}{0, 32, 96}

\RequirePackage{graphicx}
\RequirePackage{wrapfig}
\RequirePackage{booktabs}
\graphicspath{{./Title};}

\RequirePackage[font={sf, footnotesize}, labelfont=bf, justification=justified,labelsep=period, figurename=Fig.]{caption}
\RequirePackage[explicit]{titlesec}
\titleformat{\section}[block]{\sffamily\bfseries\fontsize{12pt}{0pt}\color{esrfblue}}{\thesection.}{1em}{#1:}
\titlespacing*{\section}{0pt}{2pt plus 0.5pt minus 0.5pt}{2pt plus 0.5pt minus 0.5pt}

\RequirePackage{fancyhdr}
\renewcommand{\headrulewidth}{0pt}
\pagestyle{fancy}
\fancyhf{}
\setlength{\headsep}{35pt} 
\fancyhead{\vskip-20pt\centering\includegraphics[width=\linewidth]{header}}
\fancyfoot[L]{%
	\noindent\makebox[\textwidth][c]{\sffamily \footnotesize \color{esrfblue}{Updated version: August 2024 - Page \thepage}}
	\noindent\makebox[\textwidth][c]{\includegraphics[width=\paperwidth]{footer}}
}


\title{Application for STD beamtime at ESRF – Project Description}
\author{}
\date{}

\renewcommand*{\maketitle}{%
%	\thispagestyle{empty}
	\begin{center}
		{\fontsize{16pt}{0pt}\sffamily \color{esrfblue} \textbf{Application for STD beamtime at ESRF – Project Description}}
	\end{center}
}

\RequirePackage{csquotes}
\RequirePackage[%minbibnames=1, maxbibnames=1, maxnames=1,
sorting=none, style=numeric-comp,backend=biber,url=false,isbn=false,doi=true]{biblatex}
\renewbibmacro*{in:}{}
\setlength\bibitemsep{.5pt}
\DeclareFieldFormat[thesis,article,inproceedings,misc,online,proceedings,techreport,report]{title}{\mkbibemph{#1},}
\DeclareFieldFormat[thesis,article,inproceedings,misc,online,proceedings,techreport,report]{booktitle}{#1,}
\DeclareFieldFormat[thesis,article,inproceedings,misc,online,proceedings,techreport,report]{journaltitle}{#1,}
\DeclareFieldFormat[thesis,article,inproceedings,misc,online,proceedings,techreport,report]{volume}{Vol. #1}
\DeclareFieldFormat[thesis,article,inproceedings,misc,online,proceedings,techreport,report]{number}{(#1), }
\DeclareFieldFormat[thesis,article,inproceedings,misc,online,proceedings,techreport,report]{pages}{#1}
\DeclareFieldFormat[thesis,article,inproceedings,misc,online,proceedings,techreport,report]{year}{#1}