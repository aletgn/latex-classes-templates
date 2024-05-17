%% aiasaward.cls
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
% This work consists of the file aiasaward.cls.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{aiasaward}[2024/07/03 Candidature for AIAS Award]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions\relax
\LoadClass{scrartcl}

\RequirePackage[italian]{babel}
\RequirePackage[top=2.5cm, bottom=2.5cm, left=2.5cm, right=2.5cm]{geometry}

\RequirePackage{makecell}
\RequirePackage{booktabs}

\RequirePackage[fleqn]{amsmath}
\setlength{\mathindent}{0pt}

\RequirePackage{fontspec}
\setmainfont{Times New Roman}
\setsansfont{Arial}

\RequirePackage{graphicx}
\RequirePackage[labelsep=period, justification=justified]{caption}
\setcapindent{0pt}

\RequirePackage{url}
\RequirePackage{xspace}

\RequirePackage[%minbibnames=1, maxbibnames=1, maxnames=1,
sorting=none, style=numeric-comp,backend=biber,url=false,isbn=false,doi=true]{biblatex}

\setlength\parindent{0pt}
\setkomafont{section}{\fontsize{10pt}{10pt}\sffamily}
\setkomafont{subsection}{\fontsize{10pt}{10pt}\sffamily}

\RequirePackage{fancyhdr}
\fancypagestyle{aiasheader}{%
	\fancyhf{}
	\chead{\fontsize{9pt}{9pt}\sffamily 53° CONVEGNO NAZIONALE 4-7 SETTEMBRE 2024}
}

\newcommand{\sommario}[1]{\gdef\@sommario{#1}}
\newcommand{\insertsommario}{%
	{\fontsize{10pt}{10pt} \sffamily \textbf{Sommario}}\\
	\ifdefined\@sommario
	{\fontsize{11pt}{11pt} \@sommario}
	\else
	SOMMARIO ITA non definito
	\fi
}

\newcommand{\summary}[1]{\gdef\@summary{#1}}
\newcommand{\insertsummary}{%
	{\fontsize{10pt}{10pt} \sffamily \textbf{Abstract}}\\
	\ifdefined\@summary
	{\fontsize{11pt}{11pt} \@summary}
	\else
	ABSTRACT ENG not provided
	\fi
}

\newcommand{\keywords}[1]{\gdef\@keywords{#1}}
\newcommand{\insertkeywords}{%
	\ifdefined\@keywords
	\noindent{\fontsize{11pt}{11pt} \textbf{Parole chiave}: \@keywords}
	\else
	\noindent{\fontsize{11pt}{11pt} \textbf{Parole chiave}: non definite}
	\fi
}

\newcommand{\aiasno}[1]{\gdef\@aiasno{#1}}
\newcommand{\insertaiasno}{%
	\ifdefined\@aiasno
	\@aiasno
	\else
	xxx%
	\fi
}

\newcommand{\aiasdates}[1]{\gdef\@aiasdates{#1}}
\newcommand{\insertaiasdates}{%
	\ifdefined\@aiasdates
	\@aiasdates
	\else
	dd-dd%
	\fi
}

\newcommand{\aiasmonth}[1]{\gdef\@aiasmonth{#1}}
\newcommand{\insertaiasmonth}{%
	\ifdefined\@aiasmonth
	\@aiasmonth
	\else
	MMMMMM%
	\fi
}

\newcommand{\aiasyear}[1]{\gdef\@aiasyear{#1}}
\newcommand{\insertaiasyear}{%
	\ifdefined\@aiasyear
	\@aiasyear
	\else
	MMMMMM%
	\fi
}

\newcommand{\aiasid}[1]{\gdef\@aiasid{#1}}
\newcommand{\insertaiasid}{%
	\ifdefined\@aiasid
	\@aiasid
	\else
	MMMMMM%
	\fi
}

\newcommand{\aiastitle}[1]{\gdef\@aiastitle{#1}}
\newcommand{\insertaiastitle}{%
	\ifdefined\@aiastitle
	\@aiastitle
	\else
	TITOLO NON DEFINITO%
	\fi
}

\newcommand{\authors}[1]{\gdef\@authors{#1}}
\newcommand{\insertauthors}{%
	\ifdefined\@authors
	\@authors
	\else
	Lista autori
	\fi
}

\newcommand{\affiliation}[1]{\gdef\@affiliation{#1}}
\newcommand{\insertaffiliation}{%
	\ifdefined\@affiliation
	\@affiliation
	\else
	Lista affiliazione
	\fi
}

\renewcommand*{\maketitle}{%
	\thispagestyle{empty}
	\begin{center}
		{\fontsize{10pt}{10pt} \sffamily \textbf{AIAS -- ASSOCIAZIONE ITALIANA PER L’ANALISI DELLE SOLLECITAZIONI}\vskip5pt\textbf{\insertaiasno° CONVEGNO NAZIONALE, \insertaiasdates\xspace \insertaiasmonth\xspace \insertaiasyear}}
	\end{center}
	\begin{flushright}
		{\sffamily\fontsize{14pt}{14pt}\textbf{AIAS \insertaiasyear\ --\ \insertaiasid}}
	\end{flushright}
	~\\
	\begin{center}
		{\fontsize{14pt}{14pt} \sffamily \textbf{\insertaiastitle}}\\~\\
		{\sffamily\fontsize{12pt}{12pt}\insertauthors}
	\end{center}
	\begin{flushleft}
		{\fontsize{11pt}{11pt}\emph{\insertaffiliation}}
	\end{flushleft}
	~\\~\\
	\insertsommario
	\\~\\
	\insertsummary
	\\~\\
	\insertkeywords
	~\\
	\pagestyle{aiasheader}
}