\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uniudthesis}[2024/09/03 UniUD Thesis]

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
% bibliography
% bibtex
	%\usepackage[numbers, compress]{natbib}
	%\bibliographystyle{unsrtnat}
	% at the end
	%\renewcommand{\bibname}{References}
	% {\small \singlespacing \bibliography{references.bib}}
	%{\setlength{\bibsep}{3pt} \footnotesize \bibliography{refs.bib}}
% biblatex
	%\usepackage[autostyle,italian=guillemets]{csquotes}
	%\usepackage[sorting=none, style=numeric, backend=biber]{biblatex} %sorting=ynt %style=authoryear-comp %sorting=ynt %style=authoryear-comp
	% \usepackage[maxbibnames=1, sorting=none, style=numeric, backend=biber, url=false, isbn=false, doi=true]{biblatex} 
	% \AtEveryBibitem{\clearfield{day}\clearfield{month}\clearfield{endday}\clearfield{endmonth}\clearfield{pages}\clearfield{volume}\clearfield{abstract}}
	% \addbibresource{references.bib}
	% at the end
	% \nocite{*}
	% {\small \singlespacing \printbibliography[title = References]}