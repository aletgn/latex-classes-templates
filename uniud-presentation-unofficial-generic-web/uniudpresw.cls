%% uniudpresw.cls
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
% This work consists of the file uniudpresw.cls.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uniudpresw}[2024/05/13 UniUD -- Unofficial Presentation Template (Web theme)]
% TODO minipages
% TODO renew columns to fit linewidth

% --- Class' options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax

% --- Load the beamer class
\LoadClass{beamer}

% --- Required Packages
\RequirePackage[utf8]{inputenc}
\RequirePackage[UKenglish]{babel}
\RequirePackage{booktabs}
\RequirePackage{graphicx}
\RequirePackage{amsmath, amsfonts, amsthm, mathrsfs}
\RequirePackage{pgfpages}
\RequirePackage{listings}
\RequirePackage{adjustbox}
\RequirePackage{setspace}
\RequirePackage[autostyle,italian=guillemets]{csquotes}
\RequirePackage[minbibnames=1, maxbibnames=1, maxnames=1, sorting=none, style=numeric,backend=biber,url=false,isbn=false,doi=false]{biblatex}

% --- UNIUD's colors (https://www.uniud.it/it/ateneo-uniud/ateneo-uniud/storia-ateneo/identita-visiva/manuale_dimmagine)
%\definecolor{uniblue}{RGB}{119,154,171}
%\definecolor{uniorange}{RGB}{255,102,0}
%\definecolor{unibrown}{RGB}{92,64,60}
%\definecolor{unigrey}{RGB}{173,159,157}
\setbeamercolor{headerbox1}{bg=blue}
\setbeamercolor{headerbox2}{bg=blue,fg=blue}
\setbeamercolor{headerbox3}{bg=blue}
\setbeamercolor{itemize item}{fg=blue}
\setbeamercolor{itemize subitem}{fg=blue}
\setbeamercolor{itemize subsubitem}{fg=blue}
\setbeamertemplate{itemize item}[triangle]
\setbeamertemplate{itemize subitem}[square]
\setbeamertemplate{itemize subsubitem}[circle]
\setbeamercolor{item projected}{bg=red,fg=white}
\setbeamertemplate{subsection in toc}[square]
\setbeamertemplate{section in toc}[sections numbered]
% \setbeamercolor{subsection number projected}{fg = green, bg=blue}
\setbeamercolor{subsection number projected}{bg=blue}
\setbeamercolor{section in toc}{fg=blue}
\setbeamerfont{section in toc}{series=\bfseries}
\setbeamercolor{subsection in toc}{fg=blue}

% --- Custom commands
\newcommand{\nskip}{\vskip 4pt \hrule	\vskip 4pt}
\newcommand{\brule}{{\color{black} \hrule\vskip 3pt}}
\newenvironment{fullcols}
{\begin{columns}[t, totalwidth=\linewidth]}
	{\end{columns}}


\newcommand{\coauthor}[1]{\gdef\@coauthor{#1}} %global var
\newcommand{\insertcoauthor}{%
	\ifdefined\@coauthor
	{\normalsize \color{black} \textbf{\@coauthor}}
	\else
		%
	\fi
}

\newcommand{\coauthorqual}[1]{\gdef\@coauthorqual{#1}} %global var
\newcommand{\insertcoauthorqual}{%
	\ifdefined\@coauthorqual
	{\normalsize\color{black} \@coauthorqual}
	\else
		%
	\fi
}


\newcommand{\authorqual}[1]{\gdef\@authorqual{#1}} %global var
\newcommand{\insertauthorqual}{%
	\ifdefined\@authorqual
		{\normalsize \color{black} \@authorqual}
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

\newcommand{\dept}[1]{\gdef\@dept{#1}}
\newcommand{\insertdept}{%
	\ifdefined\@dept
		\begin{center}
			{\small \color{blue} \@dept}
		\end{center}
	\else
		%
	\fi
}

\newcommand{\logolh}[2][]{
	\gdef\@logolh{#2}%
	\gdef\@logolhoptions{#1}
}
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
	{\setbeamertemplate{headline}{
		\leavevmode
		\hbox{%
			\begin{beamercolorbox}[wd=\paperwidth,ht=2.25ex,dp=1ex, center]{headerbox1}
			\end{beamercolorbox}%
			}
		
		\begin{center}
			\begin{minipage}[t]{\linewidth}
				\begin{minipage}{0.59\linewidth}
					\insertlogolh
				\end{minipage}
				\begin{minipage}{0.39\linewidth}
					\begin{flushright}
						\insertlogorh
					\end{flushright}
				\end{minipage}
				
				\insertdept
			\end{minipage}
		\end{center}
		
		}
		
		\setbeamertemplate{footline}{
			\leavevmode
			\hbox{%
			\begin{beamercolorbox}[wd=0.05\paperwidth,ht=2.25ex,dp=1ex,center]{bg=white}%
			\end{beamercolorbox}%
			\begin{beamercolorbox}[wd=0.9\paperwidth,ht=2.25ex,dp=1ex, center]{bg=white}
				\begin{minipage}[t]{0.9\paperwidth}
						\begin{minipage}[t]{0.499\linewidth}
								\begin{flushleft}
									\insertauthorqual\par
								\end{flushleft}
						\end{minipage}
						\begin{minipage}[t]{0.499\linewidth}
								\begin{flushright}
									\insertcoauthorqual
								\end{flushright}
						\end{minipage}
					\end{minipage}
					
					\begin{minipage}[t]{0.9\paperwidth}
						\begin{minipage}[t]{0.499\linewidth}
							\begin{flushleft}
								{\normalsize\color{black} \textbf{\insertauthor}}\par
							\end{flushleft}
						\end{minipage}
						\begin{minipage}[t]{0.499\linewidth}
							\begin{flushright}
								\insertcoauthor\par
							\end{flushright}
						\end{minipage}
					\end{minipage}
				\vskip 20pt
				\begin{center}
					\brule \centering {\color{black} {\scriptsize \textit{\insertevent} \par \vspace{2pt} \textit{\insertdate}}}
				\end{center}
			\end{beamercolorbox}%
			\begin{beamercolorbox}[wd=0.05\paperwidth,ht=2.25ex,dp=1ex, center]{bg=white}%
			\end{beamercolorbox}%
				}
		}
	
	\begin{frame}[noframenumbering]{}		
		\begin{center}
			\vskip 25pt
			{\color{black}\textbf{\inserttitle}}
		\end{center}
		\note{\insertintronotes}

	\end{frame}
	}
}

% --- Frame title
\setbeamercolor{frametitle}{use=structure,fg=blue}
\setbeamerfont{frametitle}{series=\bfseries}
\setbeamertemplate{frametitle}{\vskip-1pt\insertframetitle\vskip2pt}%\hrule
% --- Blocks
\setbeamercolor{block title}{use=structure, fg=white,bg=blue}
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
\setbeamertemplate{footline}{
	\leavevmode
	\hbox{
		\begin{beamercolorbox}[wd=0.1\paperwidth,ht=2.25ex,dp=1ex,center]{bg=white}%
		\end{beamercolorbox}%
		\begin{beamercolorbox}[wd=0.8\paperwidth,ht=2.25ex,dp=1ex, center]{bg=white}
		\end{beamercolorbox}%
		\begin{beamercolorbox}[wd=0.1\paperwidth,ht=2.25ex,dp=1ex, center]{bg=white}%
			{\color{blue}\insertframenumber{} / \inserttotalframenumber}
		\end{beamercolorbox}%
	}
}

% --- Contents
\AtBeginSection[]{{\setbeamertemplate{footline}{}
		\begin{frame}[noframenumbering]{Contents}
			\small
			\tableofcontents[sections={1-},sectionstyle=show/shaded,subsectionstyle=show/shaded/hide]
\end{frame}}}

\endinput
