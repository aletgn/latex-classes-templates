%% jcletter.cls
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
% This work consists of the file jcletter.cls.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jcletter}[2024/05/18 Cover Letter for Journal Submissions]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage[scale=0.85]{geometry}
\RequirePackage{lipsum}
\RequirePackage{color}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{fancyhdr}

\newcommand{\submitter}[1]{\gdef\@submitter{#1}}
\newcommand{\insertsumbitter}{%
	\ifdefined\@submitter
		\@submitter
	\else
		%
	\fi
}

\newcommand{\authors}[1]{\gdef\@authors{#1}}
\newcommand{\insertauthors}{%
	\ifdefined\@authors
		\@authors
	\else
		%
	\fi
}

\newcommand{\submitterqual}[1]{\gdef\@submitterqual{#1}}
\newcommand{\insertsubmitterqual}{%
	\ifdefined\@submitterqual
		\@submitterqual
	\else
		%
	\fi
}

\newcommand{\affiliation}[1]{\gdef\@affiliation{#1}}
\newcommand{\insertaffiliation}{%
	\ifdefined\@affiliation
		\newline\@affiliation
	\else
		%
	\fi
}

\newcommand{\email}[1]{\gdef\@email{#1}}
\newcommand{\insertemail}{%
	\ifdefined\@email
		\newline \textbf{Email:} \url{\@email}
	\else
		%
	\fi
}

\newcommand{\logo}[2][]{
	\gdef\@logo{#2}%
	\gdef\@logooptions{#1}
}

\newcommand{\insertlogo}{
	\ifdefined\@logo
		\includegraphics[scale=\@logooptions]{\@logo}%
	\else
		%
	\fi
}

\newcommand{\journal}[1]{\gdef\@journal{#1}}
\newcommand{\insertjournal}{%
	\ifdefined\@journal
		\@journal
	\else
		%
	\fi
}

\newcommand{\editor}[1]{\gdef\@editor{#1}}
\newcommand{\inserteditor}{%
	\ifdefined\@editor
		\@editor
	\else
		%
	\fi
}

\newcommand{\editorqual}[1]{\gdef\@editorqual{#1}}
\newcommand{\inserteditorqual}{%
	\ifdefined\@editorqual
		\@editorqual
	\else
		%
	\fi
}

\newcommand{\inserttitle}{%
	\ifdefined\@title
		\begin{center}
			\textbf{\@title}
		\end{center}
	\else
		%
	\fi
}

\fancypagestyle{myfancy}{%
	\fancyhf{}% Clear all header and footer fields
	\begin{minipage}{\dimexpr\textwidth-\parindent\relax}
		%\hspace{-0.5cm}
		\begin{minipage}{0.5\linewidth}
			\insertlogo
			\hfill\vrule
		\end{minipage}
		\begin{minipage}{0.5\linewidth}
			\begin{flushright}
				\noindent\textbf{\insertsumbitter}\par
				\insertsubmitterqual\par
				\noindent \insertaffiliation\par
				\noindent \insertemail
			\end{flushright}
		\end{minipage}
	\end{minipage}
	\newline\newline
}

\renewcommand*{\maketitle}{%
	\pagestyle{myfancy}
	\pagestyle{empty}
	
	\hfill \today
	\newline\newline
	
	\noindent \inserteditorqual\ \inserteditor\\
	\textbf{Editor-in-chief: \insertjournal}\newline
	
	\noindent Dear \inserteditorqual\ \inserteditor,\newline
	
	\ifdefined\@authors
		On behalf of the authors, I would like to submit for your consideration for publication in \insertjournal\ the attached manuscript entitled:
	\else
		I would like to submit for your consideration for publication in \insertjournal\ the attached manuscript entitled:
	\fi
	
	\begin{center}
		\inserttitle
	\end{center}
	
	\ifdefined\@authors
		\noindent by \insertauthors.\newline
	\else
		%
	\fi
	
}

\newcommand{\sig}[2][]{
	\gdef\@sig{#2}%
	\gdef\@sigoptions{#1}
}

\newcommand{\insertsig}{%
	\bigskip This research has not been published and is not being considered for publication elsewhere. We would be very pleased to see this work published in this \insertjournal.\newline
	
	\ifdefined\@sig
		\begin{minipage}{\dimexpr\textwidth-\parindent\relax}
			%		\hspace{-5cm}
			\begin{minipage}{0.5\linewidth}
			\end{minipage}
			\hfill
			\begin{minipage}{0.5\linewidth}
				\begin{flushright}
					Yours sincerely,\\
					\insertsumbitter
					\vskip -30pt
					\includegraphics[scale=\@sigoptions]{\@sig}%
				\end{flushright}
			\end{minipage}
		\end{minipage}
	\else
		\begin{minipage}{\dimexpr\textwidth-\parindent\relax}
			%		\hspace{-5cm}
			\begin{minipage}{0.5\linewidth}
			\end{minipage}
			\hfill
			\begin{minipage}{0.5\linewidth}
				\begin{flushright}
					Yours sincerely,\\
					\insertsumbitter
					\vskip -30pt
				\end{flushright}
			\end{minipage}
		\end{minipage}
	\fi
}
