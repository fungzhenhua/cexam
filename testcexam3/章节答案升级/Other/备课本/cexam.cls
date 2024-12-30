%%
%% This is file `cexam.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% cexam.dtx  (with options: `class')
%% 
%%     Copyright (C) 2017--3000
%% ------------------------------------------------------------------------------
%%     cexam.dtx文件由冯振华创建,作者系平原县第一中学物理教师
%% 
%%     当前的维护者:冯振华
%% 
%%     邮件:fengzhenhua@sina.cn
%% 
%%     博客:fengzhenhua.blog.163.com
%% 
%% ------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{cexam}[2018/05/04 v1.0 for china middle school exam]
\RequirePackage{expl3}%
\RequirePackage{xparse}%
\LoadClass[fontset = founder]{ctexbook}%默认founder字体
\RequirePackage{cexam}
\RequirePackage{geometry}%
\RequirePackage{dashrule}%

\DeclareOption{twocolumn}{\PassOptionsToClass{twocolumn}{ctexbook}}%
\DeclareOption{onecolumn}{\PassOptionsToClass{onecolumn}{ctexbook}}%
\DeclareOption{student}{\PassOptionsToPackage{student}{cexam}}%
\DeclareOption{nowarning}{\PassOptionsToPackage{nowarning}{cexam}}%
\DeclareOption{b4paper}{%
  \geometry{paperwidth=250mm,paperheight=353mm}%
}%
\DeclareOption{b4paperjis}{%
  \geometry{paperwidth=257mm,paperheight=364mm}%
}%
\DeclareOption{a4paper}{%
  \geometry{%
    paperwidth=210mm,
    paperheight=297mm,
    left=2.00cm,
    right=2.00cm,
    top=2.00cm,
    bottom=2.00cm
  }%
}%
\DeclareOption{exampaper}{%
  \geometry{%
    paperwidth=353mm,
    paperheight=250mm,
    left=3.00cm,
    right=3.00cm,
    top=2.00cm,
    bottom=2.00cm
  }%
}%
\DeclareOption{exampaperjis}{%
  \geometry{%
    paperwidth=364mm,
    paperheight=257mm,
    left=3.00cm,
    right=3.00cm,
    top=2.00cm,
    bottom=2.00cm
  }%
}%
\ProcessOptions%
\newboolean{studentsub}
\AtBeginDocument{%
  \closeout\@ans%
  \ifthenelse{\boolean{student}}{%
    \setboolean{studentsub}{true}%
    \setboolean{student}{false}%
  }{%
    \relax%
  }%
}%
\newlength{\columnsepruledash}%
\def\@outputdblcol{%
  \if@firstcolumn
    \global\@firstcolumnfalse
    \global\setbox\@leftcolumn\copy\@outputbox
    \splitmaxdepth\maxdimen
    \vbadness\maxdimen
     \setbox\@outputbox\vbox{\unvbox\@outputbox\unskip}%
     \setbox\@outputbox\vsplit\@outputbox to\maxdimen
    \toks@\expandafter{\topmark}%
    \xdef\@firstcoltopmark{\the\toks@}%
    \toks@\expandafter{\splitfirstmark}%
    \xdef\@firstcolfirstmark{\the\toks@}%
    \ifx\@firstcolfirstmark\@empty
      \global\let\@setmarks\relax
    \else
      \gdef\@setmarks{%
        \let\firstmark\@firstcolfirstmark
        \let\topmark\@firstcoltopmark}%
    \fi
  \else
    \global\@firstcolumntrue
    \setbox\@outputbox\vbox{%
     \hb@xt@\textwidth{%
        \hb@xt@\columnwidth{\box\@leftcolumn \hss}%
        \hfil
\ifthenelse{\dimtest{\columnsepruledash}{>}{0pt}}{%
  {\normalcolor\rotatebox{90}{%
    \hdashrule{\pagegoal}{\columnseprule}{\columnsepruledash}%
  }}%
}{%
  {\normalcolor\vrule \@width\columnseprule}%
}%
        \hfil
       \hb@xt@\columnwidth{\box\@outputbox \hss}}}%
  \@combinedblfloats
    \@setmarks
    \@outputpage
    \begingroup
      \@dblfloatplacement
      \@startdblcolumn
      \@whilesw\if@fcolmade \fi{\@outputpage
     \@startdblcolumn}%
    \endgroup
  \fi}%
\ExplSyntaxOn
\RenewDocumentCommand \CTEXsetup { +o > { \TrimSpaces } m }%
{
  \IfNoValueF {#1} { \keys_set:nn { ctex / #2 } {#1} }
}
\cs_set:Npn \__fontspec_warning:n   {}
\cs_set:Npn \__fontspec_warning:nx #1#2 {}
\cs_set:Npn \__fontspec_warning:nxx #1#2#3 {}
\ExplSyntaxOff

\def\thesection{\@arabic{\c@section}}%
\def\thesubsection{\@arabic{\c@subsection}}%
\CTEXsetup[name={第~,~节}]{section}%
\CTEXsetup[%
  name={,、~\hspace{-1.5\ccwd}},number={\chinese{subsection}},format={\heiti}%
]{subsection}
\let\cex@mnumold=\cex@mnum
\def\cex@mnum{\makebox[0pt][r]{\heiti 例} \thecex@mNumber.}%
\renewcommand{\setcex@mNumber}{%
  \stepcounter{cex@mNumber}%
  \resetcex@mNumber%
}%
\def\Exercises{%
  \newpage%
  \setcounter{chapter}{0}%
  \setcounter{cex@mNumber}{0}%
  \let\cex@mnum=\cex@mnumold%
  \def\theHchapter{b\arabic{chapter}}%
  \ifthenelse{\boolean{studentsub}}{%
    \setboolean{student}{true}%
    \openout\@ans=\jobname.ans%
  }{%
    \relax%
  }%
  \CTEXsetup[name={训练~,}]{section}%
  \CTEXsetup[%
    name={题组,},number={\chinese{subsection}},format={\heiti}%
  ]{subsection}%
  \renewcommand{\setcex@mNumber}{%
    \stepcounter{cex@mNumber}%
    \settowidth{\cex@mShIn}{\thecex@mNumber}%
    \addtolength{\cex@mShIn}{.4\ccwd}%
    \setlength{\cex@mShInS}{\cex@mShIn+1.2\ccwd}%
    \setlength{\cex@mlinewd}{\linewidth-\cex@mShIn}%
  }%
}%
%% This package consists of the file cexam.dtx
%%
%% End of file `cexam.cls'.
