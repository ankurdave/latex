\ProvidesClass{cover-letter}

\PassOptionsToClass{10pt,11pt,12pt}{article}
\LoadClassWithOptions{article}

% fields that user can set
\makeatletter
	\newcommand{\address}[1]{\def \@address {#1}}
	\newcommand{\recipientaddress}[1]{\def \@recipientaddress {#1}}
	\address{}
	\recipientaddress{}
\makeatother

% margins
\usepackage[top=1in,bottom=1in,left=1in,right=1in]{geometry}

% fonts
\usepackage{times}
\renewcommand{\ttdefault}{cmtt}

% alignment
% (must be before indentation because raggedright clears parindent)
\raggedright

% paragraphs
\setlength{\parskip}{1em}

% title
\makeatletter
\def \@maketitle {
	\@address \par
	\@recipientaddress \par
	\@date \par
}
\makeatother

