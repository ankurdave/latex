% portfolio.cls
% by Ankur Dave <ankurdave@gmail.com>

\ProvidesClass{portfolio}

% Document class options
% ======================
% 
% Typeface options:
% newcent -- Uses the New Century Schoolbook typeface
% times -- Uses the Times Roman typeface
% charter -- Uses the Bitstream Charter typeface
% computer-modern -- Uses Computer Modern, LaTeX's default typeface
%
% Font size options:
% 10pt
% 11pt
% 12pt
% 
% Alignment options:
% justify -- Justifies both sides of the text, LaTeX's default
% leftalign -- Justifies to the left side, leaves the right side ragged
% 
% Spacing options:
% singlespace -- Normal spacing
% doublespace -- Leaves one blank line between every actual line

% User-configurable commands
% ==========================

% Options defaults

% To set the default options, see the end of the "Declaring options" section

% Add fields that you want to set in the document
\makeatletter
	\newcommand{\name}[1]{\def \@name {#1}}
	\newcommand{\addressone}[1]{\def \@addressone {#1}}
	\newcommand{\addresstwo}[1]{\def \@addresstwo {#1}}
	\newcommand{\phonehome}[1]{\def \@phonehome {#1}}
	\newcommand{\phonemobile}[1]{\def \@phonemobile {#1}}
	\newcommand{\email}[1]{\def \@email {#1}}
	\newcommand{\website}[1]{\def \@website {#1}}
\makeatother

\name{}
\addressone{}
\addresstwo{}
\phonehome{}
\phonemobile{}
\email{}
\website{}

% Clear the LaTeX default vars, so the user can leave them unset if he wants
\makeatletter
	\def \@title {}
	\def \@author {}
	\def \@date {}
\makeatother

% Declaring options
% ==================

% Typefaces
\makeatletter
	\newcommand{\@typeface}{}
	
	\DeclareOption{newcent}{
		\renewcommand{\@typeface}{\usepackage{newcent}}
	}
	\DeclareOption{times}{
		\renewcommand{\@typeface}{\usepackage{pslatex}}
	}
	\DeclareOption{charter}{
		\renewcommand{\@typeface}{\usepackage[bitstream-charter]{mathdesign}}
	}
	\DeclareOption{computer-modern}{
		\renewcommand{\@typeface}{}
	}
\makeatother

% Font size
\makeatletter
	\newcommand{\@fontsize}{}
	
	\DeclareOption{10pt}{
		\renewcommand{\@fontsize}{10pt}
	}
	\DeclareOption{11pt}{
		\renewcommand{\@fontsize}{11pt}
	}
	\DeclareOption{12pt}{
		\renewcommand{\@fontsize}{12pt}
	}
\makeatother

% Alignment
\makeatletter
	\newcommand{\@alignment}{}
	
	\DeclareOption{justify}{
		\renewcommand{\@alignment}{}
	}
	\DeclareOption{leftalign}{
		\renewcommand{\@alignment}{\raggedright}
	}
\makeatother

% Spacing
\makeatletter
	\newcommand{\@spacing}{}
	
	\DeclareOption{singlespace}{
		\renewcommand{\@spacing}{}
	}
	\DeclareOption{doublespace}{
		\renewcommand{\@spacing}{\setstretch{2.0}}
	}
\makeatother

% Spacing
\makeatletter
	\newcommand{\@numsides}{}
	
	\DeclareOption{oneside}{
		\renewcommand{\@numsides}{oneside}
	}
	\DeclareOption{twoside}{
		\renewcommand{\@numsides}{twoside}
	}
\makeatother

% Set default options (must come last in this section)
\ExecuteOptions{12pt,charter,leftalign,singlespace,oneside}

% Applying options
% ================

% Run the options
% (must come first in this section)
\ProcessOptions

% Font sizes and num sides
\makeatletter
	\LoadClass[\@fontsize,\@numsides]{article}
\makeatother

% Typefaces
\makeatletter
	\@typeface
\makeatother
\renewcommand{\ttdefault}{cmtt}
\usepackage{helvet}

% Alignment
% (must be before indentation because raggedright clears parindent)
\makeatletter
	\@alignment
\makeatother

% Spacing
\usepackage{setspace}
\makeatletter
%	\@spacing % Normally, spacing is set only after the title. Uncomment to set it for the title as well
\makeatother

% Other configuration
% ===================

% Margins
\usepackage[margin=0.5in,left=0.75in]{geometry}
% Change margins on the fly
\newenvironment{changemargin}[2]{%
	\begin{list}{}{%
		\setlength{\topsep}{0pt}%
		\setlength{\leftmargin}{#1}%
		\setlength{\rightmargin}{#2}%
		\setlength{\listparindent}{\parindent}%
		\setlength{\itemindent}{\parindent}%
		\setlength{\parsep}{\parskip}%
	}%
	\item[] ~ \par%
	% Get rid of the extra space inserted by the previous line
	\vspace*{-2em}%
}{
	\end{list}
}

% References
\usepackage{varioref}

% Figures
\usepackage[pdftex]{graphicx}
\DeclareGraphicsExtensions{.pdf, .png, .jpg}

% Page numbers (must be after margins because geometry resets header lengths
\usepackage{fancyhdr}
\fancyhf{}
\renewcommand{\headrulewidth}{0in}
\fancyhead[OR,EL]{\thepage}
\pagestyle{fancy}
\addtolength{\voffset}{0.25in} % how far the number is from the top
\addtolength{\headsep}{-0.25in}

% PDF URLs
\usepackage{url}
\usepackage{hyperref}
%\newcommand{\email}[1]{\href{mailto:#1}{{\small\ttfamily{}#1}}}
\newcommand{\link}[1]{{\small\url{#1}}}

% Lists
\usepackage{tweaklist}
\renewcommand{\itemhook}{
	\setlength{\topsep}{0pt}
	\setlength{\partopsep}{0pt}
	\setlength{\itemsep}{2pt}
	\setlength{\parsep}{0pt}
	\setlength{\leftmargin}{2em}
	\setlength{\rightmargin}{0pt}
	\setlength{\listparindent}{0em}
	\setlength{\itemindent}{0em}
	\setlength{\labelsep}{0.5em}
}

% Indentation
\usepackage{indentfirst}
\setlength{\parskip}{0.6em plus 0.2em minus 0.2em}
\setlength{\parindent}{0pt}

% Figures on the side
\newlength{\colA}
\newlength{\colB}
\newlength{\colspace}
\newlength{\colADecrease}
\newlength{\colBSpace}

\newcommand{\setfigwidth}[2]{
	\setlength{\colspace}{#2}
	
	\setlength{\colA}{\textwidth}
	\addtolength{\colA}{-0.5\colspace}
	
	\setlength{\colB}{#1}
	\addtolength{\colB}{-0.5\colspace}
	
	\addtolength{\colA}{-\colB}
	\setlength{\colADecrease}{\colB}
	\addtolength{\colADecrease}{\colspace}
}
\newcommand{\fig}[2][1em]{%
	\marginpar{\vspace{#1}\hspace{-\colB}%
		\fbox{\includegraphics[width=\colB]{images/#2}}%
	}%
}
\newcommand{\figsmall}[3][1em]{%
	\setlength{\colBSpace}{\colB}%
	\addtolength{\colBSpace}{-#3\colB}
	\addtolength{\colBSpace}{-#3\colB}
	\marginpar{\vspace{#1}\hspace{-#3\colB}%
		\fbox{%
			\hspace*{\colBSpace}%
			\includegraphics[width=#3\colB]{images/#2}%
			\hspace*{\colBSpace}%
		}%
	}%
}
\marginparsep=0pt
\marginparpush=0em
\setlength\fboxsep{2pt}
\setlength\fboxrule{0.3pt}
\newenvironment{figarea}[2][1em]{%
	\setfigwidth{#2}{#1}%
	\begin{changemargin}{0pt}{\colADecrease}%
}{%
	\end{changemargin}%
}

% Bibliography styles
\usepackage{natbib}

% Templates
% =========

% Sections
\makeatletter
\newenvironment{resume}[1]{
	\phantomsection
	\addtocounter{section}{1}
	\addcontentsline{toc}{section}{#1}
	\renewcommand{\section}[1]{
		\phantomsection
		\addtocounter{subsection}{1}
		\addcontentsline{toc}{subsection}{##1}
		\@startsection
			{subsection}
			{2}
			{\z@}
			{0.8em plus 0.2em minus 0.1em}
			{0em}
			{\normalfont\Large\sc\bfseries}
			*
			{##1}
		\hspace*{\fill} % End the section line
		\vspace{2pt}
		\hrule
		\addvspace{0.3em plus 0.2em minus 0.2em}
		\par
		\nopagebreak
	}
	\renewcommand{\subsection}[1]{
		\phantomsection
		\addtocounter{subsubsection}{1}
		\addcontentsline{toc}{subsubsection}{##1}
		\@startsection
			{subsubsection}
			{3}
			{\z@}
			{0.4em plus 0.2em minus 0.2em}
			{0.1em plus 0.1em minus 0.2em}
			{\normalfont\large\sf\bfseries}
			*
			{##1}
	}
}{}

\makeatother

% Job positions
\makeatletter
	\newcommand{\employer}[1]{\def \@employer {#1}}
	\newcommand{\location}[1]{\def \@location {#1}}
	\newcommand{\jobtitle}[1]{\def \@jobtitle {#1}}
	\newcommand{\dates}[1]{\def \@dates {#1}}
	\employer{}
	\jobtitle{}
	\dates{}

	\newenvironment{position}{
		\textbf{\@employer} \hfill \textit{\@location}\\
		\textit{\@jobtitle} \hfill \@dates
		\par
	}{
		\addvspace{0.4em plus 0.2em minus 0.2em}
	}
\makeatother

% Schools
\makeatletter
	\newcommand{\schoolname}[1]{\def \@schoolname {#1}}
%	\newcommand{\dates}[1]{\def \@dates {#1}} % already defined by position
	\schoolname{}
	\dates{}

	\newenvironment{school}{
		\textbf{\@schoolname} \hfill \@dates
		\par
	}{
		\addvspace{0.4em plus 0.2em minus 0.2em}
	}
\makeatother

% Title
\makeatletter
\def \@maketitle {
	\begin{center}
		{\Large \bf \@name}
		\vspace{0.5em} \hrule height 1pt \vspace{0.5em}
		\begin{tabular}{r l}
			\@addressone & \@addresstwo \\
			home: \@phonehome & mobile: \@phonemobile \\
			\texttt{\@email} & \texttt{\@website} \\
		\end{tabular}
	\end{center}
}
\makeatother

