%% uniudpresw.cls
%% Copyright 2026 Alessandro Tognan.
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
% This work consists of the file uniudprestkz.cls.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uniudprestkz}[2026/01/07 UniUD -- Unofficial Presentation Template (Web theme, Tikz)]

% --- Class' options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax

% --- Load the beamer class
\LoadClass{beamer}

% --- Required Packages
\RequirePackage{lmodern}
\RequirePackage{tikz}
\RequirePackage[utf8]{inputenc}
\RequirePackage[UKenglish]{babel}
\RequirePackage{booktabs}
\RequirePackage{graphicx}
\RequirePackage{amsmath, amsfonts, amsthm, mathrsfs}
\RequirePackage{listings}
\RequirePackage{adjustbox}
\RequirePackage{setspace}
\RequirePackage[autostyle,italian=guillemets]{csquotes}
\RequirePackage[minbibnames=1, maxbibnames=1, maxnames=1, sorting=none, style=numeric,backend=biber,url=false,isbn=false,doi=false]{biblatex}
\RequirePackage{pgfpages}
\setbeamercolor{note page}{bg=white, fg=black}
\setbeamercolor{note title}{bg=gray!5, fg=gray!5}
\setbeamerfont{note page}{size=\small}

% --- UNIUD's colors (https://www.uniud.it/it/ateneo-uniud/ateneo-uniud/storia-ateneo/identita-visiva/manuale_dimmagine)
\definecolor{uniudblue}{RGB}{0,0,255}
\definecolor{uniudgrey}{RGB}{179,182,183}


\setbeamertemplate{navigation symbols}{}
\setbeamersize{text margin left=0.05\paperwidth,text margin right=0.05\paperwidth}
%\setbeamercolor{headerbox1}{bg=blue}
%\setbeamercolor{headerbox2}{bg=blue,fg=blue}
%\setbeamercolor{headerbox3}{bg=blue}
\setbeamercolor{itemize item}{fg=uniudblue}
\setbeamercolor{itemize subitem}{fg=uniudblue}
\setbeamercolor{itemize subsubitem}{fg=uniudblue}
\setbeamertemplate{itemize item}[triangle]
\setbeamertemplate{itemize subitem}[square]
\setbeamertemplate{itemize subsubitem}[circle]
\setbeamercolor{item projected}{bg=red,fg=uniudblue}
\setbeamertemplate{subsection in toc}[square]
\setbeamertemplate{section in toc}[sections numbered]
\setbeamercolor{subsection number projected}{bg=white}
\setbeamercolor{section in toc}{fg=uniudblue}
\setbeamerfont{section in toc}{series=\ttfamily\bfseries}
\setbeamerfont{subsection in toc}{series=\ttfamily\bfseries}
\setbeamercolor{subsection in toc}{fg=uniudblue}
\setbeamercolor{section in toc shaded}{fg=white}
\setbeamercolor{subsection in toc shaded}{fg=white}

% --- Custom commands
\newcommand{\nskip}{\vskip 4pt \hrule	\vskip 4pt}
%\newcommand{\brule}{{\color{uniudblue} \hrule\vskip 3pt}}
\newcommand{\brule}{\vskip 5pt{\color{uniudblue} \rule{\linewidth}{1.5pt}}\newline}

\newenvironment{fullcols}
{\begin{columns}[t, totalwidth=0.9\paperwidth]}
	{\end{columns}}


\newcommand{\affiliation}[1]{\gdef\@affiliation{#1}}
\newcommand{\insertaffiliation}{%
	\ifdefined\@affiliation
		\@affiliation
	\else
		%
	\fi
}

\newcommand{\intronote}[1]{\gdef\@intronote{#1}}
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
		No event Provided
	\fi
}

\newcommand{\dept}[1]{\gdef\@dept{#1}}
\newcommand{\insertdept}{%
	\ifdefined\@dept
		\@dept
	\else
		No department info provided
	\fi
}

\newcommand{\logouni}[2][]{
	\gdef\@logouni{#2}%
	\gdef\@logounioptions{#1}
}
\newcommand{\insertlogouni}{
	\ifdefined\@logouni
		\includegraphics[scale=\@logounioptions]{\@logouni}%
	\else
		No logo provided
	\fi
}


\renewcommand*{\maketitle}{%	
	\begin{frame}[plain, noframenumbering]{}
		\begin{tikzpicture}[remember picture, overlay]
			\node[anchor=north west, inner sep=0, outer sep=0] at (current page.north west) {
				\tikz \fill[uniudgrey] (0,0) rectangle (\paperwidth, \paperheight);
			};
			
			\node[text width=0.9\paperwidth, anchor=north
			] (header) at (current page.north) [yshift=-0.05\paperheight] {};
			
			\node[anchor=north west] at (header.north west)
			{\insertlogouni};
			
			\node[anchor=north east] at (header.north east)
			{\color{uniudblue} \textbf{\texttt\insertdept}};
			
			\node[align=left, text width=0.9\paperwidth, text=uniudblue] (title)
			at (current page.center) [xshift=0cm, yshift=0.03\paperwidth] {
				{\Large \textbf{\texttt\inserttitle}}
			};
			
			\node[align=left, anchor=north, text width=0.9\paperwidth] (author) at (title.south) [xshift=0cm]
			{\ttfamily\insertauthor\\\vskip5pt{\footnotesize\ttfamily\insertaffiliation}};
					
			\node[anchor=south, text width=0.9\paperwidth, align=center] (event) at (current page.south) [yshift=0.01\paperheight]
			{\ttfamily\color{uniudblue} \hrule height 1pt width 0.9\paperwidth\vskip0.4em {\scriptsize \insertevent\\\insertdate}};
%			{\color{uniudblue}\scriptsize \insertevent};	
		\end{tikzpicture}
		\note{\insertintronotes}
	\end{frame}
}

% --- Frame title
\setbeamercolor{frametitle}{use=structure,fg=uniudblue}
\setbeamerfont{frametitle}{series=\bfseries}
\makeatletter
\setbeamertemplate{frametitle}
{
	\begin{tikzpicture}[remember picture, overlay]
		% Position the title
		\node[anchor=north west, inner xsep=0pt, inner ysep=3pt, font=\ttfamily\Large, text=uniudblue]
		(titlebox) at ([xshift=\beamer@leftmargin, yshift=-0.01\paperheight]current page.north west)
		{\insertframetitle};
		
		% Draw only the bottom line
		\draw[uniudblue, line width=1.5pt, rounded corners=5pt]
		(titlebox.south west) -- (titlebox.south east);
	\end{tikzpicture}
	%	\vspace{-10mm}
}
\makeatother
%\setbeamertemplate{frametitle}{\vskip-1pt\insertframetitle\vskip2pt}%\hrule
%\setbeamertemplate{frametitle}
%{
%	\vspace*{2mm}
%	\begin{tikzpicture}[remember picture, overlay]
%		\node[%text width=0.9\paperwidth,
%		align=left,
%		anchor=north,
%		draw=uniudblue,
%		line width=1.5pt,
%		rounded corners=5pt,
%		inner xsep=1pt,
%		inner ysep=5pt,
%		font=\bfseries\large,
%		text=uniudblue
%		] (titlebox)
%		at ([xshift=0mm,yshift=0mm] current page.north)
%		{\insertframetitle};
%	\end{tikzpicture}
%	\vspace{6mm}
%}
%\makeatletter
%\setbeamertemplate{frametitle}
%{\begin{tikzpicture}[remember picture, overlay]
%	\node[
%	align=left,
%	anchor=north west,
%	draw=uniudblue,
%	line width=1.5pt,
%	rounded corners=5pt,
%	inner xsep=6pt,
%	inner ysep=6pt,
%	font=\ttfamily\Large,
%	text=uniudblue,
%%	fill=white,
%	] (titlebox)
%	at ([xshift=\beamer@leftmargin, yshift=-0.01\paperheight]current page.north west)
%	{\insertframetitle};
%\end{tikzpicture}
%\vspace{6mm}
%}
%\makeatother


% --- Blocks
\RequirePackage[most]{tcolorbox}
\newtcolorbox{blox}[1]{%
	colback=white,
	colframe=uniudblue,
	colbacktitle=white,
	coltitle=uniudblue,
	fonttitle=\bfseries,
	title={\ttfamily\normalsize#1}, %\thetcbcounter
	boxrule=1.5pt,
	enhanced,
	boxsep=0pt,
	top=12pt,
	% before skip = -15pt,
	attach boxed title to top left={yshift=-10pt, xshift=6pt},
	boxed title style={
		boxrule=1.5pt,
		colframe=uniudblue,
		colback=uniudgrey!50,
%		interior style={top color=uniudgrey, bottom color=uniudgrey},
		% boxsep=12pt,
%		top=1pt,
%		bottom=1pt,
		left=5pt,
		right=5pt,
		valign=center,
%		title style={baseline=0.5cm},
%		after=\vspace{5cm}
	},
}
%\setbeamercolor{block title}{use=structure, fg=uniudblue, bg=uniudgrey}
%\setbeamerfont{block title}{size=\large, series=\bfseries}
%\setbeamertemplate{block begin}{%
%	\vspace*{1ex}
%	\begin{beamercolorbox}[ht=2.4ex,dp=1ex,leftskip=0.5em,rightskip=0.5em]{block title}
%		\usebeamerfont*{block title}\textbf{\ttfamily\insertblocktitle}
%	\end{beamercolorbox}%
%	\vspace*{0.5em}
%	\usebeamerfont{block body}%
%	\begin{beamercolorbox}[%
%		dp=1ex,
%		leftskip=0.5em,
%		rightskip=0.5em,
%		vmode]{block body}%
%	}


%\setbeamertemplate{blocks}[rounded]
% --- Footline
\setbeamertemplate{footline}{
	\leavevmode
	\hbox{
		\begin{beamercolorbox}[wd=0.1\paperwidth,ht=2.25ex,dp=1ex,center]{bg=white}%
		\end{beamercolorbox}%
		\begin{beamercolorbox}[wd=0.8\paperwidth,ht=2.25ex,dp=1ex, center]{bg=white}
		\end{beamercolorbox}%
		\begin{beamercolorbox}[wd=0.1\paperwidth,ht=2.25ex,dp=1ex, center]{bg=white}%
			{\color{blue}\textbf{\insertframenumber{} / \inserttotalframenumber}}
		\end{beamercolorbox}%
	}
}

% --- Contents
%\AtBeginSection[]{{\setbeamertemplate{footline}{}
%	\begin{frame}[noframenumbering]{Contents}
%		\small
%		\tableofcontents[sections={1-},sectionstyle=show/shaded,subsectionstyle=show/shaded/hide]
%\end{frame}}}
\AtBeginSection[]
{
	{
		\setbeamertemplate{background canvas}[default]
		\setbeamercolor{background canvas}{bg=uniudgrey}
		\setbeamertemplate{footline}{}
		
		\begin{frame}[noframenumbering]{Contents}
			\small
			\tableofcontents[
			sections={1-},
			sectionstyle=show/shaded,
			subsectionstyle=show/shaded/hide
			]
		\end{frame}
	}
}
\endinput
