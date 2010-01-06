\ProvidesClass{brislawn-assignment}

\LoadClass[12pt]{article}

% fields that user can set (in addition to title, author, etc)
\makeatletter
	\newcommand{\subtitle}[1]{\def \@subtitle {#1}}
	\newcommand{\subject}[1]{\def \@subject {#1}}
	\newcommand{\wordcount}[1]{\def \@wordcount {#1}}
	\subtitle{}
	\subject{}
	\wordcount{}
\makeatother

% margins
\usepackage[margin=1in]{geometry}

% fonts
\renewcommand{\familydefault}{\sfdefault} % sans-serif default
\usepackage{helvet} % default font
\renewcommand{\ttdefault}{cmtt}

% alignment
% (must be before indentation because raggedright clears parindent)
\raggedright

% indentation
\usepackage{indentfirst}
\setlength{\parindent}{0.5in}
\setlength{\parskip}{0pt}

% spacing
\usepackage{setspace}

% page numbering
\pagestyle{empty}

% references
\usepackage{varioref}

% figures
\usepackage[pdftex]{graphicx}

% math
\usepackage[helvet]{sfmath}

% title
\makeatletter
\def \maketitle {
	\pdfinfo{/Title (\@title) /Author (\@author) /Subject (\@subject)}
	\begin{titlepage}
		\begin{center}
			~\vfill
			
			\@title \\
			\ifx \@subtitle \@empty \relax \else
				{\@subtitle} \\
			\fi

			\@author \\
			\ifx \@subject \@empty \relax \else
				\@subject \\
			\fi
			\@date \\
			\ifx \@wordcount \@empty \relax \else
				Word Count: \@wordcount \\
			\fi
			
			\vfill
		\end{center}
	\end{titlepage}
}
\makeatother

% sections
\makeatletter
\renewcommand\section{\@startsection {section}{1}{\z@}
	                               {0pt}
	                               {1sp}
	                               {\normalfont\normalsize\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}
	                                 {0pt}
	                                 {1sp}
	                                 {\normalfont\normalsize\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}
	                                 {0pt}
	                                 {1sp}
	                                 {\normalfont\normalsize\bfseries}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
	                                {3.25ex \@plus1ex \@minus.2ex}%
	                                {-1em}%
	                                {\normalfont\normalsize\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
	                                   {3.25ex \@plus1ex \@minus .2ex}%
	                                   {-1em}%
	                                  {\normalfont\normalsize\bfseries}}
\makeatother

