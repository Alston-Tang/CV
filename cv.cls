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

% Make line space less than single
\setlength\lineskiplimit{-1000pt}
\linespread{0.9}

% Adjust section's space
\titlespacing*{\section}
{0pt}{0pt}{0pt}

\titleformat{\section}         % Customise the \section command
  {\large\scshape\raggedright\bfseries} % Make the \section headers large (\Large),
                               % small capitals (\scshape) and left aligned (\raggedright)
  {}{0em}                      % Can be used to give a prefix to all sections, like 'Section ...'
  {}                           % Can be used to insert code before the heading
  [\titlerule]                 % Inserts a horizontal line after the heading

\titleformat{\subsection}
    {\scshape\raggedright\bfseries}
    {}{0em}
    {}

\newcommand{\notempty}[2] {
  \if\relax\detokenize{#1}\relax
  \else
    #2
  \fi
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
