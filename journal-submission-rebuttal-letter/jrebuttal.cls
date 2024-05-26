\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jrebuttal}[2024/05/18 Rebuttal for Journal Submissions]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{amsmath, amsfonts, amssymb}
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage[scale=0.8]{geometry}
\RequirePackage{color}
\RequirePackage[colorlinks=true, linkcolor=black, citecolor=black, urlcolor=black]{hyperref}

\newcommand{\ack}[1]{\setlength{\parindent}{15pt}{#1}}
\newcommand{\que}[1]{{\setlength{\parindent}{0pt}\itshape #1}\vskip 6pt}
\newcommand{\ans}[1]{\setlength{\parindent}{15pt} {\bfseries #1}\vskip 25pt}
\newcommand{\rev}{\clearpage\refstepcounter{section}\section*{Reviewer \#\thesection}}