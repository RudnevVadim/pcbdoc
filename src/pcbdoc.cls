
%идентификация
\ProvidesClass{pcbdoc}%

%начальный командный код
\newcommand{\pcbdoctype}{spec}%
\newlength{\pcbdoclinethick}%
\setlength{\pcbdoclinethick}{0.6mm}%
\newlength{\pcbdoclinethin}%
\setlength{\pcbdoclinethin}{0.3mm}%

\RequirePackage{keyval}%
\RequirePackage{pcbdoclayout}%
\RequirePackage{xifthen}%

\define@key{pcbdoc}{deltawidth}{\setlength{\pcbdocpaperdeltawidth}{#1}}%
\define@key{pcbdoc}{deltaheight}{\setlength{\pcbdocpaperdeltaheight}{#1}}%
\define@key{pcbdoc}{topmargin}{\setlength{\pcbdocpapertopmargin}{#1}}%
\define@key{pcbdoc}{bottommargin}{\setlength{\pcbdocpaperbottommargin}{#1}}%
\define@key{pcbdoc}{leftmargin}{\setlength{\pcbdocpaperleftmargin}{#1}}%
\define@key{pcbdoc}{rightmargin}{\setlength{\pcbdocpaperrightmargin}{#1}}%
\define@key{pcbdoc}{linethick}{\setlength{\pcbdoclinethick}{#1}}%
\define@key{pcbdoc}{linethin}{\setlength{\pcbdoclinethin}{#1}}%
\define@key{pcbdoc}{doctype}{\renewcommand{\pcbdoctype}{#1}}%
\define@key{pcbdoc}{papersize}{%
  \renewcommand{\pcbdocpapersize}{#1}%
  \PcbDocSizeChoice%
  }%

\newlength{\gridstep}% шаг сетки в черновом режиме
\setlength{\gridstep}{10mm}%
\define@key{pcbdoc}{gridstep}{\setlength{\gridstep}{#1}}%

\newcommand{\draftmode}{}% черновой режим
\newcommand{\changelist}{}% печать листа изменений
\newcommand{\compactmode}{}% не печатать пустую строку после записи в перечне элементов

\DeclareOption{draftmode}{\renewcommand{\draftmode}{draftmode}}%
\DeclareOption{changelist}{\renewcommand{\changelist}{changelist}}%
\DeclareOption{compactmode}{\renewcommand{\compactmode}{compactmode}}%

\DeclareOption*{\edef\@tempa{%
    \noexpand\setkeys{pcbdoc}{\CurrentOption}}\@tempa}%

\ProcessOptions%

%загрузка пакетов
\LoadClass[12pt]{article}%
\RequirePackage{pcbdocborder}%
\RequirePackage{pcb\pcbdoctype}%
\RequirePackage{pcbdoccontent}%

\newcommand{\papersizeset}[1]{%
  \renewcommand{\pcbdocpapersize}{#1}%
  \PcbDocSizeChoice%
  \PcbDocLayoutSet%
  }%

\definecolor{backgroundcolor}{rgb}{0.8784,0.8784,0.7647}% цвет фона в черновом режиме

\newlength{\BoardWidth}%
\newlength{\BoardHeight}%
\newlength{\BoardThickness}%
\newcommand{\PcbDocScale}{}%
\newcommand{\PcbDocAuthor}{}%
\newcommand{\PcbDocChecker}{}%
\newcommand{\PcbDocNormController}{}%
\newcommand{\PcbDocTechController}{}%
\newcommand{\PcbDocApprover}{}%
\newcommand{\PcbDocName}{}%
\newcommand{\PcbDocNumber}{}%
\newcommand{\PcbNumber}{}%
\newcommand{\PcbMaterial}{}%
\newcommand{\PcbDocPrimaryUse}{}%
\newcommand{\PcbDocPpTtFirst}{}%
\newcommand{\PcbDocPpTtNext}{}%
\newcommand{\PcbDocSbTtFirst}{}%
\newcommand{\PcbDocSbTtNext}{}%
\newcommand{\PcbDocShTtFirst}{}%
\newcommand{\PcbDocShTtNext}{}%
\newcommand{\ScaleSet}[1]{\renewcommand{\PcbDocScale}{#1}}%
\newcommand{\AuthorSet}[1]{\renewcommand{\PcbDocAuthor}{#1}}%
\newcommand{\CheckerSet}[1]{\renewcommand{\PcbDocChecker}{#1}}%
\newcommand{\NormControllerSet}[1]{\renewcommand{\PcbDocNormController}{#1}}%
\newcommand{\TechControllerSet}[1]{\renewcommand{\PcbDocTechController}{#1}}%
\newcommand{\ApproverSet}[1]{\renewcommand{\PcbDocApprover}{#1}}%
\newcommand{\NameSet}[1]{\renewcommand{\PcbDocName}{#1}}%
\newcommand{\NumberSet}[1]{\renewcommand{\PcbDocNumber}{#1}}%
\newcommand{\PcbNumberSet}[1]{\renewcommand{\PcbNumber}{#1}}%
\newcommand{\PcbMaterialSet}[1]{\renewcommand{\PcbMaterial}{#1}}%
\newcommand{\PrimaryUseSet}[1]{\renewcommand{\PcbDocPrimaryUse}{#1}}%
\newcommand{\PpTtSet}[2]{%
  \renewcommand{\PcbDocPpTtFirst}{#1}%
  \renewcommand{\PcbDocPpTtNext}{#2}%
  }%
\newcommand{\SbTtSet}[2]{%
  \renewcommand{\PcbDocSbTtFirst}{#1}%
  \renewcommand{\PcbDocSbTtNext}{#2}%
  }%
\newcommand{\ShTtSet}[2]{%
  \renewcommand{\PcbDocShTtFirst}{#1}%
  \renewcommand{\PcbDocShTtNext}{#2}%
  }%

%\ifthenelse{\equal{\pcbdoctype}{spec}}{%
%  \renewcommand{\pcbdocpapersize}{a4}%
%  \PcbDocSizeChoice%
%  \setlength{\pcbdocpaperdeltawidth}{1mm}%
%  \setlength{\pcbdocpaperdeltaheight}{1mm}%
%  }{}%
%\ifthenelse{\equal{\pcbdoctype}{pe}}{%
%  \renewcommand{\pcbdocpapersize}{a4}%
%  \PcbDocSizeChoice%
%  \setlength{\pcbdocpaperdeltawidth}{0mm}%
%  \setlength{\pcbdocpaperdeltaheight}{1mm}%
%  }{}%
%\ifthenelse{\equal{\pcbdoctype}{in}}{%
%  \renewcommand{\pcbdocpapersize}{a4}%
%  \PcbDocSizeChoice%
%  \setlength{\pcbdocpaperdeltawidth}{-5mm}%
%  \setlength{\pcbdocpaperdeltaheight}{-5mm}%
%  }{}%
%\ifthenelse{\equal{\pcbdoctype}{sch}}{%
%  \setlength{\pcbdocpaperdeltawidth}{0.1mm}%
%  \setlength{\pcbdocpaperdeltaheight}{0.1mm}%
%  }{}%
%\ifthenelse{\equal{\pcbdoctype}{pp}}{%
%  \setlength{\pcbdocpaperdeltawidth}{0.1mm}%
%  \setlength{\pcbdocpaperdeltaheight}{0.1mm}%
%  }{}%
%\ifthenelse{\equal{\pcbdoctype}{sb}}{%
%  \setlength{\pcbdocpaperdeltawidth}{0.1mm}%
%  \setlength{\pcbdocpaperdeltaheight}{0.1mm}%
%  }{}%

\PcbDocLayoutSet%
\PcbDocBorderSet%

\AtBeginDocument{%
  }%

\AtEndDocument{%
  }%
