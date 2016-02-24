\NeedsTeXFormat{LaTeX2e}
\LoadClass{article}
\ProvidesClass{resume}[2016/02/10 Resume Class]

% Package declaration

\RequirePackage{titlesec}  
\RequirePackage{xcolor}
\RequirePackage{tikz}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{mdframed}
\RequirePackage{xstring}
\RequirePackage[nomessages]{fp}
\RequirePackage{ifthen}

% Color declaration

\definecolor{lightblue}{HTML}{87CEFA}
\definecolor{blue}{HTML}{0873B5}
\definecolor{darkblue}{HTML}{043757}
\definecolor{blackblue}{HTML}{00070C}
\definecolor{lightgreen}{HTML}{01FF70}
\definecolor{green}{HTML}{2ECC40}
\definecolor{red}{HTML}{FF4136}
\definecolor{orange}{HTML}{FF851B}
\definecolor{lightpurple}{HTML}{F012BE}
\definecolor{purple}{HTML}{B10DC9}
\definecolor{lightgray}{HTML}{777777}
\definecolor{gray}{HTML}{555555}
\definecolor{darkgray}{HTML}{333333}
\definecolor{white}{HTML}{eeeeee}

\colorlet{headerBackground}{gray}
\colorlet{headerText}{white}
\colorlet{headerEmph}{lightblue}
\colorlet{titleText}{blackblue}
\colorlet{subTitleText}{darkblue}
\colorlet{bodyText}{darkgray}
\colorlet{tagText}{lightgray}

\pagenumbering{gobble}
\noexpandarg

% Header

\newcommand{\header}[3] {
	\begin{tikzpicture}[remember picture, overlay]
		\node [rectangle, fill=headerBackground, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north) {

		};
    	\node [anchor=center] (name) at (box) {
    		\Huge
			\fontfamily{phv}\selectfont
      		{\color{headerText} #1}{\color{headerEmph} \textbf{#2}}
    	};
    	\node [anchor=north] at (name.south) {
    		\color{headerText}
    		\Large
			\fontfamily{phv}\selectfont
      		{#3}
    	};
	\end{tikzpicture}
	\vspace{2.5cm}
	\vspace{-2\parskip}
}

% Main

\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{main} {
  	\let\oldsection\section
	\renewcommand{\section}[3] {
		{
			\vspace{0.3cm}~
			\par
			\fontfamily{phv}\selectfont 
			\StrLen{##2}[\stringLength]
			%\textbf{\color{##3}\StrMid{##2}{1}{3}\color{titleText}\StrMid{##2}{4}{\stringLength}}
			\textbf{\LARGE\color{##3}##2}
		}
	}

	\begin{textblock}{3.6}(8, 4.25)
	\begin{flushleft}
	\obeycr
	\vspace{-1.0cm}~
}{
	\restorecr
	\end{flushleft}
	\end{textblock}
  \let\section\oldsection
}

% Sidebar

\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{sidebar} {
  	\let\oldsection\section
  	\renewcommand{\section}[2] {
		{
			~
			\par\Large 
			\fontfamily{phv}\selectfont

			\StrLen{##1}[\stringLength]
			\FPeval{\leftBreak}{clip(\stringLength - 3)}
			\FPeval{\rightBreak}{clip(\stringLength - 2)}
			%\textbf{\color{titleText}\StrMid{##1}{1}{\leftBreak}\color{##2}\StrMid{##1}{\rightBreak}{\stringLength}}
			\textbf{\color{##2}##1}
			
		}
		\vspace{-0.4cm}~
	}
	
	\normalsize
	\fontfamily{phv}\selectfont
	\begin{textblock}{5.8}(1.5, 4.33)
	\begin{flushright}
	\obeycr
	\vspace{-0.65cm}~
}{
	\restorecr
	\end{flushright}
	\end{textblock}
  	\let\section\oldsection
}

% List

\setlength{\tabcolsep}{0pt}

\newenvironment{entrylist} {
	\begin{tabular*} {\textwidth}{@{\extracolsep{\fill}}ll}
	\vspace{-0.2cm}~
} {
	\end{tabular*}
	\vspace{-1.0cm}~
}

\newcommand{\rightentry}[5] {
	\fontfamily{phv}\selectfont
	\vspace{-0.1cm}
 	\parbox[t]{3.5cm}{#1} &\parbox[t]{8.5cm} {
		\fontfamily{phv}\selectfont
 		\textbf{\color{titleText}#2} \hfill \color{tagText}#3\\
		\StrLen{#4}[\stringLength]
  		\ifthenelse{\equal{\stringLength}{0}}{}{\color{subTitleText}\emph{#4}\\}
		\ifthenelse{\equal{\stringLength}{0}}{}{\color{bodyText}#5\\}
 	}
}
\newcommand{\leftentry}[2] {
	\fontfamily{phv}\selectfont
	\vspace{-0.2cm}
	\raggedleft\parbox[t]{4.3cm}{\raggedleft #1} & \parbox[t]{1cm}{\hfill \emph{#2}}\\
}

\newcommand{\iconentry}[2] {
	\fontfamily{phv}\selectfont
	#1 \ \parbox[t]{0.3cm}{\centering#2}
}