\ProvidesClass{cdut_thesis}[2020/05/04 v1.0 Standard LaTeX Template for CDUT Thesis]

\LoadClass[a4paper,cs4size]{ctexart} % cs4size：小四号字



\RequirePackage{xcolor}
\RequirePackage{enumerate}
\RequirePackage{amssymb}   % 数学
\RequirePackage{unicode-math} % Cambria Math 数学字体
\RequirePackage{graphicx}  % 插图
\RequirePackage{hyperref}  % 超链接
\hypersetup{hidelinks}     % 隐藏超链接的边框




% 数字和字母的字体
\setmainfont{Times New Roman}



%
%	---	个人信息栏目
%
\newcommand{\TitleCDUT}[2]{
	\newcommand{\zh@cdutthetitle}{#1}
	\newcommand{\en@cdutthetitle}{#2}
}

\newcommand{\AuthorCDUT}[1]{
	\newcommand{\@cduttheauthor}{#1}
}


\newcommand{\MajorCDUT}[1]{
	\newcommand{\@cdutthemajor}{#1}
}


\newcommand{\AdvisorCDUT}[2]{
	\newcommand{\@cduttheadvisor}{#1}
	\newcommand{\@cdutadvisorposition}{#2}
}

\newcommand{\StudentnumberCDUT}[1]{
	\newcommand{\@cdutthestudentnumber}{#1}
}

\newcommand{\KeywordCDUT}[2]{
	\newcommand{\@cdutzhkeyword}{#1}
	\newcommand{\@cdutenkeyword}{#2}
}


\newcommand{\GradeCDUT}[1]{
	\newcommand{\@cdutgrade}{#1}
}



%
%	---	定义页边距
%
\RequirePackage{geometry}
% 上下2.6cm，左右3.15cm
\geometry{left=2.54cm,right=2.54cm,top=2.54cm,bottom=2.54cm}
% 页脚1.75cm
\geometry{headsep=1em,footskip=0.2cm}
% 页眉高1.5cm
\geometry{headheight=1.5cm}



%
%	---	页眉页脚样式设置
%
%使用fancyhdr库
\RequirePackage{fancyhdr}
%设置页眉样式
\newcommand{\headstyle}{
	\renewcommand{\headrulewidth}{0.6pt}
	\fancyhead[C]{\songti \zihao{-5} 成都理工大学 \@cdutgrade 届学士学位论文}
}
%设置页脚样式
\newcommand{\footstyle}{\fancyfoot[C]{\zihao{-5} \thepage}}
\pagestyle{fancy}
\fancyhf{} %清空原有样式
\headstyle
\footstyle

% 设置摘要目录页的页眉页脚
\newcommand{\fronthead}{
\pagenumbering{Roman}
\pagestyle{fancy}
\fancyhf{}
\fancyhead{} % get rid of headers
\renewcommand{\headrulewidth}{0pt} % and the line
\fancyfoot[C]{\small \thepage}
}

\newcommand{\texthead}{
	\pagenumbering{arabic}
	\pagestyle{fancy}
	\fancyhf{}
	\headstyle
	\footstyle
}


%
%	---	定义标题和段落样式
%
%定义1.5倍行距
\renewcommand{\baselinestretch}{1.62}

\setlength{\textheight}{23cm}
\setlength{\topskip}{5ex}
\setlength{\footskip}{8ex}

\ctexset{section={
		name={第,章},
		number=\arabic{section},
		format=\heiti\zihao{-2}\centering,
		beforeskip={10cm},
	},
		subsection={
		format=\heiti\zihao{-3},
	    beforeskip={1ex},
	},
		subsubsection={
		format=\heiti\zihao{-4},
	},
		appendix={
		name={附录},
	},
}

% 解决section与页眉间距过短问题
\RequirePackage{titlesec}
\titlespacing{\section}{0pt}{0.5ex}{*1.5}




%
%   ---定义表格和图片的caption
%
\RequirePackage{caption}
\DeclareCaptionFont{cdutfloatfont}{\heiti\zihao{5}}
\captionsetup{
	font=cdutfloatfont,
	skip=0pt, 
}

\RequirePackage{amsmath}
\numberwithin{table}{section}
\renewcommand{\thetable}{\arabic{section}-\arabic{table}}
\numberwithin{figure}{section}
\renewcommand{\thefigure}{\arabic{section}-\arabic{figure}}
\numberwithin{equation}{section}
\renewcommand{\theequation}{\arabic{section}-\arabic{equation}}
%
%  --- 定义一些环境
% 

% 个人信息
\newcommand{\makezhcover}{
	\begin{center}
		{\heiti \zihao{2}  \zh@cdutthetitle}
	\end{center}
	\makebox[\linewidth][c]{\songti \zihao{3}  作者姓名：\@cduttheauthor \@cdutthestudentnumber 专业：\@cdutthemajor}
	\makebox[\linewidth][c]{\songti \zihao{3}  指导教师：\@cduttheadvisor \quad \@cdutadvisorposition}
}

% 摘要
\newenvironment{chineseabstract}{
	\addcontentsline{toc}{section}{摘 \quad 要}
	\section*{\heiti{摘 \quad 要}} % 将摘要作为不带编号的section，解决缩进问题。
	\vspace{1em}
}{
\vspace{1em}
\\
\noindent {\heiti \zihao{-4} 关键词：\@cdutzhkeyword}
}


\newenvironment{englishabstract}{
	\newpage
	\section*{\zihao{-2} \en@cdutthetitle}
	\vspace{1em}
	\noindent Abstract：
}{
\vspace{1em}
\\
\noindent {\zihao{-4} Keywords：\@cdutenkeyword}
}


% 结论
\newenvironment{conclusion}{
	\addcontentsline{toc}{section}{结 \quad 论}
	\section*{\heiti\zihao{-2}{结 \quad 论}} % 将摘要作为不带编号的section，解决缩进问。
}{}

\newenvironment{mythanks}{
	\addcontentsline{toc}{section}{致 \quad 谢}
	\section*{\heiti\zihao{-2}{致 \quad 谢}} % 将摘要作为不带编号的section，解决缩进问题。

}{}

%
%   ---目录格式定制
% 
% 在目录中加入目录项本身、参考文献、索引等项目
\RequirePackage{tocbibind} 
\RequirePackage{tocloft}
% 设置目录title的样式(黑体小二居中)
\renewcommand{\cfttoctitlefont}{\hfill\heiti\zihao{-2}}
\renewcommand{\cftaftertoctitle}{\hfill}
% 让“目录”两个字中间分开
\renewcommand{\contentsname}{目 \quad 录}
% 控制section条目的间距
\renewcommand\cftbeforesecskip{-5pt}
% section的字体字号
\renewcommand\cftsecfont{\heiti\zihao{-4}}
% 页码编号的字号大小
\renewcommand\cftsecpagefont{\zihao{-4}}
\renewcommand\cftsubsecpagefont{\zihao{-4}}
\renewcommand\cftsubsubsecpagefont{\zihao{-4}}
% 设置2，3级条目的缩进
\cftsetindents{subsection}{1em}{1.5em}
\cftsetindents{subsubsection}{2em}{1.5em}
% 设置\@dotsep
\renewcommand{\cftdotsep}{0.1}
% 使得section条目后面带上....
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
% 修改...到page number的距离
\cftsetpnumwidth{0.4em}


%
%   ---附录格式定制
% 
%\RequirePackage{appendix}



% 测试
%\RequirePackage{tocloft}

\setmathfont{Cambria Math}
