%%
%% This is the file `degruyter-crelle.cls'.
%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{degruyter-crelle}[2013/03/21 v2.1]
%%
%% LaTeX document class for Crelle's Journal.
%% By Dimler & Albroscheit Partnerschaft (www.dimler-albroscheit.de).
%%
%% v1.2 -- First public release.
%% v2.0 -- New baselineskip: 13.9pt
%% v2.1 -- Class option `Submssn'
%%
%% Dear Authors:
%% -- Please use the class options `Submssn' and `CM' (=Computer Modern).
%% -- Use the class option `SecEq' if you prefer the equations numbered by section.
%% -- Use the class option `German' or `French' for non-English papers.
%% -- Ensure that for the following packages you don't use older versions than stated:
%% --   amsthm.sty: 2004/08/06
%% --   geometry.sty: 2008/12/21
%% --   enumitem.sty: 2011/09/28
%% --   ltxcmds.sty: 2011/03/16
%% -- Break addresses using \break.
%% -- We use \raggedbottom.
%% -- Mysterious problems with amscd:
%%      \begin{CD} X_{1} @>>> 0\end{CD} does NOT work, but
%%      \begin{CD} X_1 @>>> 0\end{CD} does.
%%
\RequirePackage{ifthen}

\newif\ifCM\CMfalse
\newif\ifAoP\AoPfalse
\newif\ifGP\GPfalse
\newif\ifSubmssn\Submssnfalse
\newif\ifSecEq\SecEqfalse
\newif\ifGerman\Germanfalse
\newif\ifFrench\Frenchfalse
\newif\ifTA\TAfalse
\newif\ifFrame\Framefalse

%---------------%
% Class options %
%---------------%

\DeclareOption{CM}{\CMtrue}           % Use Computer Modern
\DeclareOption{AoP}{\AoPtrue}         % Ahead-of-Print version
\DeclareOption{GP}{\GPtrue}           % Galley proof
\DeclareOption{Submssn}{\Submssntrue} % Submission
\DeclareOption{SecEq}{\SecEqtrue}     % Equations numbered by section
\DeclareOption{German}{\Germantrue}   % Articles in German (ngerman)
\DeclareOption{French}{\Frenchtrue}   % Articles in French
\DeclareOption{TA}{\TAtrue}           % Shows a frame around the type area
\DeclareOption{Frame}{\Frametrue}     % Shows a frame (for testing only)
\DeclareOption{Erratum}{}             % Now relevance in LaTeX. Just an indicator.

%% Ensure that the `draft' option is passed to the article class:
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
%% The current class is based on the article class:
\LoadClass[11pt,onecolumn]{article}


%----------%
% Packages %
%----------%

\RequirePackage{booktabs} %\toprule etc. in tables
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{textcomp}
\RequirePackage{latexsym}
\RequirePackage[leqno]{amsmath} %% Changes to \tagform@ below.
\RequirePackage{amsthm}[2004/08/06] %% Changes below.
\RequirePackage{calc}
\RequirePackage[noadjust]{cite} %% Changes to \cite below.
%% NB: In Crelle use only one entry per \cite command.
\RequirePackage[cmyk]{xcolor}
\RequirePackage{graphicx}
\RequirePackage{grffile} %Allows dots in file names (e.g. of figures)
\RequirePackage{multirow}
\RequirePackage{ragged2e}
\RequirePackage[figuresright]{rotating}
\RequirePackage{stmaryrd} %e.g. \llbracket
\RequirePackage{tabularx}
%% \RequirePackage{url} %% use hyperref instead (see below)
\RequirePackage{verbatim}
\RequirePackage{xspace}

%---------------------------------------------%
% Fonts (before loading the geometry package) %
%---------------------------------------------%
\RequirePackage[scaled=0.92]{helvet}

\renewcommand{\rmdefault}{ptm}  %= Adobe Times
%% The monospaced font must
%% (a) be distinguishable from the sans-serif (Helvetica), and
%% (b) have the same x-height as the roman (Adobe Times).
\renewcommand{\ttdefault}{lmtt} %= Latin Modern Typewriter
%% \RequirePackage[scaled=1.0]{couriers} %= Courier

\ifthenelse{\boolean{CM}}%
	{\RequirePackage{amsfonts,amssymb}}%
	{\RequirePackage[mtphrb,mtpfrak,mtpcal,straightbraces,subscriptcorrection]{mtpro2}[2009/1/30]}
%% The packages amsfonts, amssymb, exscale are not compatible with mtpro2.

\renewcommand\cal{\ClassError{degruyter-crelle}%
  {The `\protect\cal' command is not supported.}%
  {Replace `\protect\cal' by `\protect\mathcal'.}}

\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}

\DeclareSymbolFont{SFmathgreek}{OT1}{txss}{m}{n}   %TX Sans
\SetSymbolFont{SFmathgreek}{bold}{OT1}{txss}{b}{n} %TX Sans bold
\DeclareMathSymbol{\sfSigma}{\mathalpha}{SFmathgreek}{"06}
\DeclareMathSymbol{\sfGamma}{\mathalpha}{SFmathgreek}{"00}
\DeclareMathSymbol{\sfDelta}{\mathalpha}{SFmathgreek}{"01}
\DeclareMathSymbol{\sfTheta}{\mathalpha}{SFmathgreek}{"02}
\DeclareMathSymbol{\sfLambda}{\mathalpha}{SFmathgreek}{"03}
\DeclareMathSymbol{\sfXi}{\mathalpha}{SFmathgreek}{"04}
\DeclareMathSymbol{\sfPi}{\mathalpha}{SFmathgreek}{"05}
\DeclareMathSymbol{\sfUpsilon}{\mathalpha}{SFmathgreek}{"07}
\DeclareMathSymbol{\sfPhi}{\mathalpha}{SFmathgreek}{"08}
\DeclareMathSymbol{\sfPsi}{\mathalpha}{SFmathgreek}{"09}
\DeclareMathSymbol{\sfOmega}{\mathalpha}{SFmathgreek}{"0A}

%% Change the vertical spaces of lists for normalfontsize
%% as defined in bk11.clo:

\def\@listi{\leftmargin\leftmargini
  \parsep 2.5\p@ \@plus2\p@ \@minus\p@  %% rather than 4.5 + 2.0 - 1.0
  \topsep 6\p@ \@plus2\p@ \@minus2\p@  %% rather than 9.0 + 3.0 - 5.0
  \itemsep 3\p@ \@plus2\p@ \@minus\p@   %% rather than 4.5 + 2.0 - 1.0
}
\let\@listI\@listi
\@listi

\def\@listii{%
  \leftmargin\leftmarginii
  \labelwidth\leftmarginii
  \advance\labelwidth-\labelsep
  \topsep 2.5\p@ \@plus2\p@ \@minus\p@  %% rather than 4.5 + 2.0 - 1.0
  \parsep 2\p@ \@plus\p@  \@minus\p@
  \itemsep \parsep
}

%% The default font sizes are
%%   normal: \@xipt/13.6  = 10.95/13.6
%%   small: \@xpt/\@xiipt = 10.0/12.0
%%   footnote:  \@ixpt/11 =  9.0/11.0
%% as defined in bk11.clo (loaded by article.cls), see also
%% \doc\latex\base\classes.pdf
%%
%% Crelle uses a different values for the baselineskip of normalsize and footnotesize.
%% Instead of using, e.g., \linespread{0.94}, we redefine as follows:

\renewcommand\normalsize{%
   \@setfontsize\normalsize\@xipt{13.9}% %% new value
   \abovedisplayskip 11\p@ \@plus3\p@ \@minus6\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}
\normalsize

\renewcommand\footnotesize{%
   \@setfontsize\footnotesize\@ixpt{10.8}% %% new value
   \abovedisplayskip 8\p@ \@plus2\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus\p@
   \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 4\p@ \@plus2\p@ \@minus2\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip}

%------------------------------------------%
% Type area and genereal layout parameters %
% that differ from article.cls.            %
%------------------------------------------%
\RequirePackage[%
  asymmetric,%  % margins are not swapped on alternate pages
  hmarginratio=1:1,%
  paperwidth=210mm,%
  paperheight=280mm,%
  textwidth=145mm,%
  lines = 46,%
  %% textheight = (lines - 1) x \baselineskip + \topskip
  %% = (46 - 1) x 13.9pt + 11pt (see above and in bk11.clo)
  %% = 636.5pt ~ 223.7mm (1mm = 2.845pt)
  top=21mm,%
  %% bottom = paperheight - textheight - top
  %% = 280mm - 223.8mm - 21mm = 35.2mm
  %% top:bottom ~ 3:5
  headheight=6mm,%
  headsep=5mm,%
  marginparwidth=22mm,%
  marginparsep=5mm,%
  bindingoffset=0mm]{geometry}[2008/12/21]

\newlength\CrelleIndent
\newlength\CrelleSpaceAfterDot
\newlength\CrelleBlankLine
\newlength\CrelleBlankLineFlex
\newlength\CrelleDoubleBlankLine

\setlength\CrelleIndent{9mm}
\setlength\CrelleSpaceAfterDot{.9em}
\setlength\CrelleBlankLine{1\baselineskip plus 3pt minus 1pt}
\setlength\CrelleBlankLineFlex{1\baselineskip plus 6pt minus 1pt}
\setlength\CrelleDoubleBlankLine{2\baselineskip plus 6pt minus 2pt}

\parindent\CrelleIndent
\renewcommand{\baselinestretch}{1.0}
\renewcommand{\arraystretch}{1.2}

\setlength\multlinegap{\CrelleIndent}

%% Maximum number of floats per page:
\setcounter{topnumber}{5}
\setcounter{bottomnumber}{5}
\setcounter{totalnumber}{10}
%% Maximum fraction of page for floats:
\renewcommand{\topfraction}{0.8}
\renewcommand{\bottomfraction}{0.8}
%% Minimum fraction of page for text:
\renewcommand{\textfraction}{0.1}
%% Minimum fraction of floatpage that should have floats:
\renewcommand{\floatpagefraction}{0.2}
%% Stretch at top of float page (0pt = p-objects at top of page):
\setlength{\@fptop}{0pt}
%% Space between adjacent floats on top or bottom (default 12+2-2):
\setlength{\floatsep}{16pt plus 2pt minus 2pt}
%% Space between adjacent floats on float page:
\setlength{\@fpsep}{\floatsep}
%% Analogue for double-columns:
\setcounter{dbltopnumber}{5}
\renewcommand{\dbltopfraction}{0.7}
\renewcommand{\dblfloatpagefraction}{0.5}
\setlength{\@dblfptop}{0pt}
\setlength{\dblfloatsep}{\floatsep}
\setlength{\@dblfpsep}{\dblfloatsep}

%% \flushbottom %% Stretches each page to full textheight.
\raggedbottom %% No extra vertical space is added.

%---------------------------------%
% Avoid breaking in-line formulas %
%---------------------------------%
%% www.tex.ac.uk/cgi-bin/texfaq2html?label=brkinline
\relpenalty=10000
\binoppenalty=10000

%% Suppress widows and orphans:
% \clubpenalty=10000
% \widowpenalty=10000
% \displaywidowpenalty = 10000


%---------------%
% Miscellaneous %
%---------------%

\ifFrame
 \RequirePackage{showframe}
\fi

\ifTA
 \RequirePackage{eso-pic}
 \AddToShipoutPicture{\AtTextLowerLeft{%
 \put(\LenToUnit{0pt},\LenToUnit{0pt}){\framebox(\LenToUnit{\textwidth},\LenToUnit{\textheight}){}}}}
\fi

\newcommand\PrintElement[2]{%
	\csname #1#2 \endcsname%
}

\newcommand\xprint[1]{\ignorespaces #1\unskip}

%% 0.4pt is the default value for \hrule, e.g. in \footnoterule
\newcommand\crellebar{\rule{30mm}{.4pt}}
\newcommand\crellename{J.~reine~angew.~Math.}

%---------%
% Authors %
%---------%

\newcounter{@AuthorCounter}
\setcounter{@AuthorCounter}{0}
\newcounter{@AddressCounter}
\setcounter{@AddressCounter}{0}
\newcounter{@CurAuthor}

\renewcommand\author[4]{% %% The 3rd parameter is just for post-processing.
  \stepcounter{@AuthorCounter}
  \expandafter\def\csname firstname\the\value{@AuthorCounter} \endcsname{\xprint{#1}}
  \expandafter\def\csname lastname\the\value{@AuthorCounter} \endcsname{\xprint{#2}}
  \expandafter\def\csname city\the\value{@AuthorCounter} \endcsname{\xprint{#4}}
}

\newcommand\contact[2]{
  \stepcounter{@AddressCounter}
  \expandafter\def\csname address\the\value{@AddressCounter} \endcsname{#1}
  \expandafter\def\csname email\the\value{@AddressCounter} \endcsname{#2}
}

\newcommand\headlineauthor[1]{\def\@headlineauthor{#1}}

\def\@appendixlastname{}
\newcommand\appendixauthor[4]{% %% The 3rd parameter is just for post-processing.
  \def\@appendixfirstname{\xprint{#1}}
  \def\@appendixlastname{\xprint{#2}}
  \def\@appendixcity{\xprint{#4}}
}

\newcommand\appendixcontact[2]{
 \def\@appendixaddress{#1}
 \def\@appendixemail{#2}
}


%---------%
% Article %
%---------%
\renewcommand\title[2][]{%
  \def\@title{#2}%
  \ifthenelse{\equal{#1}{}}%
    {\def\@headlinetitle{#2}}%
    {\def\@headlinetitle{#1}}
}

\newcommand\researchsupported[1]{\def\@researchsupported{#1}}
\newcommand\dedicated[1]{\def\@dedicated{#1}}
\newcommand\volume[1]{\def\@volume{#1}}
\newcommand\volumeyear[1]{\def\@volumeyear{#1}}
\newcommand\copyrightyear[1]{\def\@copyrightyear{#1}}
\newcommand\doiyear[1]{\def\@doiyear{#1}}
\newcommand\doi[1]{\def\@doi{#1}}
\newcommand\received[1]{\def\@received{#1}}
\newcommand\revised[1]{\def\@revised{#1}}

\newcounter{startpage}
\ifthenelse{\boolean{GP}\or\boolean{AoP}\or\boolean{Submssn}}%
  {\newcommand\firstpage[1]{\setcounter{startpage}{1}}}
  {\newcommand\firstpage[1]{\setcounter{startpage}{#1}}}

%----------%
% Defaults %
%----------%
\newcommand\MissingInfo{\textcolor{red}{\textbf{???}}}

\title{\MissingInfo}
\headlineauthor{}
\researchsupported{}
\dedicated{}
\volume{\MissingInfo}
\volumeyear{\MissingInfo}
\copyrightyear{\MissingInfo}
\doiyear{\MissingInfo}
\doi{\MissingInfo}
\received{\MissingInfo}
\revised{}


%------------------%
% Section headings %
%------------------%

\setcounter{secnumdepth}{2}

\RequirePackage[center,tiny,indentafter]{titlesec}
\titlelabel{\thetitle.\hspace{.5em}}

\titleformat{\section}[hang]
  {\bfseries\boldmath\filcenter}{\thesection.}%
  {.5\CrelleSpaceAfterDot}% space after label
  {}[]
\titlespacing{\section}{0pt}%
  {\CrelleDoubleBlankLine}% space before (vertical)
  {\CrelleBlankLine}% space after (vertical)
  [0pt]

\titleformat{\subsection}[runin]%
  {\bfseries\boldmath\filright}{\thesubsection.}%
  %% Don't use \RaggedRight, although \RaggedRight seems to have a better
  %% hyphenation algorithm.
  {.5\CrelleSpaceAfterDot}% space after label
  {}[.]
\titlespacing*{\subsection}{\CrelleIndent}%
  {\CrelleBlankLineFlex}% space before (vertical)
  {\CrelleSpaceAfterDot}% space after (horizontal)
  []

\titleformat{\subsubsection}[runin]%
  {\bfseries\boldmath\filright}{\thesubsubsection.}%
  {.5\CrelleSpaceAfterDot}% space after label
  {}[.]
\titlespacing*{\subsubsection}{\CrelleIndent}%
  {\CrelleBlankLineFlex}% space before (vertical)
  {\CrelleSpaceAfterDot}% space after (horizontal)
  []

\titleformat{\paragraph}[runin]%
  {\bfseries\boldmath\filright}{\theparagraph.}
  {.5\CrelleSpaceAfterDot}% space after label
  {}[.]
\titlespacing*{\paragraph}{\CrelleIndent}%
  {\CrelleBlankLineFlex}% space before (vertical)
  {\CrelleSpaceAfterDot}% space after (horizontal)
  []

\newcommand\acknowl[1]{\paragraph{\Acknowledgmentsname}#1}

%-----------%
% Footnotes %
%-----------%

%% The \vfill forces footnotes to the bottom of the page,
%% which is necessary since \raggedbottom is in effect.
%% 30mm is the width of the line.
\renewcommand\footnoterule{%
  \kern-3\p@ \vfill
  \hrule width 30mm
  \kern2.6\p@}

\newcommand\crellefntext{%
  \long\def\@makefnmark{\mbox{\textsuperscript{\normalfont\@thefnmark)}}}
  \long\def\@makefntext##1{%
    \parindent\CrelleIndent
    \makebox[1.2em][l]{\@makefnmark}##1}
}

\crellefntext

\newcommand\makeresearchsupported{%
  \ifthenelse{\equal{\@researchsupported}{}}{}%
  {\let\thefootnotetwo=\thefootnote%
   \renewcommand{\thefootnote}{}%
   \long\def\@makefntext##1{%
     \parindent\CrelleIndent
	 \hb@xt@0em{}##1}%
   \footnotetext{\@researchsupported}
   \let\thefootnote=\thefootnotetwo%
   \crellefntext%
}}

%------------%
% Title page %
%------------%

\newcommand\PageRangeGalley{%
  \ifthenelse{\equal{\thestartpage}{\pageref{LastPage}}}%
    {1~page}{\pageref{LastPage}~pages}
}

\newcommand\PageRangeFinal{%
  \ifthenelse{\equal{\thestartpage}{\pageref{LastPage}}}%
    {\thestartpage}%
	{\thestartpage\kern.5pt--\kern.5pt\pageref{LastPage}\ }%
    %% Don't delete the last \ (warum auch immer)
}

\newcommand\journalname{Journal f\"ur die reine und angewandte Mathematik}

\newcommand\TitlePageReferenceLineI{%
  \ifAoP% %% Ahead-of-Print
    \crellename, Ahead of Print \hfill\journalname
  \else
	\ifGP% %% Galleys Proof
      \crellename, \textbf{\textcolor{red}{Galley Proof}},~\PageRangeGalley\hfill\journalname
    \else%
  	  \ifSubmssn% %% Submission
        \textbf{\textcolor{red}{Submitted to}}
      \else% %% Otherwise
        \crellename~\textbf{\@volume}~(\@volumeyear),~\PageRangeFinal\hfill\journalname
      \fi
    \fi
  \fi
}

\newcommand\TitlePageReferenceLineII{%
  \ifSubmssn% %% Submission
    \textbf{\textcolor{red}{\journalname}}
  \else% %% Otherwise
    DOI 10.1515\kern1pt/\kern1pt crelle-\@doiyear-\@doi
    \hfill\copyright~De~Gruyter~\@copyrightyear
  \fi
}


\renewcommand\maketitle{%
  \MakeAuthors%
  \newpage%
  \thispagestyle{empty}%
  \global\@topnum\z@   % Prevents figures from going at top of page.
  {\footnotesize
  \noindent \TitlePageReferenceLineI\\
  \TitlePageReferenceLineII\par}
  \vspace{20mm}
  \begin{center}
  {\huge\@title\par}
  \vspace*{\baselineskip}
  \Byname~\@TitlepageAuthors
  \ifthenelse{\equal{\@appendixlastname}{}}{}
    {\par\vspace*{.2\baselineskip}
    \WithAppendix~\textit{\@appendixfirstname~\@appendixlastname}~\Atname~\@appendixcity}
  \par\vspace*{.8\baselineskip}
  \ifthenelse{\equal{\@dedicated}{}}{}
    {\itshape\xprint{\@dedicated}
    \par\vspace*{.8\baselineskip}}
  \crellebar%
  \vspace*{-2mm}
  \end{center}%
  \makeresearchsupported
}

\renewenvironment{abstract}{\paragraph{\abstractname}}{}


%--------------%
% Running Head %
%--------------%

\RequirePackage{fancyhdr}
\pagestyle{fancy}
\renewcommand\headrulewidth{0pt}
\fancyhf{} %% clear all header and footer fields
\fancyhead[RO,LE]{\normalsize\thepage}
\fancyhead[C]{\@RunningHead} %defined in \MakeAuthors

\newdimen\RunningHeadWidth
\RunningHeadWidth=120mm

\newcommand\MakeAuthors{%
  %% Define the author names for the title page:
  \def\@TitlepageAuthors{%
	%% Define a counter to loop over all authors.
    %% The first author is added directly.
	\setcounter{@CurAuthor}{1}%
    \textit{\PrintElement{firstname}{1}~%	
    \PrintElement{lastname}{1}}~\Atname~%
    \PrintElement{city}{1}% %% Don't delete the %-sign.
	%% Loop over the 2nd to last author.
    \whiledo{\value{@CurAuthor}<\value{@AuthorCounter}}{%
      \stepcounter{@CurAuthor}
	  \ifthenelse{\value{@CurAuthor}=\value{@AuthorCounter}}%
	    {\unskip\ \Andname\ }%
		{\unskip, }%
	  \textit{\PrintElement{firstname}{\the\value{@CurAuthor}}~%
	  \PrintElement{lastname}{\the\value{@CurAuthor}}}~\Atname~%
	  \PrintElement{city}{\the\value{@CurAuthor}}% %% Don't delete the %-sign.
	}
  }
  %% Define the running head:
  \def\@RunningHead{%
      \footnotesize\rmfamily\itshape\unboldmath\ignorespaces
      %% If \@headlineauthor is empty,
      %% the header is generated from the \lastname values.
	  \ifthenelse{\equal{\@headlineauthor}{}}{
	    %% Define a counter to loop over all authors.
        %% The first author is added directly.
		\setcounter{@CurAuthor}{1}%
		\PrintElement{lastname}{1}%
		%% Loop over the 2nd to last author.
        \whiledo{\value{@CurAuthor}<\value{@AuthorCounter}}{%
		  \stepcounter{@CurAuthor}
		  \ifthenelse{\value{@CurAuthor}=\value{@AuthorCounter}}%
		    {\unskip~\Andname~}%
			{\unskip,~}%
		  \PrintElement{lastname}{\the\value{@CurAuthor}}%
	    }}%
	    {%% If \@headlineauthor is not empty:
		  \@headlineauthor\unskip%
		}%
      %% Add the headlinetitle:
      ,~\upshape\@headlinetitle\unskip}
  %% Check whether \@RunningHead is too long
  \newbox\tempbox
  \setbox\tempbox=\hbox{\@RunningHead}
  \ifdim\wd\tempbox>\RunningHeadWidth
    \def\@RunningHead{\textbf{Provide a shorter running head using
	  \textbackslash headlinetitle or \textbackslash headlineauthor}}
  \fi
}

%-----------------------------%
% Addresses and History dates %
%-----------------------------%

\newcommand\historydates{%
  \ifSubmssn% %% Submission
    \label{LastPage}
  \else% %% Otherwise
    Eingegangen \xprint{\@received}%
    \ifthenelse{\equal{\@revised}{}}{}%
      {, in revidierter Fassung \xprint{\@revised}}%
    \label{LastPage}
  \fi
}

\newcommand\makeauthordata{%
  \vskip.8\baselineskip %% \vksip to avoid extra space at top of the page
  \noindent
  \begin{minipage}[b]{\textwidth} %% to avoid pagebreaks within this block
  \footnotesize\centering
  \crellebar
  \par\vspace*{\baselineskip}
  \setcounter{@CurAuthor}{0}
  \whiledo{\value{@CurAuthor}<\value{@AddressCounter}}{%
    \stepcounter{@CurAuthor}%
      \edef\tempemail{\PrintElement{email}{\the\value{@CurAuthor}}}
      \PrintElement{firstname}{\the\value{@CurAuthor}}
      \PrintElement{lastname}{\the\value{@CurAuthor}},
      \PrintElement{address}{\the\value{@CurAuthor}}%
      \ifthenelse{\equal{\tempemail}{}}{}%
        {\par% %% Don't use \newline because of \centering.
         e-mail:~\tempemail}
    \par\vspace*{\baselineskip}
  }
  \ifthenelse{\equal{\@appendixlastname}{}}{}
    {\@appendixfirstname~\@appendixlastname, \@appendixaddress\par e-mail:~\@appendixemail
    \par\vspace*{\baselineskip}}
  \historydates
  \end{minipage}
  %%\enlargethispage{\baselineskip}  %No need for this line.
}

%------------------------------%
% At begin and end of document %
%------------------------------%

\let\origdocument\document
\def\document{%
  \origdocument%
  \setcounter{page}{\value{startpage}}%
  \bibliographystyle{crelle}%
  \maketitle}

\let\endorigdocument\enddocument
\def\enddocument{\makeauthordata\endorigdocument}


%-----------------------------------%
% Captions of floating environments %
%-----------------------------------%
%% Although the caption package gives a compatibility warning,
%% it is supported by our document class.

\RequirePackage[style=base]{caption}
\DeclareCaptionLabelSeparator{crelleperiod}{.\hskip\CrelleSpaceAfterDot}
\captionsetup{format=hang,margin=\parindent,justification=justified,%
  singlelinecheck=true,font=footnotesize,labelsep=crelleperiod}
\RequirePackage[margin=0pt]{subfig}

%% Centering all floats (i.e., figures and tables):
\g@addto@macro\@floatboxreset{\centering}

\graphicspath{{./figures/}}

%----------%
% Tabulars %
%----------%

\newcolumntype{C}{>{\centering\arraybackslash}X}          % c-column
\newcolumntype{L}{>{\RaggedRight\arraybackslash}X}        % l-column
\newcolumntype{R}{>{\RaggedLeft\arraybackslash}X}         % r-column
\newcolumntype{Y}[1]{>{\centering\arraybackslash}p{#1}}   % c-column, width fixed
\newcolumntype{Z}[1]{>{\RaggedRight\arraybackslash}p{#1}} % l-column, width fixed
\newcolumntype{S}[1]{>{\RaggedLeft\arraybackslash}p{#1}}  % r-column, width fixed

%----------%
% Appendix %
%----------%

%% default

%------------------------------------------%
% Table of contents (without page numbers) %
%------------------------------------------%
\RequirePackage{titletoc}
\setcounter{tocdepth}{2}

%% The definition with \addvspace{2pt} also adds space before the first entry,
%% i.e., after the ``Contents'' heading -- which is undesirable.
%% \titlecontents{section}[16mm]{\addvspace{2pt}\filright}
\titlecontents{section}[16mm]{\filright}
  {\contentslabel[\thecontentslabel.]{7mm}}
  {\hspace*{-7mm}}{}
  % Die Differenz von EINZUG (16mm) und BOX (7mm) muss \CrelleIndent (9mm) ergeben!

\titlecontents{subsection}[25mm]{\filright}
  {\contentslabel[\thecontentslabel.]{\CrelleIndent}}
  {\hspace*{-\CrelleIndent}}{}
  % Die Differenz von EINZUG (25) und BOX (9) muss den EINZUG von section ergeben!

\titlecontents{subsubsection}[31mm]{\filright}
  {\contentslabel[\thecontentslabel.]{15mm}}
  {\hspace*{-15mm}}{}
  % Die Differenz von EINZUG (31) und BOX (15) muss den EINZUG von section ergeben!

\def\contentsnamefont{\bfseries}
%% Overwrites the default of amsart.cls


%---------------%
% \cite upright %
%---------------%

\def\@cite#1#2{\leavevmode \cite@adjust{\upshape
  \citeleft{#1\if@tempswa \citemid #2\fi
  \spacefactor\@m % punctuation in note doesn't affect outside
  }\citeright}}

%--------------%
% Bibliography %
%--------------%

\newlength\CrelleBibParsep
\setlength\CrelleBibParsep{0pt}
\newlength\CrelleBibItemsep
%% Have the bibliography as short as possible:
\setlength\CrelleBibItemsep{0pt} %% rather than {3pt plus 2pt minus 1pt}

\renewenvironment{thebibliography}[1]{%
  \ifFrench
   \shorthandoff{?!:;} % Disables the French behaviour.
  \fi
  \section*{\refname}%
  \addcontentsline{toc}{section}{\refname}
  \footnotesize
  \list{\@biblabel{\@arabic\c@enumiv}}{%
    \settowidth\labelwidth{\@biblabel{#1}}%
	\leftmargin\labelwidth
	\advance\leftmargin\labelsep
	\setlength{\itemsep}{\CrelleBibItemsep}
	\setlength{\parsep}{\CrelleBibParsep}
	\usecounter{enumiv}%
	\let\p@enumiv\@empty
	\renewcommand\theenumiv{\@arabic\c@enumiv}%
  }%
  \sloppy\clubpenalty4000\widowpenalty4000%
  \sfcode`\.=\@m}
{ \def\@noitemerr{\@latex@warning{Empty `thebibliography' environment}}%
  \endlist}

%-------------------------------%
% Enumerated and itemized lists %
%-------------------------------%

\RequirePackage[shortlabels]{enumitem}[2011/09/28]
%% ``shortlabels'' allows one to write, e.g., \begin{enumerate}[(1)]

\setlist[enumerate]{font=\upshape} %% Upright font for the labels:
\setlist{labelsep=5.5pt} %% Fixed labelsep (especially in proof environments)

%% NB: Not more than one definition per level.

\setlist[enumerate,1]{%
  leftmargin=\parindent,% Align the item body with \parindent
  label=(\roman*),%
  ref=\textup{(\roman*)}%
}
\setlist[enumerate,2]{%
  leftmargin=*,% Align the label with the surrounding text
  align=left,%
  label=(\alph*),%
  ref=\textup{\theenumi\,(\alph*)}%
}
\setlist[enumerate,3]{%
  leftmargin=*,% %% Align the label with the surrounding text
  align=left,%
  label=\arabic*.,%
  ref=\textup{\theenumii\,\arabic*}%
}
\setlist[itemize,1]{%
  leftmargin=\parindent,% Align the item body with \parindent
  label={\tiny\raisebox{0.6mm}{$\bullet$}}%
}
\setlist[itemize,2]{%
  leftmargin=*,% %% Align the label with the surrounding text
  align=left,%
}
\setlist[itemize,3]{%
  leftmargin=*,% %% Align the label with the surrounding text
  align=left,%
}
\setlist[description]{%
  leftmargin=\parindent,% Align the item body with \parindent
  style=unboxed,%
  font=\mdseries\upshape%
}

\renewenvironment{quote}
 {\begin{list}{}{%
   \setlength{\leftmargin}{\parindent}%
   \setlength{\rightmargin}{\leftmargin}}%
   \item\relax}
 {\end{list}}

%-------------------%
% Theorems (amsthm) %
%-------------------%

%% The dot after a theorem number should be
%% bold after a number, and
%% non-bold after a paranthesis.

\renewcommand{\thmhead@plain}[3]{%
	\thmname{#1}%
	\thmnumber{\@ifnotempty{#1}{ }\@upn{#2}}%
	\thmnote{ {\the\thm@notefont(#3)\the\thm@headpunct}}% NEW
}%

\let\thmhead\thmhead@plain

\def\swappedhead#1#2#3{%
	\thmnumber{#2}%
	\thmname{\@ifnotempty{#2}{~}#1}%
	\thmnote{ {\the\thm@notefont(#3)\the\thm@headpunct}}% NEW
}%

\let\swappedhead@plain=\swappedhead

\def\@begintheorem#1#2[#3]{%
	\deferred@thm@head{%
		\the\thm@headfont \thm@indent
		\@ifempty{#1}{\let\thmname\@gobble}{\let\thmname\@iden}%
		\@ifempty{#2}{\let\thmnumber\@gobble}{\let\thmnumber\@iden}%
		\@ifempty{#3}{\let\thmnote\@gobble}{\let\thmnote\@iden}%
		\thm@swap\swappedhead\thmhead{#1}{#2}{#3}%
		% add the bold dot if no 3rd parameter is given, otherwise add a normal one
		\@ifempty{#3}{\the\thm@headpunct}{}%
		%\the\thm@headpunct% the dot after the title
		\thmheadnl%
		\hskip\thm@headsep
	}%
	\ignorespaces%
}%

%% Spaces before and after theorems:

\newlength\preskip
\setlength\preskip{\CrelleBlankLineFlex}
\newlength\postskip
\setlength\postskip{\CrelleBlankLine}
\newlength\postskipdefinition
\setlength\postskipdefinition{\postskip}

\newtheoremstyle{plain}%
	{\preskip}{\postskip}%  % space before and after
	{\itshape}%             % text font
	{\parindent}%           % indentation
	{\bfseries}{.}%         % header style
    {\CrelleSpaceAfterDot}% % space after label
	{}                      % same header format as plain

\newtheoremstyle{definition}%
	{\preskip}{\postskipdefinition}% % space before and after
	{\normalfont}%                   % text font
	{\parindent}%                    % indentation
	{\bfseries}{.}%                  % header style
    {\CrelleSpaceAfterDot}%          % space after label
	{}                               % same header format as plain

%------------%
% QED symbol %
%------------%

\newlength\qedrulewidth
\setlength\qedrulewidth{.37pt} %% magic
\newlength\qedwidth
\setlength\qedwidth{1ex} %% magic
\newlength\qedheight
\setlength\qedheight{\qedwidth-2\qedrulewidth}
\newlength\qedinnerwidth
\setlength\qedinnerwidth{\qedwidth-2\qedrulewidth}
%
\renewcommand{\qedsymbol}{%
	\vbox{%
		\hrule width\qedwidth height\qedrulewidth% %upper bar
		\hbox{%
			\vrule height\qedheight width\qedrulewidth% %left bar
			\hskip\qedinnerwidth%
			\vrule width\qedrulewidth% right bar
		}%
		\hrule width\qedwidth height\qedrulewidth% lower bar
	}
}

%-----------------%
% Proofs (amsthm) %
%-----------------%

\renewenvironment{proof}[1][\proofname]{%
  \par\pushQED{\qed}%
  \normalfont
  %% Both parameters control the space above AND below \trivlist:
  \partopsep 0pt
  \topsep\CrelleBlankLineFlex
  \trivlist
  %% Indent the first line:
  \itemindent\parindent
  %% Space after dot:
  \labelsep\CrelleSpaceAfterDot
  \item[{\hskip\labelsep\itshape#1\@addpunct{.}}]\ignorespaces}% NEW
  {\popQED\endtrivlist\@endpefalse}

%--------------------------------%
% Language-dependent definitions %
%--------------------------------%
%% Beside the defaults (hyphenating, frenchspacing, etc.) no further
%% changes to the layout (such as \FrenchLayout) are needed.

\newcommand\Andname{and}
\newcommand\Atname{at}
\newcommand\Byname{By}
\newcommand\Acknowledgmentsname{Acknowledgement}
\newcommand\WithAppendix{With an appendix by}

\ifGerman
	\RequirePackage[ngerman]{babel}
    \addto\captionsngerman{\renewcommand\Andname{und}}
    \addto\captionsngerman{\renewcommand\Atname{in}}
    \addto\captionsngerman{\renewcommand\Byname{Von}}
    \addto\captionsngerman{\renewcommand\WithAppendix{Mit einem Anhang von}}
    %% Redefine names that differ from babel's default:
	\addto\captionsngerman{\renewcommand\abstractname{Abstract}}
	\addto\captionsngerman{\renewcommand\contentsname{Contents}}
	\addto\captionsngerman{\renewcommand\refname{Bibliography}}
\fi

\ifFrench
	\RequirePackage[frenchb]{babel}
    \frenchbsetup{StandardLists=true,FrenchFootnotes=false} %% !!!
    \addto\captionsfrench{\renewcommand\Andname{et}}
    \addto\captionsfrench{\renewcommand\Atname{\`{a}}}
    \addto\captionsfrench{\renewcommand\Byname{Par}}
    \addto\captionsfrench{\renewcommand\WithAppendix{Avec un appendice par}}
    %% Redefine names that differ from babel's default:
	\addto\captionsfrench{\renewcommand\abstractname{R\'esum\'e}}
	\addto\captionsfrench{\renewcommand\contentsname{Table des mati\`eres}}
	\addto\captionsfrench{\renewcommand\figurename{Figure}}
	\addto\captionsfrench{\renewcommand\refname{R\'ef\'erences}}
	\addto\captionsfrench{\renewcommand\tablename{Table}}
	\addto\captionsfrench{\renewcommand\Acknowledgmentsname{Remerciements}}
\fi

%-----------%
% Equations %
%-----------%

\RequirePackage{upref} %% Changes the \ref command so that its argument is always upright.
%% That is, just the first number will be italic in:
%% \emph{In 1980 we found $1980$ roots. Anyway, both \ref{eq:1} and \eqref{eq:1} are upright.}

%% Indent all equation numbers.
\let\mytagform@=\tagform@
\def\tagform@#1{\indent\maketag@@@{(\ignorespaces#1\unskip\@@italiccorr)}}
\renewcommand\eqref[1]{\textup{\mytagform@{\ref{#1}}}}
%% Source: http://tex.stackexchange.com/questions/28903/changing-the-apperance-of-equation-numbers-with-amsmath

\ifSecEq
  %% Equation numbers like (1.1), (1.2), (1.3)
  \numberwithin{equation}{section}
  %% Otherwise default = \renewcommand\theequation{\arabic{equation}}
\fi

%------------%
% Hyperlinks %
%------------%

\RequirePackage{hyperref}
%% NB: Multiline links don't work in draft-mode!
\hypersetup{%
 bookmarkstype=none, %% Don't create bookmarks.
 %%bookmarks=false,  %% Don't open bookmarks.
 pdfpagemode=UseNone,
 breaklinks=true,
 %%hyperindex=false, %% There are no indices
 filecolor=black,citecolor=black,urlcolor=black,linkcolor=black,colorlinks,
 setpagesize=false}

\ifpdf
\else
 \RequirePackage{breakurl} %% for the dvips driver
\fi

%% By default hyperref uses \binoppenalty and \relpenalty as
%% default penalties for breaking URLs. Since we changed those
%% two penalities above, we have to define:

\mathchardef\UrlBigBreakPenalty 700 %% default of \binoppenalty
\mathchardef\UrlBreakPenalty 500 %% default of \relpenalty

%-------------%
% Hyphenation %
%-------------%

\hyphenation{%% Not case sensitiv.
Abel-ian
Banach
Euclid-ian
Euclid-ean %% We prefer this form.
Galois
Gauss-ian
Hermit-ian
Jacobi-an %% Carl Gustav Jacob Jacobi
Jacobi-ans
Klein-ian
%Lagrangian %Laplacian %Legendrian
Lorentz-ian
Noether-ian
Riemann-ian
pseudo-dif-fer-en-tial
group-oid
group-oids
}

%---------------------------------%
% Internal (Dimler & Albroscheit) %
%---------------------------------%

\newcounter{mynote}
\setcounter{mynote}{0}
\newcommand\mynote[2][\themynote]{%
	\refstepcounter{mynote}%
	\label{mynote:#1}%
	\mbox{}\marginpar{%
		\hspace{0pt}%
		\RaggedRight{%
			\sffamily\scriptsize\bfseries Note~\themynote:%
		}\\ %
	\scriptsize#2}%
}

\newcommand\n[1]{\textcolor{red}{#1}}
\newcommand\myBox{\n{\ensuremath{\blacksquare\hskip 1pt\blacksquare}}}
\newcommand\zu{$\stackrel{\mbox{\tiny ?}}{\longrightarrow}$\newline}

\newcommand\mynoteCRELLEbib{\mynote{Since Crelle's referencing is in numeric style, we changed the
 citation labels.}\xspace}
\newcommand\mynoteCRELLEbreaks{\mynote{No breaks within mathematical expressions are allowed in
 Crelle's Journal. Therefore, we will ask you in some places to reformulate sentences.}\xspace}
\newcommand\mynotefinalpagebreaks{\mynote{The page breaks will be improved while incorporating
 your corrections.}\xspace}
\newcommand\mynotegap[1]{\mynote{Propose some wording to fill the (visual) gap in #1.}\xspace}
\newcommand\nolab{\mynote{Formula label deleted since you didn't refer to it.}\xspace}
\newcommand\mynoteunbalanced{\mynote{Unbalanced parentheses.}\xspace}
\newcommand\mynotered{\mynote{Red parts indicate major changes. Please check them carefully.}\xspace}

\newcommand\BIGOP[1]{\mathop{\mathchoice%
  {\raise-0.22em\hbox{\huge $#1$}}%   %displaystyle
  {\raise-0.05em\hbox{\Large $#1$}}%  %textstyle
  {\hbox{\large $#1$}}%               %scriptstyle
  {#1}}}                              %scriptscriptstyle
\newcommand\bigtimes{\BIGOP{\times}}

\newcommand\tup[1]{\textup{(#1)}}
\newcommand\on[1]{\operatorname{#1}}
\newcommand\lb{\linebreak}
\newcommand\betrag[1]{\lvert#1\rvert}
\newcommand\bigbetrag[1]{\bigl\lvert#1\bigr\rvert}
\newcommand\Bigbetrag[1]{\Bigl\lvert#1\Bigr\rvert}
\newcommand\biggbetrag[1]{\biggl\lvert#1\biggr\rvert}
\newcommand\norm[1]{\lVert#1\rVert}
\newcommand\bignorm[1]{\bigl\lVert#1\bigr\rVert}
\newcommand\Bignorm[1]{\Bigl\lVert#1\Bigr\rVert}
\newcommand\biggnorm[1]{\biggl\lVert#1\biggr\rVert}
\newcommand\xsqrt[2][9pt]{\sqrt{\vphantom{\rule{0pt}{#1}}\nlh{$#2$}}}
\newcommand\xkern[1]{\kern-1pt#1\kern-1pt}
\newcommand\ftext[1]{\quad\text{#1}\quad}
\newcommand\fftext[1]{\qquad\text{#1}\qquad}
\newcommand\CRELLEquad{\hspace*{\CrelleSpaceAfterDot}}
\newcommand\xquad{\hspace*{15mm}}
\newcommand\mydot{\parbox[b]{0mm}{.\hspace*{-2mm}}}
\newcommand\mycom{\parbox[b]{0mm}{,\hspace*{-2mm}}}
\newcommand\mysym{\parbox[b]{0mm}{;\hspace*{-2mm}}}
\newcommand\nlh[1]{\raisebox{0mm}[0mm][0mm]{#1}}
%% E.g. \newcommand\xM{\nlh{$M_n^{\textup{alg}}$}}

%----------%
% Tutorial %
%----------%

%% Theorems and subsubsections to use the same counter:
%%
% \swapnumbers
% \theoremstyle{plain}
%  \newtheorem{theorem}[subsubsection]{Theorem}
%  \newtheorem{lemma}[subsubsection]{Lemma}
% \theoremstyle{definition}
%  \newtheorem{definition}[subsubsection]{Definition}
%  \newtheorem{remark}[subsubsection]{Remark}
%
% \setcounter{secnumdepth}{3}
% \titleformat{\subsubsection}[runin]%
%  {\bfseries\boldmath\filright}{\thesubsubsection.}{.5\CrelleSpaceAfterDot}{}[]
%
% \makeatletter
% \def\swappedhead#1#2#3{%
%	\thmnumber{#2}.%
%	\thmname{\@ifnotempty{#2}{\hspace{.5\CrelleSpaceAfterDot}}#1}%
%	\thmnote{ {\the\thm@notefont(#3)\the\thm@headpunct}}}
% \makeatother

\endinput
%%
%% End of the file `degruyter-crelle.cls'.
