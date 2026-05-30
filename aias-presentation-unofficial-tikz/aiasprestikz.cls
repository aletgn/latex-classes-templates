%% aiasprestikz.cls
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
% This work consists of the file aiasprestikz.cls.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{aiasprestikz}[2026/05/30 UniUD -- Unofficial Presentation Template (Tikz)]

% --- Class' options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax

% --- Load the beamer class
\LoadClass{beamer}

% --- Required Packages
\RequirePackage{lmodern}
\RequirePackage{tikz}
\RequirePackage[utf8]{inputenc}
\RequirePackage[italian]{babel}
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

\definecolor{aiasred}{RGB}{118,50,63}
\definecolor{mygrey}{gray}{0.1}


\setbeamertemplate{navigation symbols}{}
\setbeamersize{text margin left=0.05\paperwidth,text margin right=0.05\paperwidth}
%\setbeamercolor{headerbox1}{bg=blue}
%\setbeamercolor{headerbox2}{bg=blue,fg=blue}
%\setbeamercolor{headerbox3}{bg=blue}
\setbeamercolor{itemize item}{fg=aiasred}
\setbeamercolor{itemize subitem}{fg=aiasred}
\setbeamercolor{itemize subsubitem}{fg=aiasred}
\setbeamertemplate{itemize item}[triangle]
\setbeamertemplate{itemize subitem}[square]
\setbeamertemplate{itemize subsubitem}[circle]
\setbeamercolor{item projected}{bg=red,fg=white}
\setbeamertemplate{subsection in toc}[square]
\setbeamertemplate{section in toc}[sections numbered]
\setbeamercolor{subsection number projected}{bg=white}
\setbeamercolor{section in toc}{fg=white}
\setbeamerfont{section in toc}{series=\ttfamily\bfseries}
\setbeamerfont{subsection in toc}{series=\ttfamily}
\setbeamercolor{subsection in toc}{fg=white}
\setbeamercolor{section in toc shaded}{fg=mygrey}
\setbeamercolor{subsection in toc shaded}{fg=mygrey}

% --- Custom commands
\newcommand{\nskip}{\vskip 4pt \hrule	\vskip 4pt}
%\newcommand{\brule}{{\color{uniudblue} \hrule\vskip 3pt}}
\newcommand{\brule}{\vskip 5pt{\color{uniudblue} \rule{\linewidth}{1.5pt}}\newline}

\setbeamersize{
	text margin left=0.04\linewidth,
	text margin right=0.04\linewidth
}

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


\newcommand{\loc}[1]{\gdef\@loc{#1}}
\newcommand{\insertloc}{%
	\ifdefined\@loc
	\@loc
	\else
		No location provided
	\fi
}


\newcommand{\logoaias}[2][]{
	\gdef\@logoaias{#2}%
	\gdef\@logoaiasoptions{#1}
}
\newcommand{\insertlogoaias}{
	\ifdefined\@logoaias
		\includegraphics[scale=\@logoaiasoptions]{\@logoaias}%
	\else
		{\color{white} No logo provided}
	\fi
}

\newcommand{\logoaiaspage}[2][]{
	\gdef\@logoaiaspage{#2}%
	\gdef\@logoaiaspageoptions{#1}
}
\newcommand{\insertlogoaiaspage}{
	\ifdefined\@logoaiaspage
	\includegraphics[scale=\@logoaiaspageoptions]{\@logoaiaspage}%
	\else
%	{\color{white} No logo provided}
	\fi
}


\renewcommand*{\maketitle}{%	
	\begin{frame}[plain, noframenumbering]{}
		\begin{tikzpicture}[remember picture, overlay]
			\node[anchor=north west, inner sep=0, outer sep=0] at (current page.north west) {
				\tikz \fill[aiasred] (0,0) rectangle (\paperwidth, \paperheight);
			};
			
			\node[text width=0.9\paperwidth, anchor=north
			] (header) at (current page.north) [yshift=-0.05\paperheight] {};
			
			\node[anchor=north west] at (header.north west)
			{\insertlogoaias};
			
			
			\node[align=left, text width=0.9\paperwidth, text=white] (title)
			at (current page.center) [xshift=0cm, yshift=0.03\paperwidth] {
				{\Large \textbf{\texttt\inserttitle}}
			};
			
			\node[align=left, anchor=north, text width=0.9\paperwidth, text=white] (author) at (title.south) [xshift=0cm]
			{\ttfamily\insertauthor\\\vskip5pt{\footnotesize\ttfamily\insertaffiliation}};
					
			\node[anchor=south, text width=0.9\paperwidth, align=center] (event) at (current page.south) [yshift=0.01\paperheight]
			{\color{white} \ttfamily \footnotesize \insertevent\ \textbar\ \insertdate\ \textbar\ \insertloc};
		\end{tikzpicture}
		\note{\insertintronotes}
	\end{frame}
}

% --- Frame title
\setbeamercolor{frametitle}{use=structure,fg=aiasred}
\setbeamerfont{frametitle}{series=\bfseries}
\makeatletter
\setbeamertemplate{frametitle}
{
	\begin{tikzpicture}[remember picture, overlay]
		% Position the title
		\node[anchor=north west, inner xsep=0pt, inner ysep=3pt, font=\ttfamily\Large, text=aiasred]
		(titlebox) at ([xshift=\beamer@leftmargin, yshift=-0.01\paperheight]current page.north west)
		{\insertframetitle};
		
		\node[
		anchor=north east,
		xshift=-\beamer@rightmargin,
		yshift=-0.01\paperheight
		]
		at (current page.north east)
		{
			\insertlogoaiaspage
		};
		
		% Draw only the bottom line
		\draw[aiasred, line width=1.5pt, rounded corners=5pt, line cap=round]
		(titlebox.south west) -- (titlebox.south east);
	\end{tikzpicture}
	%	\vspace{-10mm}
}
\makeatother



% --- Blocks
\RequirePackage[most]{tcolorbox}
\newtcolorbox{blox}[1]{%
	colback=white,
	colframe=aiasred,
	colbacktitle=white,
	coltitle=black,
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
		colframe=aiasred,
		colback=gray!10,
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



%\setbeamertemplate{blocks}[rounded]
\setbeamertemplate{footline}{
	\begin{tikzpicture}[remember picture,overlay]
		\draw[
		aiasred,
		line width=1.5pt,
		line cap=round
		]
		([yshift=7ex,xshift=0.04\linewidth]current page.south west)
		--
		([yshift=7ex,xshift=-0.04\paperwidth]current page.south east);
		
		% Testo centrale
		\node[
		anchor=south,
		text width=0.8\paperwidth,
		align=center
		] at ([yshift=0.3ex]current page.south)
		{
			{\ttfamily\color{aiasred}\footnotesize
				\insertevent\ \textbar\ \insertdate\ \textbar\ \insertloc}
		};
		
		% Numero slide a destra
		\node[
		anchor=south east,
		xshift=-0.04\linewidth,
		yshift=0.3ex
		] at (current page.south east)
		{
			{\ttfamily\color{aiasred}\textbf{\insertframenumber} /
				\inserttotalframenumber}
		};
		
	\end{tikzpicture}
}

\AtBeginSection[]
{
	{
		\setbeamertemplate{background canvas}[default]
		\setbeamercolor{background canvas}{bg=aiasred}
		\setbeamertemplate{footline}{}
		
%		\makeatletter
		\setbeamertemplate{frametitle}
		{
			\begin{tikzpicture}[remember picture, overlay]
				% Position the title
				\node[anchor=north west, inner xsep=0pt, inner ysep=3pt, font=\ttfamily\Large, text=white]
				(titlebox) at ([xshift=0.04\linewidth, yshift=-0.01\paperheight]current page.north west)
				{\insertframetitle};
				
				% Draw only the bottom line
				\draw[white, line width=1.5pt, rounded corners=5pt, line cap=round]
				(titlebox.south west) -- (titlebox.south east);
			\end{tikzpicture}
			%	\vspace{-10mm}
		}
%		\makeatother
		
		\begin{frame}[noframenumbering]{Contenuti}
			\small
			\tableofcontents[
			sections={1-},
			sectionstyle=show/shaded,
			subsectionstyle=show/shaded/hide
			]
		\end{frame}
	}
}
