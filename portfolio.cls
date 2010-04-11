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
\makeatletter
	\def\url@smallerstyle{%
	\@ifundefined{selectfont}{\def\UrlFont{\sf}}{\def\UrlFont{\small\ttfamily}}}
\makeatother
\urlstyle{smaller}


% Lists
\usepackage{tweaklist}
\renewcommand{\itemhook}{
	\setlength{\topsep}{0pt}
	\setlength{\partopsep}{0pt}
	\setlength{\itemsep}{2pt plus 2pt minus 1pt}
	\setlength{\parsep}{0pt}
	\setlength{\leftmargin}{2em}
	\setlength{\rightmargin}{0pt}
	\setlength{\listparindent}{0em}
	\setlength{\itemindent}{0em}
	\setlength{\labelsep}{0.5em}
}

% Indentation
\usepackage{indentfirst}
\setlength{\parskip}{0.6em plus 0.3em minus 0.4em}
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
\newcommand{\fig}[2][0em]{%
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
\marginparpush=1em
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
\newenvironment{qanda}[1]{
	\phantomsection
	\addtocounter{section}{1}
	\addcontentsline{toc}{section}{#1}
	\newcommand{\question}[1]{%
		\newpage%
		\phantomsection%
		\addtocounter{subsection}{1}%
		\addcontentsline{toc}{subsection}{##1}%
		\@startsection%
			{subsection}%
			{2}%
			{\z@}%
			{1em}%
			{1em}%
			{\normalfont\Large\bfseries\color{questionColor}}%
			*%
			{##1}%
	}
	\renewcommand{\section}[1]{%
		\newpage%
		\phantomsection%
		\addtocounter{subsection}{1}%
		\addcontentsline{toc}{subsection}{##1}%
		\@startsection%
			{subsection}%
			{2}%
			{\z@}%
			{1em}%
			{1em}%
			{\normalfont\Large\bfseries\centering}%
			*%
			{##1}%
		}
		\newcommand{\answersection}[1]{%
			\@startsection%
				{subsubsection}%
				{3}%
				{\z@}%
				{0.5em plus 0.3em minus 0.2em}%
				{0.2em plus 0.1em minus 0.1em}%
				{\normalfont\large\bfseries}%
				*%
				{##1}%
		}
		\renewcommand{\paragraph}[1]{%
			\@startsection%
				{paragraph}%
				{4}%
				{\z@}%
				{0em}%
				{-0.5em}%
				{\normalfont\normalsize\bfseries}%
				*%
				{##1}%
		}
}{}
\makeatother
