%% uniudphd.cls
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
% This work consists of the file uniudphd.cls.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uniudphd}[2024/05/13 UniUD -- Unofficial Presentation Template]
% TODO minipages
% TODO renew columns to fit linewidth
% TODO if logo research group -> minipage title and picture

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

% --- UNIUD's colors (https://www.uniud.it/it/ateneo-uniud/ateneo-uniud/storia-ateneo/identita-visiva/manuale_dimmagine)
\definecolor{uniblue}{RGB}{119,154,171}
\definecolor{uniorange}{RGB}{255,102,0}
\definecolor{unibrown}{RGB}{92,64,60}
\definecolor{unigrey}{RGB}{173,159,157}
\setbeamercolor{headerbox1}{bg=unibrown}
\setbeamercolor{headerbox2}{bg=uniorange,fg=white}
\setbeamercolor{headerbox3}{bg=uniblue, fg = white}
\setbeamercolor{itemize item}{fg=uniorange}
\setbeamercolor{itemize subitem}{fg=uniorange}
\setbeamercolor{itemize subsubitem}{fg=uniorange}
\setbeamertemplate{itemize item}[circle]
%\setbeamertemplate{itemize subitem}[square]
%\setbeamertemplate{itemize subsubitem}[circle]
\setbeamercolor{item projected}{bg=red,fg=white}
\setbeamertemplate{subsection in toc}[square]
\setbeamertemplate{section in toc}[sections numbered]
% \setbeamercolor{subsection number projected}{fg = green, bg=uniorange}
\setbeamercolor{subsection number projected}{bg=uniorange}
\setbeamercolor{section in toc}{fg=black}
\setbeamerfont{section in toc}{series=\bfseries}
\setbeamercolor{subsection in toc}{fg=black}

% --- Custom commands
\newcommand{\nskip}{\vskip 4pt \hrule	\vskip 4pt}
\newcommand{\brule}{{\color{unibrown} \hrule\vskip 3pt}}


\newcommand{\coauthor}[1]{\gdef\@coauthor{#1}} %global var
\newcommand{\insertcoauthor}{%
	\ifdefined\@coauthor
	{\normalsize \color{unibrown} \textbf{\@coauthor}}
	\else
		%
	\fi
}

\newcommand{\coauthorqual}[1]{\gdef\@coauthorqual{#1}} %global var
\newcommand{\insertcoauthorqual}{%
	\ifdefined\@coauthorqual
	{\normalsize\color{unibrown} \@coauthorqual}
	\else
		%
	\fi
}


\newcommand{\authorqual}[1]{\gdef\@authorqual{#1}} %global var
\newcommand{\insertauthorqual}{%
	\ifdefined\@authorqual
		{\normalsize \color{unibrown} \@authorqual}
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

\newcommand{\univ}[1]{\gdef\@univ{#1}}
\newcommand{\insertuniv}{%
	\ifdefined\@univ
		\begin{center}
			\vskip 3pt
			{\fontsize{7pt}{8pt}\textbf{\@univ}}
		\end{center}
	\else
		%
	\fi
}

\newcommand{\web}[1]{\gdef\@web{#1}}
\newcommand{\insertweb}{%
	\ifdefined\@web
		\begin{center}
			\vskip -12pt
			{\fontsize{7pt}{8pt}\textbf{\@web}}
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

\newcommand{\logorg}[2][]{
	\gdef\@logorg{#2}%
	\gdef\@logorgoptions{#1}
}

\newcommand{\insertlogorg}{
	\ifdefined\@logorg
		\includegraphics[scale=\@logorgoptions]{\@logorg}%
	\else
		%
	\fi
}

\newcommand{\pic}[2][]{
	\gdef\@pic{#2}%
	\gdef\@picoptions{#1}
}

\newcommand{\insertpic}{
	\ifdefined\@pic
		\includegraphics[scale=\@picoptions]{\@pic}%
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
			\begin{beamercolorbox}[wd=0.1\paperwidth,ht=2.25ex,dp=2.5ex, center]{headerbox1}
				\begin{minipage}[center]{\linewidth}
					\vskip 4pt
					\begin{figure}
						\centering
						\insertlogolh
					\end{figure}
				\end{minipage}
			\end{beamercolorbox}%
			\begin{beamercolorbox}[wd=0.8\paperwidth,ht=2.25ex,dp=2.5ex, center]{headerbox2}
				\begin{minipage}[center]{\linewidth}
					\insertuniv
				\end{minipage}
			\end{beamercolorbox}%
			\begin{beamercolorbox}[wd=0.1\paperwidth,ht=2.25ex,dp=2.5ex, center]{headerbox3}
				\begin{minipage}[center]{\linewidth}
					\vskip 4pt
					\centering
					{\fontsize{7pt}{8pt}\textbf{\insertweb}}
				\end{minipage}
		\end{beamercolorbox}
			}
			
		\begin{center}
			\ifdefined\@logorg
				\begin{minipage}[t]{\linewidth}
						\begin{minipage}{0.1\linewidth}
							\insertlogorg
						\end{minipage}
						\begin{minipage}{0.89\linewidth}
							\begin{center}
								\centering
								{\color{uniblue} \huge \textbf{\inserttitle}}
							\end{center}
						\end{minipage}
				\end{minipage}
				
			\else
				{\color{uniblue} \huge \textbf{\inserttitle}}
			\fi
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
								{\normalsize\color{unibrown} \textbf{\insertauthor}}\par
							\end{flushleft}
						\end{minipage}
						\begin{minipage}[t]{0.499\linewidth}
							\begin{flushright}
								\insertcoauthor\par
							\end{flushright}
						\end{minipage}
					\end{minipage}
				\vskip 10pt
				\begin{center}
					\centering {\color{unibrown} \normalsize \insertdate}
				\end{center}
			\end{beamercolorbox}%
			\begin{beamercolorbox}[wd=0.05\paperwidth,ht=2.25ex,dp=1ex, center]{bg=white}%
			\end{beamercolorbox}%
				}
		}
	
	\begin{frame}[noframenumbering]{}		
		\begin{center}
			\vskip 25pt
			\centering \insertpic
		\end{center}
		\note{\insertintronotes}
	\end{frame}
	
	}
	
	{\setbeamertemplate{footline}{}
		\begin{frame}[noframenumbering]{Contents}
			\tableofcontents[sections={1-},sectionstyle=show/show,subsectionstyle=show/show/show]
		\end{frame}}
}

% --- Frame title
\setbeamercolor{frametitle}{use=structure,fg=unibrown}
\setbeamerfont{frametitle}{series=\bfseries}
\setbeamertemplate{frametitle}{\centering\vskip-1pt{\color{uniblue}\textbf{\insertframetitle}}\vskip2pt}%\hrule
% --- Blocks
\setbeamercolor{block title}{use=structure, fg=black,bg=unigrey}
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
			{\color{black}\insertframenumber{} / \inserttotalframenumber}
		\end{beamercolorbox}%
	}
}

% --- Contents
\AtBeginSection[]{
	{\setbeamertemplate{footline}{}
		\begin{frame}[noframenumbering]{Contents}
			\tableofcontents[sections={1-},sectionstyle=show/shaded,subsectionstyle=show/shaded/hide]
		\end{frame}
	}
}

\endinput