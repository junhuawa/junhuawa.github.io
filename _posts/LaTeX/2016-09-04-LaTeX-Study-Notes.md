
A simple test.tex file:

    \documentclass{article} 
    \begin{document}
    My first \TeX~document. 
    \end{document}
    
Create test.dvi file, this file can be viewed by DVI viewer contained in the TeX distribution.

    latex test.tex 

Create the PostScript file, the cmd will create the test.ps file

  dvips test.dvi 
  
Convert dvi file to pdf format

    dvipdfm test.dvi

Another way to produce the PDF file directly from LaTeX source, without an intermediate DVI file.

    pdflatex test.tex

LaTeX Editor LEd

LaTeX是一个文档编排程序。LaTeX是D.E.Knuth的Plain TeX的一个实现版本。 LaTeX由Leslie Lamport实现。 特别适合生成长的文档，或者书，
它可以帮助你自动编排章节，段落，数学定理，等式等，还有交叉引用。 可以说是最流行的TeX。

special characters: \ { } $ ^ _ % ~ # &

mathematical symbols and Greek letters: 

    sequences of characters which begin with a 'backslash' \
    \alpha, \textit, \sum
    * \textit: change the font to italic
    * \textbf:                 to boldface(粗体)
    * \to
    * \in
    * \delta
    * \epsilon

The special character $ is used when one is changing from ordinary text to a mathematical expression 
and when one is changing back to ordinary text. 

\[ and \] mark the beginning and end respectively of a mathematical formula that is displayed on a separate line.

Must have a space line to split 2 paragraphs. Don't need to indent in the beginning of a paragraph.


Section Headings in LATEX

    * \section{title}
    * \subsection{sub title}
    suppress the automatic numbering: place an * before the title of the section or subsection.
    * \section*{title}

Changing Fonts in Text Mode

    * \emph{text}
    example:  \emph{Calculus}
    * \textbf{text}


LaTeX editor in Linux: **Texmaker**

    [junhuawa@Tesla junhuawa.github.io]$ rpm -qa |grep texmaker
    texmaker-4.5-3.el7.x86_64
    [junhuawa@Tesla junhuawa.github.io]$
