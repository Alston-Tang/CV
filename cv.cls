\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[02/19/2017 custom CV class]
\LoadClass{article}

\RequirePackage{titlesec}
\RequirePackage[letterpaper, landscape, margin=0.75in]{geometry}
\RequirePackage{mathptmx}

\titleformat{\section}         % Customise the \section command
  {\Large\scshape\raggedright} % Make the \section headers large (\Large),
                               % small capitals (\scshape) and left aligned (\raggedright)
  {}{0em}                      % Can be used to give a prefix to all sections, like 'Section ...'
  {}                           % Can be used to insert code before the heading
  [\titlerule]                 % Inserts a horizontal line after the heading

\titleformat{\subsection}
    {\large\scshape\raggedright}
    {}{0em}
    {}

\newcommand{\datedsection}[2] {
  \section[#1]{#1 \hfill #2}
}

\newcommand{\datedsubsection}[2] {
  \subsection[#1]{#1 \hfill #2}
}

\newcommand{\name}[1] {
  \centerline{\textbf{\huge{#1}}}
}

\newcommand{\contact}[5]{
  \null\hfill {\Large} #1 \ {\Large} #2 \hfill\null \newline
  \null\hfill #3 {\large\textperiodcentered} #4 {\large\textperiodcentered} #5 \null\hfill
}
