\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[02/19/2017 custom CV class]
\LoadClass[10pt]{article}

% Make section title
\RequirePackage{titlesec}
% Set paper type, orientation and margin
\RequirePackage[letterpaper, portrait, margin=0.75in]{geometry}
% Set font family to NewTimesRoman
\RequirePackage{mathptmx}
% Use fontawesome
\RequirePackage{fontawesome}
% Make hyperlink
\RequirePackage{hyperref}
% Provide foreach loop
\RequirePackage{pgffor}
% Provide more flexible list
\RequirePackage{enumitem}
% Do string comparision
\usepackage{pdftexcmds}
% Make line space less than single
\setlength\lineskiplimit{-1000pt}
\linespread{0.9}
% Set list to be compact
\setlist{nosep}
% Supress page number
\pagenumbering{gobble}

% Adjust section's space
\titlespacing*{\section}
{0pt}{0.5em}{0.3em}
\titleformat{\section}         % Customise the \section command
  {\large\scshape\raggedright\bfseries} % Make the \section headers large (\Large),
                               % small capitals (\scshape) and left aligned (\raggedright)
  {}{0em}                      % Can be used to give a prefix to all sections, like 'Section ...'
  {}                           % Can be used to insert code before the heading
  [\titlerule]                 % Inserts a horizontal line after the heading

% Adjust subsection's space
\titlespacing*{\subsection}
{0pt}{0.5em}{0em}
\titleformat{\subsection}
    {\raggedright\bfseries}
    {}{0em}
    {}

\newcommand{\notempty}[2] {
  \if\relax\detokenize{#1}\relax
  \else
    #2
  \fi
}

\newcommand{\showiftrue}[2]{%
  \ifnum\pdf@strcmp{#1}{TRUE}=0 %
    #2
  \else
  \fi
}

%==================Languages=====================
% Simplefied Chinese
\newif\ifsc
\newcommand{\langsc}[1]{\ifsc#1\fi}
% English
\newif\ifen
\newcommand{\langen}[1]{\ifen#1\fi}
\DeclareOption{langsc}{\sctrue}
\DeclareOption{langen}{\entrue}
\ProcessOptions
% Load any packages or environments needed by the specific language
\ifsc
  \usepackage[UTF8]{ctex}
\fi
%==================Education=====================
\newcommand{\gpaf}[1] {
  {#1}/4.0
}
\newcommand{\edutitle}[4] {
  \datedsubsection{#1}{#2}
  \textit{#3}\enspace{\gpa{#4}}\hfill\null
}
\newcommand{\gpa}[1] {
  #1/4.0
}
\newcommand{\course} [3] {
  #1 (\ignorespaces\notempty{#2}{#2,\ignorespaces}\notempty{#3}{#3\ignorespaces})\ignorespaces
}
\newcommand{\coursesegment} [1] {
  \showiftrue{\cvenablecourse}{
    #1
  }
}
\newcommand{\selectedcourses}[1] {
  \langen{Selected Coursework}\langsc{部分课程}: \foreach \n [count=\ni] in {#1} {\ignorespaces
    \ifnum\ni=1
      \n
    \else
      ,\n
    \fi
  }
}
\newenvironment{cventry} {
  \begin{itemize}
} {
  \end{itemize}
}
\newenvironment{eduentry} {
  \setlist[itemize]{rightmargin=6em}
  \begin{cventry}
} {
  \end{cventry}
  \setlist[itemize]{}
}
%==================Skill===========================
\newenvironment{skillentry} {
  \setlist[itemize]{leftmargin=0em}
  \begin{cventry}
} {
  \end{cventry}
  \setlist[itemize]{}
}

%===================Experience=====================
\newcommand{\exptitle}[4] {
  \datedsubsection{#1}{#2}
  \textit{#3 #4}
}
%===================Projects=======================
\newcommand{\protitle}[4] {
  \datedsubsection{#1 \notempty{#4}{\href{https://github.com/Alston-Tang/#4}{\normalfont{ \faGithub\enspace#4}}}}{#2}
  \textit{#3}
}
\newcommand{\skilllist}[2] {
    \textbf{#1}: \foreach \n [count=\ni] in {#2} {\ignorespaces
      \ifnum\ni=1
        \n
      \else
        ,\n
      \fi
    }
}
%===================Publication=====================
\newenvironment{pubentry} {
  \setlist[itemize]{leftmargin=0em}
  \begin{cventry}
} {
  \end{cventry}
  \setlist[itemize]{}
}

\newcommand{\datedsection}[2] {
  \section[#1]{#1 \hfill #2}
}

\newcommand{\datedsubsection}[2] {
  \subsection[#1]{#1 \hfill #2}
}

\newcommand{\name}[1] {
  \centerline{\textbf{\huge{#1}}}
}

\newcommand{\contact}[7]{
  \null\hfill
    \notempty{#1}{{\Large} \faEnvelope\enspace#1\hfill}
    \notempty{#2}{{\Large} \faPhone\enspace#2\hfill}
    \notempty{#3}{{\Large} \faGithub\enspace\href{https://github.com/#3}{#3}\hfill}
    \notempty{#4}{{\Large} \faLinkedin\enspace\href{https://linkedin.com/in/#4}{LinkedIn}}
  \hfill\null\newline
  \null\hfill
    {\Large} \faHome\enspace#5{\large\textperiodcentered}#6{\large\textperiodcentered}#7
  \null\hfill
}
