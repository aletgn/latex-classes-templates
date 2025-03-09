%% beamprop.cls
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
% This work consists of the file beamprop.cls.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{beamprop}[2025/03/09 Beamline proposal]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

\RequirePackage[top=1.5cm, bottom=2.5cm, left=1.5cm, right=1.5cm]{geometry}
\RequirePackage[colorlinks=true, linkcolor=black, citecolor=blue]{hyperref}

\RequirePackage{graphicx, wrapfig}

\RequirePackage[font={footnotesize}, labelfont=bf, justification=justified,labelsep=period, figurename=Fig., skip=1pt]{caption}

\RequirePackage{titlesec}
\titlespacing*{\paragraph}{0pt}{0.1ex}{2ex}
\setlength{\parindent}{0pt}
\setlength{\parskip}{3pt}
% \setlength{\abovecaptionskip}{-10pt} 
\setlength{\belowcaptionskip}{-15pt} 

\pagestyle{empty}

\usepackage{csquotes}
\usepackage[minbibnames=1, maxbibnames=1, maxnames=1,
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