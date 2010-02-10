% interlake-assignment.cls
% by Ankur Dave <ankurdave@gmail.com>

\ProvidesClass{interlake-assignment}

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
	\newcommand{\subtitle}[1]{\def \@subtitle {#1}}
	\newcommand{\subject}[1]{\def \@subject {#1}}
	\newcommand{\wordcount}[1]{\def \@wordcount {#1}}

	% Clear the LaTeX default vars, so the user can leave them unset if he wants
	\def \@title {}
	\def \@author {}
	\def \@date {}
\makeatother

\subtitle{}
\subject{}
\wordcount{}

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

% Set default options (must come last in this section)
\ExecuteOptions{12pt,charter,leftalign,singlespace}

% Applying options
% ================

% Run the options
% (must come first in this section)
\ProcessOptions

% Font sizes
\makeatletter
	\LoadClass[\@fontsize]{article}
\makeatother

% Typefaces
\makeatletter
	\@typeface
\makeatother
\renewcommand{\ttdefault}{cmtt}

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
\usepackage[margin=1in]{geometry}

% Indentation
\usepackage{indentfirst}
\setlength{\parindent}{0.08 \textwidth}
\setlength{\parskip}{0pt}

% References
\usepackage{varioref}

% Figures
\usepackage[pdftex]{graphicx}

% Templates
% =========

% Title
\makeatletter
\def \@maketitle {%
	% Author block definition
	\def \@authorblock {
		\begin{flushleft}
			\ifx \@author \@empty \relax \else
				\@author \\
			\fi
			\ifx \@subject \@empty \relax \else
				\@subject \\
			\fi
			\ifx \@date \@empty \relax \else
				\@date \\
			\fi
		\end{flushleft}
	}
	
	% If any one of these fields is not empty, print the author block
	\ifx \@author \@empty
		\ifx \@subject \@empty
			\ifx \@date \@empty
				\relax % all fields are empty
			\else
				\@authorblock
			\fi
		\else
			\@authorblock
		\fi
	\else
		\@authorblock
	\fi
	
	% Title block definition
	\def \@titleblock {
		\begin{center}
			\ifx \@title \@empty \relax \else
				{\large \@title } \\
			\fi

			\ifx \@subtitle \@empty \relax \else
				\@subtitle \\
			\fi
			\ifx \@wordcount \@empty \relax \else
				Word Count: \@wordcount \\
			\fi
		\end{center}
	}
	
	% If any one of these fields is not empty, print the title block
	\ifx \@title \@empty
		\ifx \@subtitle \@empty
			\ifx \@wordcount \@empty
				\relax % all fields are empty
			\else
				\@titleblock
			\fi
		\else
			\@titleblock
		\fi
	\else
		\@titleblock
	\fi
	
	% Set the spacing for the rest of the document
	\@spacing

}
\makeatother

