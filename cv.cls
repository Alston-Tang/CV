\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[02/19/2017 custom CV class]
\LoadClass{article}
\RequirePackage{titlesec}

  \titleformat{\section}         % Customise the \section command
    {\Large\scshape\raggedright} % Make the \section headers large (\Large),
                                 % small capitals (\scshape) and left aligned (\raggedright)
    {}{0em}                      % Can be used to give a prefix to all sections, like 'Section ...'
    {}                           % Can be used to insert code before the heading
    [\titlerule]                 % Inserts a horizontal line after the heading
