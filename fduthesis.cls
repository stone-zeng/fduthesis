%%
%% This is file `fduthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% fduthesis.dtx  (with options: `cls')
%% 
%%     Copyright (C) 2017 by Xiangdong Zeng <pssysrq@163.com>
%% 
%%     This work may be distributed and/or modified under the
%%     conditions of the LaTeX Project Public License, either
%%     version 1.3c of this license or (at your option) any later
%%     version. The latest version of this license is in:
%% 
%%       http://www.latex-project.org/lppl.txt
%% 
%%     and version 1.3 or later is part of all distributions of
%%     LaTeX version 2005/12/01 or later.
%% 
%%     This work has the LPPL maintenance status `maintained'.
%% 
%%     The Current Maintainer of this work is Xiangdong Zeng.
%% 
%%     This work consists of the files fduthesis.dtx
%%                                     fduthesis.ins
%%                and the derived file fduthesis.cls.
%% 

\NeedsTeXFormat{LaTeX2e}
\RequirePackage{expl3}
\RequirePackage{xparse,l3keys2e}
\ProvidesExplClass{fduthesis}
  {2017/02/19} {0.2} {Fudan University Thesis Template}
\box_new:N   \l__fdu_tmpa_box
\dim_new:N   \l__fdu_tmpa_dim
\tl_new:N    \l__fdu_tmpa_tl
\tl_new:N    \l__fdu_tmpb_tl
\clist_new:N \l__fdu_tmpa_clist
\clist_new:N \l__fdu_tmpb_clist
\clist_new:N \g__fdu_to_book_clist
\bool_new:N \g__fdu_twoside_bool
\bool_set_true:N \g__fdu_twoside_bool
\tl_const:Nn \c__fdu_full_stop_ideographic_tl
  { \symbol{ "3002 } }
\tl_const:Nn \c__fdu_full_stop_fullwidth_tl
  { \symbol{ "FF0E } }
\keys_define:nn { fdu / option }
  {
    oneside .value_forbidden:n = true,
    twoside .value_forbidden:n = true,
    oneside .code:n = {
      \clist_gput_right:Nn \g__fdu_to_book_clist { oneside }
      \bool_set_false:N    \g__fdu_twoside_bool
    },
    twoside .code:n = {
      \clist_gput_right:Nn \g__fdu_to_book_clist { twoside }
      \bool_set_true:N     \g__fdu_twoside_bool
    },
    draft .choice:,
    draft / true  .code:n = {
      \bool_set_true:N     \g__fdu_draft_bool
      \clist_gput_right:Nn \g__fdu_to_book_clist { draft }
    },
    draft / false .code:n = {
      \bool_set_false:N    \g__fdu_draft_bool
    },
    draft .default:n = true,
    draft .initial:n = false
  }
\ProcessKeysOptions { fdu / option }
\PassOptionsToClass { \g__fdu_to_book_clist } { book }
\LoadClass { book }
\RequirePackage { geometry }
\geometry
  {
    paper      = a4paper,
    left       = 2.54 cm,
    right      = 2.54 cm,
    top        = 3.18 cm,
    bottom     = 3.18 cm,
    headheight = 15 pt
  }
\bool_if:NT \g__fdu_draft_bool
  { \geometry { showframe } }
\RequirePackage { fancyhdr }
\fancyhf { }
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
\fancyfoot [ C ] { \thepage }
\RenewDocumentCommand \cleardoublepage { }
  {
    \clearpage
    \bool_if:NT \g__fdu_twoside_bool
      {
        \int_if_odd:nF \c@page
          { \hbox:n { } \thispagestyle { empty } \newpage }
      }
  }
\RequirePackage [ no-math ] { fontspec }
\RequirePackage [ UTF8, heading = true, zihao = -4,
  fontset = none ] { ctex }
\RequirePackage { unicode-math }
\unimathsetup { math-style = ISO, bold-style = ISO }
\keys_define:nn { fdu / style }
  {
    font .choice:,
    font .value_required:n = true,
    font / libertinus .code:n = {
      \setmainfont { Libertinus~ Serif }
      \setsansfont { Libertinus~ Sans  }
      \setmonofont { TeX~ Gyre~ Cursor }
        [ Ligatures = NoCommon ]
      \setmathfont { Libertinus~ Math  }
    },
    font / lm .code:n = {
      \setmainfont { Latin~ Modern~ Roman }
      \setsansfont { Latin~ Modern~ Sans  }
      \setmonofont { Latin~ Modern~ Mono  }
      \setmathfont { Latin~ Modern~ Math  }
    },
    font / palatino .code:n = {
      \setmainfont { TeX~ Gyre~ Pagella       }
      \setsansfont { TeX~ Gyre~ Heros         }
      \setmonofont { TeX~ Gyre~ Cursor        }
        [ Ligatures = NoCommon ]
      \setmathfont { TeX~ Gyre~ Pagella~ Math }
    },
    font / times .code:n = {
      \setmainfont { TeX~ Gyre~ Termes }
      \setsansfont { TeX~ Gyre~ Heros  }
      \setmonofont { TeX~ Gyre~ Cursor }
        [ Ligatures = NoCommon ]
      \setmathfont { XITS~ Math        }
    },
    CJKfont .choice:,
    CJKfont .value_required:n = true,
    CJKfont / adobe .code:n = {
      \setCJKmainfont { Adobe~ Song~ Std~ L     }
        [
          ItalicFont   = Adobe~ Kaiti~ Std~ R,
          AutoFakeBold = true
        ]
      \setCJKsansfont { Adobe~ Heiti~ Std~ R    }
        [
          ItalicFont   = Adobe~ Heiti~ Std~ R,
          AutoFakeBold = true
        ]
      \setCJKmonofont { Adobe~ Fangsong~ Std~ R }
        [
          ItalicFont   = Adobe~ Fangsong~ Std~ R,
          AutoFakeBold = true
        ]
      \setCJKfamilyfont { song } { Adobe~ Song~     Std~ L }
      \setCJKfamilyfont { hei  } { Adobe~ Heiti~    Std~ R }
      \setCJKfamilyfont { fang } { Adobe~ Fangsong~ Std~ R }
      \setCJKfamilyfont { kai  } { Adobe~ Kaiti~    Std~ R }
    },
    CJKfont / fandol .code:n = {
      \setCJKmainfont { FandolSong }
        [
          ItalicFont   = FandolKai
        ]
      \setCJKsansfont { FandolHei  }
        [
          ItalicFont   = FandolHei
        ]
      \setCJKmonofont { FandolFang }
        [
          ItalicFont   = FandolFang,
          AutoFakeBold = true
        ]
      \setCJKfamilyfont { song } { FandolSong }
      \setCJKfamilyfont { hei  } { FandolHei  }
      \setCJKfamilyfont { fang } { FandolFang }
      \setCJKfamilyfont { kai  } { FandolKai  }
    },
    CJKfont / founder .code:n = {
      \setCJKmainfont { FZShuSong-Z01  }
        [
          BoldFont     = FZXiaoBiaoSong-B05,
          ItalicFont   = FZKai-Z03
        ]
      \setCJKsansfont { FZHei-B01      }
        [
          ItalicFont   = FZHei-B01,
          AutoFakeBold = true
        ]
      \setCJKmonofont { FZFangSong-Z02 }
        [
          ItalicFont   = FZFangSong-Z02,
          AutoFakeBold = true
        ]
      \setCJKfamilyfont { song } { FZShuSong -Z01 }
      \setCJKfamilyfont { hei  } { FZHei     -B01 }
      \setCJKfamilyfont { fang } { FZFangSong-Z02 }
      \setCJKfamilyfont { kai  } { FZKai     -Z03 }
    },
    CJKfont / mac .code:n = {
      \setCJKmainfont { STSong     }
        [
          BoldFont     = STZhongsong,
          ItalicFont   = STKaiti
        ]
      \setCJKsansfont { STHeiti    }
        [
          ItalicFont   = STHeiti,
          AutoFakeBold = true
        ]
      \setCJKmonofont { STFangsong }
        [
          ItalicFont   = STFangsong,
          AutoFakeBold = true
        ]
      \setCJKfamilyfont { song } { STSong     }
      \setCJKfamilyfont { hei  } { STHeiti    }
      \setCJKfamilyfont { fang } { STFangsong }
      \setCJKfamilyfont { kai  } { STKaiti    }
    },
    CJKfont / windows .code:n = {
      \setCJKmainfont { SimSun   }
        [
          ItalicFont   = KaiTi,
          AutoFakeBold = true
        ]
      \setCJKsansfont { SimHei   }
        [
          ItalicFont   = SimHei,
          AutoFakeBold = true
        ]
      \setCJKmonofont { FangSong }
        [
          ItalicFont   = FangSong,
          AutoFakeBold = true
        ]
      \setCJKfamilyfont { song } { SimSun   }
      \setCJKfamilyfont { hei  } { SimHei   }
      \setCJKfamilyfont { fang } { FangSong }
      \setCJKfamilyfont { kai  } { KaiTi    }
    },
    fontsize .choice:,
    fontsize .value_required:n = true,
    fontsize / -4 .code:n = { },
    fontsize /  5 .code:n = {
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
    fullwidth-stop .choice:,
    fullwidth-stop / true  .code:n = {
      \char_set_active_eq:nN { "3002 }
        \c__fdu_full_stop_fullwidth_tl
      \char_set_catcode_active:n { "3002 }
    },
    fullwidth-stop / false .code:n = { },
    fullwidth-stop .default:n  = true
  }
\ctexset
{
  chapter = {
    format     = {
      \huge \normalfont \sffamily \centering
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
  },
  contentsname = {目 \quad 录},
  chapter    / tocline = {
    \normalfont \sffamily
    \CTEXnumberline { #1 }    #2
  },
  subsection / tocline = {
    \CJKfamily { kai }
    \CTEXnumberline { #1 }    #2
  }
}
\pagestyle { fancy }
\RenewDocumentCommand \sectionmark { m }
  { \markright { \CTEXthesection \negthinspace \quad #1 } }
\keys_define:nn { fdu / info }
  {
    title        .tl_set:N    = \l__fdu_info_title_tl,
    title*       .tl_set:N    = \l__fdu_info_title_e_tl,
    date         .tl_set:N    = \l__fdu_info_date_tl,
    author       .tl_set:N    = \l__fdu_info_author_tl,
    author*      .tl_set:N    = \l__fdu_info_author_e_tl,
    supervisor   .tl_set:N    = \l__fdu_info_supervisor_tl,
    supervisor*  .tl_set:N    = \l__fdu_info_supervisor_e_tl,
    instructors  .clist_set:N = \l__fdu_info_instructors_clist,
    department   .tl_set:N    = \l__fdu_info_department_tl,
    department*  .tl_set:N    = \l__fdu_info_department_e_tl,
    major        .tl_set:N    = \l__fdu_info_major_tl,
    major*       .tl_set:N    = \l__fdu_info_major_e_tl,
    studentID    .tl_set:N    = \l__fdu_info_student_ID_tl,
    schoolID     .tl_set:N    = \l__fdu_info_school_ID_tl,
    keywords      .clist_set:N = \l__fdu_info_keywords_clist,
    keywords*     .clist_set:N = \l__fdu_info_keywords_e_clist,
    CLC          .tl_set:N    = \l__fdu_info_CLC_tl
  }
\cs_new:Npn \fdu_spread_box:Nn #1 #2
  {
    \makebox [ #1 ] [ s ]
      { \tl_map_inline:nn { #2 } { ##1 \hfil } \unskip }
  }
\cs_generate_variant:Nn \fdu_spread_box:Nn { NV }
\cs_new:Npn \fdu_center_box:Nn #1 #2
  {
    \makebox [ #1 ] [ c ] { #2 }
  }
\cs_generate_variant:Nn \fdu_center_box:Nn { NV }
\cs_new:Npn \fdu_get_text_width:Nn #1 #2
  {
    \hbox_set:Nn \l__fdu_tmpa_box { #2 }
    \dim_set:Nn #1
      { \box_wd:N \l__fdu_tmpa_box }
  }
\cs_new:Npn \fdu_get_max_text_width:NN #1 #2
  {
    \clist_set_eq:NN \l__fdu_tmpa_clist #2
    \bool_until_do:nn { \clist_if_empty_p:N \l__fdu_tmpa_clist }
      {
        \clist_pop:NN \l__fdu_tmpa_clist \l__fdu_tmpa_tl
        \fdu_get_text_width:Nn \l__fdu_tmpa_dim
          { \large \l__fdu_tmpa_tl }
        \dim_set:Nn #1
          { \dim_max:nn { #1 } { \l__fdu_tmpa_dim } }
      }
  }
\dim_new:N \l__fdu_cover_info_L_dim
\dim_new:N \l__fdu_cover_info_R_dim
\RequirePackage { graphicx }
\cs_new:Npn \fdu_coverA_ID:nn #1 #2
  {
    \begin{flushright}
      \setlength { \rightskip } { #2 }
      \parbox [ c ] { #1 }
        {
          \small
          学校代码    ： \l__fdu_info_school_ID_tl  \par
          学 \qquad 号： \l__fdu_info_student_ID_tl
        }
    \end{flushright}
  }
\cs_new:Npn \fdu_coverA_logo:nn #1 #2
  {
    \begin{figure} [ h ]
      \centering
      \includegraphics [ width = #2 ] { #1 }
    \end{figure}
  }
\cs_new:Npn \fdu_coverA_title:nn #1 #2
  {
    \begin{center}
      \fdu_spread_box:Nn { #2 } { \Huge #1 }
      \par
      \vspace { \stretch{ 3 } }
      {
        \huge \sffamily
        \l__fdu_info_title_tl
      }
      \par
      \vfill
      { \Large \l__fdu_info_title_e_tl }
      \par
    \end{center}
  }
\cs_new:Nn \fdu_coverA_info:
  {
    \begin{center}
      \dim_set:Nn \l__fdu_cover_info_L_dim { 6 em }
      \clist_set:Nn \l__fdu_tmpa_clist
        {
          \l__fdu_info_department_tl,
          \l__fdu_info_major_tl,
          \l__fdu_info_author_tl,
          \l__fdu_info_supervisor_tl,
          \l__fdu_info_date_tl
        }
      \clist_set_eq:NN
        \l__fdu_tmpb_clist \l__fdu_tmpa_clist
      \fdu_get_max_text_width:NN
        \l__fdu_cover_info_R_dim \l__fdu_tmpa_clist
      \clist_set:Nn \l__fdu_tmpa_clist
        { 院系, 专业, 姓名, 指导教师, 完成日期 }
      \begin{minipage} [ c ] { \textwidth }
        \centering \large
        \bool_until_do:nn
          { \clist_if_empty_p:N \l__fdu_tmpa_clist }
          {
            \clist_pop:NN \l__fdu_tmpa_clist \l__fdu_tmpa_tl
            \clist_pop:NN \l__fdu_tmpb_clist \l__fdu_tmpb_tl
            \fdu_spread_box:NV
              \l__fdu_cover_info_L_dim \l__fdu_tmpa_tl
            ：
            \fdu_center_box:NV
              \l__fdu_cover_info_R_dim \l__fdu_tmpb_tl
            \par
          }
      \end{minipage}
    \end{center}
  }
\NewDocumentCommand \makecoverA { }
  {
    \fdu_coverA_ID:nn {10em} {-2em}
    \vfill
    \fdu_coverA_logo:nn {Fudan_LOGO.pdf} {0.5 \textwidth}
    \vfill
    \fdu_coverA_title:nn {博士毕业论文} {0.45 \textwidth}
    \vspace { \stretch{ 4 } }
    \fdu_coverA_info:
    \vfill
  }
\NewDocumentCommand \makecoverB { }
  {
    \thispagestyle { empty }
    \vspace* { 30 pt }
    \begin{center}
      \huge \normalfont \sffamily
      \fdu_spread_box:Nn { 7 em } { 指导小组成员 }
    \end{center}
    \vspace { 20 pt }
    \begin{center}
      \large
      \clist_use:Nn \l__fdu_info_instructors_clist { \par }
    \end{center}
  }
\NewDocumentCommand \makecover { }
  {
    \begin{titlepage}
      \makecoverA
      \newpage
      \makecoverB
    \end{titlepage}
    \tableofcontents
  }
\NewDocumentEnvironment { abstract } { }
  {
    \chapter* { 摘 \quad 要 }
    \markboth { 摘 \quad 要 } { 摘 \quad 要 }
    \addcontentsline { toc } { chapter }
      {
        \normalfont \sffamily
        摘 \quad 要
      }
  }
  {
    \par \mbox{} \par
    \noindent \hangindent = 4 em  \hangafter = 1
    {
      \normalfont \sffamily
      关键字：
    }
    \clist_use:Nn \l__fdu_info_keywords_clist { ； }
    \par
    \noindent
    {
      \normalfont \sffamily
      中图分类号：
    }
    \l__fdu_info_CLC_tl
  }

\NewDocumentEnvironment { abstract* } { }
  {
    \chapter* { Abstract }
    \markboth { Abstract } { Abstract }
    \addcontentsline { toc } { chapter }
      {
        \normalfont \sffamily
        Abstract
      }
  }
  {
    \par \mbox{} \par
    \noindent \hangindent = 4 em \hangafter = 1
    \textbf{Keywords:} \quad
    \clist_use:Nn \l__fdu_info_keywords_e_clist { \quad }
    \par
    \noindent
    \textbf{CLC~ number:} \quad
    \l__fdu_info_CLC_tl
  }
\RequirePackage { longtable }
\NewDocumentEnvironment { notation } { O{ l p{ 25 em } } }
  {
    \chapter* { 符号表 }
    \markboth { 符号表 } { 符号表 }
    \addcontentsline { toc } { chapter }
      {
        \normalfont \sffamily
        符号表
      }
    \begin{longtable} { #1 }
  }
  {
    \end{longtable}
  }
\RequirePackage [ perpage ] { footmisc }

\RequirePackage { pifont }
\cs_new:Npn \fdu_footnote_symbol:n #1
  {
    \ding { \int_eval:n { 191 + #1 } }
  }
\RenewDocumentCommand \thefootnote { }
  {
    \fdu_footnote_symbol:n { \value { footnote } }
  }
\RenewDocumentCommand \@makefntext { +m }
{
  \dim_set:Nn \l__fdu_tmpa_dim { \textwidth - 1.5 em }
  \makebox [ 1.5 em ] [ l ] { \@thefnmark }
  \parbox [ t ] { \l__fdu_tmpa_dim }
    {
      \everypar { \hspace* { 2 em } }
      \hspace* { -2 em } #1
    }
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



























%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\keys_define:nn { fdu }
  {
    info  .meta:nn = { fdu / info  } { #1 },
    style .meta:nn = { fdu / style } { #1 }
  }
\NewDocumentCommand \fdusetup { m }
  { \keys_set:nn { fdu } { #1 } }
\keys_set:nn { fdu }
  {
    style / font            =  times,
    style / CJKfont         =  fandol,
    style / fullwidth-stop  =  false,
    style / fontsize        =  -4,
    info  / date            =  \today
  }
\endinput
%%
%% End of file `fduthesis.cls'.
