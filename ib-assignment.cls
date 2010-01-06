\ProvidesClass{ib-assignment}

\LoadClass[11pt]{article}

% fields that user can set (in addition to title, author, etc)
\makeatletter
	\newcommand{\candidatenum}[1]{\def \@candidatenum {#1}}
	\newcommand{\subtitle}[1]{\def \@subtitle {#1}}
	\newcommand{\subject}[1]{\def \@subject {#1}}
	\newcommand{\wordcount}[1]{\def \@wordcount {#1}}
	\newcommand{\email}[1]{\def \@email {#1}}
	\candidatenum{}
	\subtitle{}
	\subject{}
	\wordcount{}
	\email{}
\makeatother

% margins
\usepackage[top=1in,bottom=1in,left=1in,right=1in]{geometry}

% fonts
\usepackage{newcent}
\usepackage{fouriernc}
\renewcommand{\ttdefault}{cmtt}

% alignment
% (must be before indentation because raggedright clears parindent)
\raggedright

% indentation
\usepackage{indentfirst}
\setlength{\parindent}{18pt}
\setlength{\parskip}{3pt}

% spacing
\usepackage{setspace}

% references
\usepackage{varioref}

% figures
\usepackage[pdftex]{graphicx}

% bibliography
\usepackage{natbib}

% page headings and numbering
\makeatletter
	\usepackage{fancyhdr}
	\pagestyle{fancy}
	\renewcommand{\footrulewidth}{\headrulewidth}
	\fancyhf{}

	\newcommand{\updateheaders}{
		\ifx \@candidatenum \@empty
			\relax
		\else
			\fancyfoot[R]{Candidate \#\@candidatenum}
		\fi
		
		\ifx \@author \@empty
			\relax
		\else
			\fancyfoot[L]{\@author}
		\fi

		\ifx \@subtitle \@empty
			\fancyhead[L]{\@title}
		\else
			\fancyhead[L]{\@title: \@subtitle}
		\fi
	}

	\fancyhead[R]{\thepage}
\makeatother

% title
\makeatletter
\def \maketitle {%
	\pdfinfo{/Title (\@title) /Author (\@author)}
	\begin{titlepage}
		~\vfill
		\begin{center}
			{\Large \@title} \\
			\ifx \@subtitle \@empty
				\relax
			\else
				\vspace{0.5em}
				{\large \@subtitle} \\
			\fi
		
			\vspace{0.5in}
		
			\ifx @author \@empty
				\relax
			\else
				\@author \\
				\ifx\@email\@empty
					\relax
				\else
					\texttt{\@email} \\
				\fi
				\ifx \@candidatenum \@empty
					\relax
				\else
					Candidate \#\@candidatenum \\
				\fi
				\vspace{0.5in}
			\fi
		
			\ifx \@wordcount \@empty
				\relax
			\else
				Word Count: \@wordcount \\
				\vspace{0.5in}
			\fi
				
			\@date
		\end{center}
		\vfill
	\end{titlepage}
}
\makeatother

