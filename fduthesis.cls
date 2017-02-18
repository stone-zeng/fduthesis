\NeedsTeXFormat{LaTeX2e}
\RequirePackage{expl3,xparse,l3keys2e}
\ProvidesExplClass{fduthesis}
  {2017/02/19}
  {0.2}
  {Fudan University Thesis Template}


%%%%%%%%%% 版本历史 %%%%%%%%%%
% v0.1 2017/02/15
%   开始
% v0.2 2017/02/19
%   git 管理


%%%%%%%%%% 全局变量声明 %%%%%%%%%%
% 保存 fduthesis -> book 的选项列表
\clist_new:N \g__fdu_book_options_clist
% 保存 fduthesis -> geometry 的选项列表
\clist_new:N \g__fdu_geometry_options_clist

% 是否开启双页模式（默认打开）
\bool_new:N \g__fdu_twoside_bool
\bool_set_true:N \g__fdu_twoside_bool


%%%%%%%%%% 文档类选项 %%%%%%%%%%
\keys_define:nn { fdu / option }
  {
    % 页面模式
    oneside .value_forbidden:n = true,
    twoside .value_forbidden:n = true,
    oneside .code:n = {
      \clist_gput_right:Nn \g__fdu_book_options_clist { oneside }
      \bool_set_false:N    \g__fdu_twoside_bool
    },
    twoside .code:n = {
      \clist_gput_right:Nn \g__fdu_book_options_clist { twoside }
      \bool_set_true:N     \g__fdu_twoside_bool
    },
    % 草稿模式
    draft .choice:,
    draft / true  .code:n = {
      \bool_set_true:N     \g__fdu_draft_bool
      \clist_gput_right:Nn \g__fdu_book_options_clist { draft }
    },
    draft / false .code:n = {
      \bool_set_false:N    \g__fdu_draft_bool
    },
    draft .default:n = true,
    draft .initial:n = false
%    draft .value_forbidden:n = true,
%    draft .code:n = {
%      \clist_gput_right:Nn \g__fdu_book_options_clist
%        { draft }
%      \clist_gput_right:Nn \g__fdu_geometry_options_clist
%        { showframe }
%    }
  }

% 处理选项（使用 `l3keys2e' 宏包）
\ProcessKeysOptions { fdu / option }


%%%%%%%%%% 载入标准文档类 %%%%%%%%%%
\PassOptionsToClass { \g__fdu_book_options_clist } { book }
\LoadClass { book }


%%%%%%%%%% 版式设置 %%%%%%%%%%
\RequirePackage { geometry }
  \geometry
    {
      % 纸张大小
      paper      = a4paper,
      % 页边距
      left       = 2.54 cm,
      right      = 2.54 cm,
      top        = 3.18 cm,
      bottom     = 3.18 cm,
      % 页眉高度
      headheight = 15 pt
    }
  % 草稿模式
  \bool_if:NT \g__fdu_draft_bool
    {
      \geometry { showframe }
    }


%%%%%%%%%% 页眉页脚 %%%%%%%%%%
\RequirePackage { fancyhdr }
  % 清除所有页面格式
  \fancyhf { }
  % 页眉(见 `ctex' 下的重定义)
  \bool_if:NTF \g__fdu_twoside_bool
    {
      \fancyhead [ EL ]
        { \small \nouppercase { \CJKfamily { kai } \leftmark  } }
      \fancyhead [ OR ]
        { \small \nouppercase { \CJKfamily { kai } \rightmark } }
    }
    {
      \fancyhead [ L ]
        { \small \nouppercase { \CJKfamily { kai } \leftmark  } }
      \fancyhead [ R ]
        { \small \nouppercase { \CJKfamily { kai } \rightmark } }
    }
  % 页脚
  \fancyfoot [ C ] { \thepage }
  % 关闭横线显示
%  \RenewDocumentCommand \headrulewidth { } { 0 pt }




%----- 论文信息 -----%
\keys_define:nn { fdu / info }
  {
    title        .tl_set:N    = \l__fdu_info_title_tl,
    title*       .tl_set:N    = \l__fdu_info_title_english_tl,
    %
    author       .tl_set:N    = \l__fdu_info_author_tl,
    author*      .tl_set:N    = \l__fdu_info_author_english_tl,
    supervisor   .tl_set:N    = \l__fdu_info_supervisor_tl,
    supervisor*  .tl_set:N    = \l__fdu_info_supervisor_english_tl,
    major        .tl_set:N    = \l__fdu_info_major_tl,
    major*       .tl_set:N    = \l__fdu_info_major_english_tl,
    department   .tl_set:N    = \l__fdu_info_department_tl,
    department*  .tl_set:N    = \l__fdu_info_department_english_tl,
    %
    studentID    .tl_set:N    = \l__fdu_info_student_ID_tl,
    schoolID     .tl_set:N    = \l__fdu_info_school_ID_tl,
    %
    keyword      .clist_set:N = \l__fdu_info_keyword_clist,
    keyword*     .clist_set:N = \l__fdu_info_keyword_english_clist
  }




\RequirePackage[no-math]{fontspec}

\RequirePackage{unicode-math}
  \unimathsetup { math-style = ISO, bold-style = ISO }

\RequirePackage[UTF8, heading = true, zihao = -4]{ctex}
  \pagestyle { fancy }
  \ctexset
  {
    chapter = {
      format     = {
        \huge \normalfont \sffamily \CJKfamily { hei } \centering
      },
      beforeskip = { 30 pt },
      afterskip  = { 20 pt },
      number     = { \arabic{ chapter } }
    },
    section = {
      format     = { \Large \bfseries \raggedright }
    },
    subsection = {
      format     = { \large \bfseries \raggedright }
    }
  }
  % 重定义右页眉格式
  \RenewDocumentCommand \sectionmark { m }
    { \markright { \CTEXthesection \quad #1 } }

\RequirePackage{xeCJK}


\RequirePackage{graphicx}



%\NewDocumentCommand \printinfo {}
%{
%  \l__fdu_info_title_tl \\
%  \l__fdu_info_title_english_tl \\
%  \l__fdu_info_author_tl \quad \l__fdu_info_author_english_tl
%}

%----- 西文字体设置 -----%
\keys_define:nn { fdu / style }
  {
    font .choice:,
    font .value_required:n = true,
    font / libertinus .code:n = {
      \setmainfont { Libertinus~Serif }
      \setsansfont { Libertinus~Sans  }
      \setmonofont { TeX~Gyre~Cursor  } [ Ligatures = NoCommon ]
      \setmathfont { Libertinus~Math  }
    },
    font / lm .code:n = {
      \setmainfont { Latin~Modern~Roman }
      \setsansfont { Latin~Modern~Sans  }
      \setmonofont { Latin~Modern~Mono  }
      \setmathfont { Latin~Modern~Math  }
    },
    font / palatino .code:n = {
      \setmainfont { TeX~Gyre~Pagella      }
      \setsansfont { TeX~Gyre~Heros        }
      \setmonofont { TeX~Gyre~Cursor       } [ Ligatures = NoCommon ]
      \setmathfont { TeX~Gyre~Pagella~Math }
    },
    font / times .code:n = {
      %HACK: 20170217  XITS 字体没有 small capital
%      \setmainfont { XITS }
      \setmainfont { TeX~Gyre~Termes }
      \setsansfont { TeX~Gyre~Heros  }
      \setmonofont { TeX~Gyre~Cursor } [ Ligatures = NoCommon ]
      \setmathfont { XITS~Math       }
%      \setmathfont { TeX~Gyre~Termes~Math }
    }
  }

%----- 中文字体设置 -----%
%BUG: 20170215  见 https://github.com/CTeX-org/ctex-kit/issues/268
\keys_define:nn { fdu / style }
  {
    CJKfont .choice:,
    CJKfont .value_required:n = true,
    CJKfont / adobe .code:n = {
      \setCJKmainfont{ Adobe~Song~Std~L }
        [
          BoldFont = Adobe~Heiti~Std~R,
          ItalicFont = Adobe~Kaiti~Std~R
        ]
    },
    CJKfont / fandol .code:n = {
      \setCJKmainfont { FandolSong }
        [ ItalicFont = FandolKai ]
      \setCJKfamilyfont { song } { FandolSong }
        [ ItalicFont = FandolKai ]
      \setCJKfamilyfont { hei  } { FandolHei  }
      \setCJKfamilyfont { fang } { FandolFang }
      \setCJKfamilyfont { kai  } { FandolKai  }
    },
    CJKfont / founder .code:n = {
      \setCJKmainfont{ FZShuSong-Z01 }
        [ BoldFont = FZXiaoBiaoSong-B05, ItalicFont = FZKai-Z03 ]
%        [ ItalicFont = 方正楷体_GBK, AutoFakeBold = true ]
%        [ BoldFont = 方正黑体_GBK, ItalicFont = 方正楷体_GBK ]
      \setCJKfamilyfont { song } { FZShuSong-Z01 }
        [ BoldFont = FZXiaoBiaoSong-B05, ItalicFont = FZKai-Z03 ]
      \setCJKfamilyfont { hei  } { FZHei-B01      }
      \setCJKfamilyfont { fang } { FZFangSong-Z02 }
      \setCJKfamilyfont { kai  } { FZKai-Z03      }
    },
%    CJKfont / linux .code:n = {
%      \setCJKmainfont{ SimSun }
%        [ BoldFont = SimHei, ItalicFont = KaiTi ]
%    },
    CJKfont / mac .code:n = {
      \setCJKmainfont{ STSong }
        [ ItalicFont = STKaiti, AutoFakeBold = true ]
      \setCJKfamilyfont { song } { STSong     }
        [ ItalicFont = STKaiti, AutoFakeBold = true ]
      \setCJKfamilyfont { hei  } { STHeiti    }
      \setCJKfamilyfont { fang } { STFangsong }
      \setCJKfamilyfont { kai  } { STKaiti    }
    },
    CJKfont / windows .code:n = {
      \setCJKmainfont{ SimSun }
        [ ItalicFont = KaiTi, AutoFakeBold = true ]
      \setCJKfamilyfont { song } { SimSun   }
        [ ItalicFont = KaiTi, AutoFakeBold = true ]
      \setCJKfamilyfont { hei  } { SimHei   }
      \setCJKfamilyfont { fang } { FangSong }
      \setCJKfamilyfont { kai  } { KaiTi    }
    },
  }

%----- 句号 -----%
%\keys_define:nn { fdu / style }
%  {
%    fullwidth-stop .choice:,
%    fullwidth-stop / true .code:n = {
%      \ctex_after_end_preamble:n
%        { \addCJKfontfeatures { Mapping = fullwidth-stop } }
%    },
%    fullwidth-stop / false .code:n = { Mapping = han-trad},
%    fullwidth-stop .default:n = true
%  }

% 使用 bool 型 key
\keys_define:nn { fdu / style }
  {
    fullwidth-stop .bool_set:N = \l__fdu_info_fullstop_bool,
    fullwidth-stop .default:n = true
  }

% 钩子使用 `ctexhook' 宏包
\ctex_after_end_preamble:n
  {
    \bool_if:NT \l__fdu_info_fullstop_bool
      { \addCJKfontfeatures { Mapping = fullwidth-stop } }
  }

%----- 默认字号 -----%
\keys_define:nn { fdu / style }
  {
    zihao .choice:,
    zihao .value_required:n = true,
    zihao / -4 .code:n = { },
    zihao / 5  .code:n = {
      \RenewDocumentCommand \tiny         { } { \zihao {  7 } }
      \RenewDocumentCommand \scriptsize   { } { \zihao { -6 } }
      \RenewDocumentCommand \footnotesize { } { \zihao {  6 } }
      \RenewDocumentCommand \small        { } { \zihao { -5 } }
      \RenewDocumentCommand \normalsize   { } { \zihao {  5 } }
      \RenewDocumentCommand \large        { } { \zihao { -4 } }
      \RenewDocumentCommand \Large        { } { \zihao { -3 } }
      \RenewDocumentCommand \LARGE        { } { \zihao { -2 } }
      \RenewDocumentCommand \huge         { } { \zihao {  2 } }
      \RenewDocumentCommand \Huge         { } { \zihao {  1 } }
    },
  }




% 钩子使用 `ctexhook' 宏包
% \ctex_at_end_preamble:n
% {
%   \bool_if:NT \g__fdu_draft_bool
%     { \geometry { showframe } }
% }


%----- meta 键值对 -----%
\keys_define:nn { fdu }
  {
    info  .meta:nn = { fdu / info  } { #1 },
    style .meta:nn = { fdu / style } { #1 }
  }

\NewDocumentCommand \fdusetup { m }
  { \keys_set:nn { fdu } { #1 } }





%----- 封面 -----%
%BUG: 20170218  \makebox[<dim>][s]{<content>} 会产生 underfull \hbox
\cs_new:Nn \l_fdu_colon_tl: { ： }

% #1=length, #2=content
\cs_new:Npn \fdu_spread_CJK:Nn #1 #2
  { \makebox [ #1 ] [ s ] { #2 }  }

% #1=total-length, #2=content
\cs_new:Npn \fdu_center_CJK:Nn #1 #2
  { \makebox [ #1 ] [ c ] { #2 } }

% #1=total-length, #2=spread-length, #3=content
\cs_new:Npn \fdu_center_CJK:NNn #1 #2 #3
  {
    \makebox [ #1 ] [ c ]
      { \fdu_spread_CJK:Nn { #2 } { #3 } }
  }


\NewDocumentCommand \makecover { }
  {
    \begin{titlepage}
      \begin{flushright}
        \setlength { \rightskip } { -2 em }
        \parbox [ c ] { 10 em }
          {
            \small
            学校代码    ： \l__fdu_info_school_ID_tl  \par
            学 \qquad 号： \l__fdu_info_student_ID_tl
          }
      \end{flushright}
      
      \vfill

      \begin{figure} [ h ]
        \centering
        \includegraphics [width = 0.5 \textwidth]
          { Fudan_LOGO.pdf }
      \end{figure}
      
      \vfill
      
      \begin{center}
%        \makebox [ 0.45 \textwidth ] [ s ]
          { \Huge 本科毕业论文 }
        \par
        
        \vspace { \stretch{ 3 } }
        
        { \LARGE \sffamily \CJKfamily { hei }  \l__fdu_info_title_tl }
        \par
        
        \vfill
        
        { \Large \l__fdu_info_title_english_tl }
        \par
        
        \vspace { \stretch{ 4 } }
        
        %TODO: 20170218  根据内容自动调整宽度
        % 见 http://tex.stackexchange.com/q/169689
        \parbox [ c ] { \textwidth }
        {
          \centering \large
          
%          \fdu_spread_CJK:Nn { 6 em } { 院系 } ：
          院 \qquad 系：
          \fdu_center_CJK:Nn { 10 em }
            { \l__fdu_info_department_tl }
          \par
          
%          \fdu_spread_CJK:Nn { 6 em } { 专业 } ：
          专 \qquad 业：
          \fdu_center_CJK:NNn { 10 em } { 3.1 em }
            { \l__fdu_info_major_tl }
          \par
          
%          \fdu_spread_CJK:Nn { 6 em } { 姓名 } ：
          姓 \qquad 名：
          \fdu_center_CJK:NNn { 10 em } { 3.1 em }
            { \l__fdu_info_author_tl }
          \par
          
%          \fdu_spread_CJK:Nn { 6 em } { 指导老师 } ：
          指导老师：
          \fdu_center_CJK:Nn { 10 em } { \l__fdu_info_supervisor_tl }
          \par
          
%          \fdu_spread_CJK:Nn { 6 em } { 完成日期 } ：
          完成日期：
          \fdu_center_CJK:Nn { 10 em } { \today }
        }
      \end{center}
      
      \vfill
    \end{titlepage}
    
    \cleardoublepage
  }

%----- 中文摘要 -----%
\NewDocumentEnvironment { abstract } { }
  {
    \thispagestyle { plain }
    \vspace* { 10 pt }
    \begin{center}
      \Large \normalfont \sffamily \CJKfamily { hei }
      摘 \quad 要
    \end{center}
    \vspace { 10 pt }
    \par
  }
  {
    \par
    \mbox{}
    \par
    
    \noindent \hangindent = 4 em \hangafter = 1
    { \normalfont \sffamily \CJKfamily { hei } 关键字： }
    \clist_use:Nn \l__fdu_info_keyword_clist { ； }
    \par
    
    \cleardoublepage
  }

%----- 英文摘要 -----%
\NewDocumentEnvironment { abstract* } { }
  {
    \thispagestyle { plain }
    \vspace* { 10 pt }
    \begin{center}
      \Large \normalfont \sffamily \CJKfamily { hei } 
      Abstract
    \end{center}
    \vspace { 10 pt }
    \par
  }
  {
    \par
    \mbox{}
    \par
    
    \noindent \hangindent = 4 em \hangafter = 1
    \textbf{Keyword:} \quad
    \clist_use:Nn \l__fdu_info_keyword_english_clist { \quad }
    \par
    
    \cleardoublepage
  }

%%%%%%%%%% 初始设置 %%%%%%%%%%
\keys_set:nn { fdu }
  {
    style/font = times,
    style/CJKfont = fandol,
    style/fullwidth-stop = false,
    style/zihao = -4
%    draft = false
  }

