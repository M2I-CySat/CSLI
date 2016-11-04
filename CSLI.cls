%
%  `CSLI.cls' - a LaTeX(2e) class file used to typeset CSLI proposals

% AUTHOR: Peterp@iastate.edu
%Modified from NASA.cls, v1.54 2015/11/20 by Bill Wood (Bill.Wood@NASA.gov) and Bil Kleb (Bil.kleb@NASA.gov)

\NeedsTeXFormat{LaTeX2e}[1994/06/01]

\ProvidesClass{CSLI}[2016/9/26 v1 CSLI class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}%
                \typeout{NOTE: Passing '\CurrentOption' option on to the
                         underlying LaTeX article class}}


\newif\if@frontcovers
\@frontcoverstrue
%
\newif\if@coveronly
\@coveronlyfalse

%

\DeclareOption{coveronly}{\@coveronlytrue}
\DeclareOption{nocover}{\@frontcoversfalse}
\ProcessOptions

\setcounter{errorcontextlines}{999}% crank up debugging output

% load article class and appropriate supporting packages:
\LoadClass[oneside,12pt]{article}
\RequirePackage{graphicx}
%
%\RequirePackage{xcolor} % Uncomment to use xcolor.sty
%                                           There is a conflict with
%                                           \usepackage{xcolor} in the
%                                           body of the report.
%
\RequirePackage[paper=letterpaper, twoside, noheadfoot,%
                lmargin=1in, rmargin=1in,%
                tmargin=1.125in, bmargin=0.75in]{geometry}[1999/10/07]
\RequirePackage{ifthen} % ifthenelse
\RequirePackage{cite}% sorting, collapses multiple entries, etc.
%%%require packages
\RequirePackage{float}
\RequirePackage{enumitem}
\RequirePackage{tabularx}
\RequirePackage[table]{xcolor}

\RequirePackage{url}

\RequirePackage{subcaption}
\RequirePackage{pdfpages}
\RequirePackage[T1]{fontenc}
\RequirePackage{helvet}
\renewcommand{\familydefault}{\sfdefault}
% Redefine caption delimeters [original from article.cls]
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1. #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1. #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}

% Redefine the bibliography labels
\def\@biblabel#1{#1.}

% New appendix command
\renewcommand{\appendix}{%
 \renewcommand{\thesection}{\Alph{section}}%
 \renewcommand{\thefootnote}{\Alph{section}\arabic{footnote}}%
 \renewcommand{\thetable}{\Alph{section}\arabic{table}}%
 \renewcommand{\thefigure}{\Alph{section}\arabic{figure}}%
 \renewcommand{\theequation}{\Alph{section}\arabic{equation}}%
 \setcounter{section}{0}%
% \setcounter{secnumdepth}{1}% start ``numbering'' sections again
 \renewcommand{\section}{%
   \newpage\thispagestyle{plain}%
   \setcounter{footnote}{0}%
   \setcounter{table}{0}%
   \setcounter{figure}{0}%
   \setcounter{equation}{0}%
   \secdef\Appendix\Appendix%
 }
}

\newcommand{\Appendix}[2][?]{%
 \refstepcounter{section}%
 {\flushleft\Large\bfseries\appendixname\ \thesection\par%
  \vspace{\baselineskip}%
  #2\par%
  \vspace{\baselineskip}}%
  \addcontentsline{toc}{section}{\protect\numberline{\thesection}{#2}}%
}


% This section stolen from chngpage.sty by Peter Wilson
\begingroup
\catcode`\Q=3
\long\gdef\@ifmtarg#1{\@xifmtarg#1QQ\@secondoftwo\@firstoftwo\@nil}
\long\gdef\@xifmtarg#1#2Q#3#4#5\@nil{#4}
\endgroup
\DeclareRobustCommand{\ch@ngetext}{%
  \setlength{\@colht}{\textheight}\setlength{\@colroom}{\textheight}%
  \setlength{\vsize}{\textheight}\setlength{\columnwidth}{\textwidth}%
  \if@twocolumn%
    \advance\columnwidth-\columnsep \divide\columnwidth\tw@%
    \@firstcolumntrue%
  \fi%
  \setlength{\hsize}{\columnwidth}%
  \setlength{\linewidth}{\hsize}%
}
\DeclareRobustCommand{\changepage}[9]{%
  \@ifmtarg{#1}{}{\addtolength{\textheight}{#1}}%
  \@ifmtarg{#2}{}{\addtolength{\textwidth}{#2}}%
  \@ifmtarg{#3}{}{\addtolength{\evensidemargin}{#3}}%
  \@ifmtarg{#4}{}{\addtolength{\oddsidemargin}{#4}}%
  \@ifmtarg{#5}{}{\addtolength{\columnsep}{#5}}%
  \ch@ngetext%
  \@ifmtarg{#6}{}{\addtolength{\topmargin}{#6}}%
  \@ifmtarg{#7}{}{\addtolength{\headheight}{#7}}%
  \@ifmtarg{#8}{}{\addtolength{\headsep}{#8}}%
  \@ifmtarg{#9}{}{\addtolength{\footskip}{#9}}%
}






%%%%new commands for cover
\newcommand{\Number}[1]{\def\NC@number{
{\twelveptlarge Solicitation Number:}
#1}} \Number{}

%%%new commands for poc
\newcommand{\Namea}[1]{\def\NC@namea{
{\twelveptnormalsize Name:\hspace{5pt}}
#1}} \Namea{}

\newcommand{\Titlea}[1]{\def\NC@titlea{
{\twelveptnormalsize Title:\hspace{10pt}}
#1}} \Titlea{}

\newcommand{\Phonea}[1]{\def\NC@phonea{
{\twelveptnormalsize Phone:\hspace{2pt}}
#1}} \Phonea{}

\newcommand{\Emaila}[1]{\def\NC@emaila{
{\twelveptnormalsize E-mail:}
#1}} \Emaila{}

\newcommand{\Nameb}[1]{\def\NC@nameb{
{\twelveptnormalsize Name:\hspace{5pt}}
#1}} \Nameb{}

\newcommand{\Titleb}[1]{\def\NC@titleb{
{\twelveptnormalsize Title:\hspace{10pt}}
#1}} \Titleb{}

\newcommand{\Phoneb}[1]{\def\NC@phoneb{
{\twelveptnormalsize Phone:\hspace{2pt}}
#1}} \Phoneb{}

\newcommand{\Emailb}[1]{\def\NC@emailb{
{\twelveptnormalsize E-mail:}
#1}} \Emailb{}

\newcommand{\Namec}[1]{\def\NC@namec{
{\twelveptnormalsize Name:\hspace{5pt}}
#1}} \Namec{}

\newcommand{\Titlec}[1]{\def\NC@titlec{
{\twelveptnormalsize Title:\hspace{10pt}}
#1}} \Titlec{}

\newcommand{\Phonec}[1]{\def\NC@phonec{
{\twelveptnormalsize Phone:\hspace{2pt}}
#1}} \Phonec{}

\newcommand{\Emailc}[1]{\def\NC@emailc{
{\twelveptnormalsize E-mail:}
#1}} \Emailc{}

%%% New commands for Mission Parameters table
\newcommand{\Mission}[1]{\def\NC@mission{
#1}} \Mission{}

\newcommand{\Mass}[1]{\def\NC@mass{
#1}} \Mass{}

\newcommand{\Size}[1]{\def\NC@size{
#1}} \Size{}

\newcommand{\Altitude}[1]{\def\NC@altitude{
#1}} \Altitude{}

\newcommand{\Inclination}[1]{\def\NC@inclination{
#1}} \Inclination{}

\newcommand{\Min}[1]{\def\NC@min{
#1}} \Min{}

\newcommand{\Max}[1]{\def\NC@max{
#1}} \Max{}

\newcommand{\Acceptable}[1]{\def\NC@acceptable{
#1}} \Acceptable{}

\newcommand{\Readinessdate}[1]{\def\NC@readinessdate{
#1}} \Readinessdate{}

\newcommand{\Life}[1]{\def\NC@life{
#1}} \Life{}

%%%New commands for Project detail table
\newcommand{\Focus}[1]{\def\NC@focus{
#1}} \Focus{}

\newcommand{\Student}[1]{\def\NC@student{
#1}} \Student{}

\newcommand{\NASAfunding}[1]{\def\NC@nasafunding{
#1}} \NASAfunding{}

\newcommand{\NASAorg}[1]{\def\NC@nasaorg{
#1}} \NASAorg{}

\newcommand{\Sponsor}[1]{\def\NC@sponsor{
#1}} \Sponsor{}

\newcommand{\Collaborator}[1]{\def\NC@collaborator{
#1}} \Collaborator{}

\newcommand{\International}[1]{\def\NC@international{
#1}} \International{}


%%%%%%%%%
\renewcommand{\abstract}[1]{\def\@abstract{#1}}         \abstract{}

\renewcommand{\maketitle}{\relax}

%  Hardwire the font sizes for the covers

\newcommand\twelveptlarge{\@setfontsize\twelveptlarge\@xivpt{18}}
\newcommand\twelveptnormalsize{\@setfontsize\twelveptnormalsize\@xiipt{14.5}}
\newcommand\twelveptsmall{\@setfontsize\twelveptsmall\@xipt{13.6}}
\newcommand\twelveptfootnotesize{\@setfontsize\twelveptfootnotesize\@xpt\@xiipt}


%\AtBeginDocument{% AfterEndPreamble allows formatting that
%AtBeginDocument does not allow.
\RequirePackage{etoolbox}
\AfterEndPreamble{%
 \if@frontcovers
%
% cover page
%
 \setcounter{page}{-3}
 \pagestyle{empty}
 \renewcommand{\thanks}[1]{\\ #1}
 \begin{center}
 \vskip 1em%
 {\Huge\bfseries\@title\par}%
 \vskip 3em%
 \setlength{\parskip}{0pt}%
 {\twelveptlarge {\NC@number}\\
NASA/Goddard Space Flight Center\\
NASA Headquarters Acquisition Branch,\\
Code 210.H\\
Greenbelt, MD 20771  \par}%
 \vskip 2em%
 \includegraphics[height=2in]{CySat_logo}\par%
 \vfill%
 
% title page
%
 \onecolumn
  \setlength{\parskip}{0pt}%



\vskip 5em

\newenvironment{changemargin}[2]{%
\begin{list}{}{%
\setlength{\topsep}{0pt}%
\setlength{\leftmargin}{#1}%
\setlength{\rightmargin}{#2}%
\setlength{\listparindent}{\parindent}%
\setlength{\itemindent}{\parindent}%
\setlength{\parsep}{\parskip}%
}%
\item[]}{\end{list}}


\begin{twelveptsmall}

\begin{changemargin}{-1.5cm}{-1.5cm}

\begin{tabular}{|c|l|c|l|c|l|c|l|c|c|c|l|c|l|c|l|}
\arrayrulecolor{white}
\hline
\rowcolor{gray!80}
\multicolumn{16}{|c|}{\textcolor{white}{\textbf{CubeSat Mission Parameters}}}                                                                                                                                                                                                                                                                                                                      \\ \hline
\rowcolor{gray!10}
\multicolumn{2}{|c|}{Mission}  & \multicolumn{2}{c|}{Mass}   & \multicolumn{2}{c|}{Cube}      & \multicolumn{2}{c|}{Desired Orbit}      & \multicolumn{2}{c|}{Acceptable}    & \multicolumn{2}{c|}{400km @ 51.6}   & \multicolumn{2}{c|}{Readiness} & \multicolumn{2}{c|}{Desired}    \\
\rowcolor{gray!10}
\multicolumn{2}{|c|}{Name}  & \multicolumn{2}{c|}{}  & \multicolumn{2}{c|}{Size}   & \multicolumn{2}{c|}{{}}  & \multicolumn{2}{c|}{Orbit Range}   & \multicolumn{2}{c|}{degree incl.}   & \multicolumn{2}{c|}{Date}  & \multicolumn{2}{c|}{Mission}  \\
\rowcolor{gray!10}
\multicolumn{2}{|c|}{}  & \multicolumn{2}{c|}{}   & \multicolumn{2}{c|}{}  & \multicolumn{2}{c|}{}    & \multicolumn{2}{c|}{}  & \multicolumn{2}{c|}{Acceptable?}  & \multicolumn{2}{c|}{}  & \multicolumn{2}{c|}{Life}  \\ \hline
\rowcolor{gray!5}
\multicolumn{2}{|c|}{\multirow{2}{*}{}} & \multicolumn{2}{c|}{\multirow{2}{*}{}} & \multicolumn{2}{c|}{\multirow{2}{*}{}} & Altitude   & \multicolumn{1}{c|}{{\NC@altitude}} & \multirow{2}{*}{} & \multirow{2}{*}{} & \multicolumn{2}{c|}{\multirow{2}{*}{}} & \multicolumn{2}{c|}{\multirow{2}{*}{}} & \multicolumn{2}{c|}{\multirow{2}{*}{}} \\ \cline{7-8}
\rowcolor{gray!5}
\multicolumn{2}{|c|}{{\NC@mission}}   & \multicolumn{2}{c|}{{\NC@mass}}   & \multicolumn{2}{c|}{{\NC@size}}  & \multicolumn{1}{l|}{Inclination} & \NC@inclination  &  {\NC@min}   &  {\NC@max}   & \multicolumn{2}{c|}{\NC@acceptable}    & \multicolumn{2}{c|}{\NC@readinessdate}  & \multicolumn{2}{c|}{\NC@life}  \\ \hline
\end{tabular}
\end{changemargin}
\vskip 6em


\begin{changemargin}{-0.75cm}{-0.75cm}
\begin{tabular}{|c|l|c|l|c|c|c|l|c|c|}
\arrayrulecolor{white}
\hline
\rowcolor{gray!80}
\multicolumn{10}{|c|}{\textcolor{white}{\textbf{CubSat Project Details}}}                                                                                                \\ \hline
\rowcolor{gray!10}
\multicolumn{2}{|c|}{Focus Area(s)} & \multicolumn{2}{c|}{Student} & \multicolumn{2}{c|}{NASA Funding} & \multicolumn{2}{c|}{Sponsoring} & \multicolumn{2}{c|}{Collaborating} \\ \cline{5-6}
\rowcolor{gray!10}
\multicolumn{2}{|c|}{} & \multicolumn{2}{c|}{Involvement -} &    Yes or       &     Organization      & \multicolumn{2}{c|}{Organization(s)} & \multicolumn{2}{c|}{Organization(s)} \\ \cline{9-10} 
\rowcolor{gray!10}
\multicolumn{2}{|c|}{} & \multicolumn{2}{c|}{Yes or No} &      No     &           & \multicolumn{2}{c|}{} &      List     &     International -      \\
\rowcolor{gray!10}
\multicolumn{2}{|c|}{} & \multicolumn{2}{c|}{} &           &           & \multicolumn{2}{c|}{} &           &    Yes or No       \\ \hline
\rowcolor{gray!5}
\multicolumn{2}{|c|}{{\NC@focus}} & \multicolumn{2}{c|}{{\NC@student}} &    {\NC@nasafunding}       &       {\NC@nasaorg}    & \multicolumn{2}{c|}{{\NC@sponsor}} &    {\NC@collaborator}       &   {\NC@international}        \\ \hline
\end{tabular}
\end{changemargin}

\end{twelveptsmall}

\end{center} 

%points of contact 
 \onecolumn
 \setlength{\parskip}{0pt}%
{\flushleft\Large\bfseries Points of Contact\par}%
\vskip 2em%
{\twelveptnormalsize\NC@namea\par}%
\vskip 0.25em%
{\twelveptnormalsize\NC@titlea\par}%
\vskip 0.25em%
{\twelveptnormalsize\NC@phonea\par}%
\vskip 0.25em%
{\twelveptnormalsize\NC@emaila\par}%
\vskip 2em%
{\twelveptnormalsize\NC@nameb\par}%
\vskip 0.25em%
{\twelveptnormalsize\NC@titleb\par}%
\vskip 0.25em%
{\twelveptnormalsize\NC@phoneb\par}%
\vskip 0.25em%
{\twelveptnormalsize\NC@emailb\par}%
\vskip 2em%
{\twelveptnormalsize\NC@namec\par}%
\vskip 0.25em%
{\twelveptnormalsize\NC@titlec\par}%
\vskip 0.25em%
{\twelveptnormalsize\NC@phonec\par}%
\vskip 0.25em%
{\twelveptnormalsize\NC@emailc\par}%
\vskip 2em%


%
 \if@coveronly
  \end{document}
 \fi
 
 \newpage
%
 \fi % frontcovers
%
 \changepage{-0.5in}{-1in}{.5in}{.5in}{}{}{}{}{0.5in}
 \pagestyle{plain}
 \section*{Abstract}
 \@abstract\par
%
 
}% AtBeginDocument

%
% end of NASA.cls
