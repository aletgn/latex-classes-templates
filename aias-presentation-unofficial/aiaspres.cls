%% aiaspres.cls
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
% This work consists of the file aiaspres.cls.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{aiaspres}[2024/05/13 AIAS -- Unofficial Presentation Template]

% --- Class' options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax

% --- Load the beamer class
\LoadClass{beamer}

% --- Required Packages
\RequirePackage[utf8]{inputenc}
\RequirePackage[english]{babel}
\RequirePackage{booktabs}
\RequirePackage{graphicx}
\RequirePackage{amsmath, amsfonts, amsthm, mathrsfs}
\RequirePackage{pgfpages}
\RequirePackage{listings}
\RequirePackage{adjustbox}
\RequirePackage{setspace}
\RequirePackage[autostyle,italian=guillemets]{csquotes}
\RequirePackage[minbibnames=1, maxbibnames=1, maxnames=1, sorting=none, style=numeric,backend=biber,url=false,isbn=false,doi=false]{biblatex}

\definecolor{aias}{RGB}{118,50,63}
\setbeamercolor{itemize item}{fg=aias}
\setbeamercolor{itemize subitem}{fg=aias}
\setbeamercolor{itemize subsubitem}{fg=aias}
\setbeamertemplate{itemize item}[circle]
\setbeamertemplate{itemize subitem}[square]
\setbeamertemplate{itemize subsubitem}[triangle]
\setbeamercolor{item projected}{bg=aias,fg=white}
\setbeamertemplate{subsection in toc}[square]
\setbeamertemplate{section in toc}[sections numbered]
\setbeamercolor{section in toc}{bg=white,fg=aias} 
\setbeamercolor{subsection number projected}{fg=aias}

% --- Custom commands
\newcommand{\nskip}{\vskip 4pt \hrule	\vskip 4pt}
\newcommand{\trule}{{\color{aias} \rule[20pt]{\linewidth}{0.1pt}\vskip 3pt}}
\newcommand{\brule}{{\color{aias} \rule[0pt]{\linewidth}{0.1pt}\vskip 3pt}}


\newcommand{\coauthor}[1]{\gdef\@coauthor{#1}} %global var
\newcommand{\insertcoauthor}{%
	\ifdefined\@coauthor
	{\normalsize \color{white} \@coauthor}
	\else
		%
	\fi
}

\newcommand{\intronote}[1]{\gdef\@intronote{#1}} %global var
\newcommand{\insertintronotes}{%
	\ifdefined\@intronote
		\@intronote%
	\else
		(No intro note provided)%
	\fi
}

\newcommand{\event}[1]{\gdef\@event{#1}}
\newcommand{\insertevent}{%
	\ifdefined\@event
		\@event
	\else
		%
	\fi
}

\newcommand{\loc}[1]{\gdef\@loc{#1}}
\newcommand{\insertloc}{%
	\ifdefined\@loc
		\@loc
	\else
		%
	\fi
}

\newcommand{\dept}[1]{\gdef\@dept{#1}}
\newcommand{\insertdept}{%
	\ifdefined\@dept
		\@dept
	\else
		%
	\fi
}

\newcommand{\logolh}[2][]{
	\gdef\@logolh{#2}%
	\gdef\@logolhoptions{#1}
}
%\titlegraphic{\includegraphics[scale=\@logolhoptions]{\@logolh}}%
\newcommand{\insertlogolh}{
	\ifdefined\@logolh
		\includegraphics[scale=\@logolhoptions]{\@logolh}%
	\else
	%
	\fi
}

\newcommand{\logorh}[2][]{
	\gdef\@logorh{#2}%
	\gdef\@logorhoptions{#1}
}

\newcommand{\insertlogorh}{
	\ifdefined\@logorh
		\includegraphics[scale=\@logorhoptions]{\@logorh}%
	\else
		%
	\fi
}

\setbeamertemplate{navigation symbols}{}
\setbeamersize{text margin left=5mm,text margin right=5mm}

\renewcommand*{\maketitle}{%
	{
		\setbeamertemplate{headline}{\vskip 20pt
			\leavevmode
			\hbox{\hspace{15pt}%
				\begin{beamercolorbox}[wd=0.2\paperwidth, ht=15ex, dp=1ex, left]{}
					\insertlogolh\par
%					\inserttitlegraphic\par
				\end{beamercolorbox}%
				\begin{beamercolorbox}[wd=0.8\paperwidth, ht=2.25ex,dp=1ex, left]{}
				\end{beamercolorbox}%
				}
			}
			
		\setbeamertemplate{footline}{
			\leavevmode
			\hbox{%
				\begin{beamercolorbox}[wd=\paperwidth, ht=1ex, dp=2ex, center]{}
					{\color{white} \footnotesize \insertevent\ \textbar\ \insertdate\ \textbar\ \insertloc}
				\end{beamercolorbox}
			}
		}
		
		\setbeamercolor{background canvas}{bg=aias}%
		\begin{frame}[noframenumbering, b]{}
			\leavevmode
			\hbox{\hspace{15pt}%
			\begin{beamercolorbox}[wd=\paperwidth, ht=1ex, dp=10ex, left]{}
				\LARGE\color{white}\textbf{\inserttitle}\par
				\normalsize\color{white}\insertauthor, \insertcoauthor\par
				\small\color{white}\insertdept\par
			\end{beamercolorbox}%
			}
		\note{\insertintronotes}
		\end{frame}
	}
}

% --- Frame title
\setbeamercolor{frametitle}{use=structure,fg=aias}
\setbeamertemplate{frametitle}{\vskip1pt\insertframetitle\hfill\insertlogorh\vskip2pt\trule}

% --- Blocks
\setbeamercolor{block title}{use=structure, fg=white, bg=aias}
\setbeamerfont{block title}{size=\normalsize, series=\bfseries}
\setbeamertemplate{block begin}{%
	\vspace*{1ex}
	\begin{beamercolorbox}[ht=2.4ex,dp=1ex,leftskip=0.5em,rightskip=0.5em]{block title}
		\usebeamerfont*{block title}\insertblocktitle
	\end{beamercolorbox}%
	\vspace*{0.5em}
	\usebeamerfont{block body}%
	\begin{beamercolorbox}[%
		dp=1ex,
		leftskip=0.5em,
		rightskip=0.5em,
		vmode]{block body}%
	}
	
% --- Footline
%\dimexpr\paperwidth-15pt\relax
\setbeamertemplate{footline}{%
	\begin{center}
		\brule
	\end{center}
	\leavevmode
	\hbox{
		\begin{beamercolorbox}[wd=0.1\paperwidth,ht=2.25ex,dp=2ex,center]{}
		\end{beamercolorbox}
		\begin{beamercolorbox}[wd=0.8\paperwidth,ht=2.25ex,dp=2ex, center]{}
			\color{aias}\footnotesize \insertevent\ \textbar\ \insertdate\ \textbar\ \insertloc
		\end{beamercolorbox}%
		\begin{beamercolorbox}[wd=0.1\paperwidth,ht=2.25ex,dp=2ex, center]{}
			{\color{aias}\insertframenumber{} / \inserttotalframenumber}
		\end{beamercolorbox}%
	}
}

\newenvironment{fullcols}
{\begin{columns}[t, totalwidth=\linewidth]}
	{\end{columns}}


% --- Contents
\AtBeginSection[]{{\setbeamertemplate{footline}{}
		\begin{frame}[noframenumbering]{Contents}
			\small
			\tableofcontents[sections={1-},sectionstyle=show/shaded,subsectionstyle=show/shaded/hide]
\end{frame}}}

\endinput