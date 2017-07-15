%%
%% This is file `fduthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% fduthesis.dtx  (with options: `class')
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
%%     This work consists of the file fduthesis.dtx
%%              and the derived files fduthesis.ins,
%%                                    fduthesis.cls,
%%                                    fduthesis-en.cls,
%%                                    fduthesis.def,
%%                                    fduthesis-user.def,
%%                                    fduthesis.pdf
%%                                and README.md.
%% 
\NeedsTeXFormat{LaTeX2e}
\RequirePackage{expl3}
\GetIdInfo $Id: fduthesis.dtx 0.2 2017-02-19 12:00:00Z Xiangdong Zeng <pssysrq@163.com> $
  {Thesis template for Fudan University}
\ProvidesExplClass{\ExplFileName}
  {\ExplFileDate}{\ExplFileVersion}{\ExplFileDescription}
\RequirePackage { xparse, l3keys2e }
\file_input:n { fduthesis.def }
\file_input:n { fduthesis-user.def }
\box_new:N   \l__fdu_tmpa_box
\dim_new:N   \l__fdu_tmpa_dim
\dim_new:N   \l__fdu_tmpb_dim
\tl_new:N    \l__fdu_tmpa_tl
\tl_new:N    \l__fdu_tmpb_tl
\int_new:N   \l__fdu_tmpa_int
\clist_new:N \l__fdu_tmpa_clist
\clist_new:N \l__fdu_tmpb_clist
\clist_new:N \g__fdu_to_book_clist
\bool_new:N \g__fdu_twoside_bool
\bool_set_true:N \g__fdu_twoside_bool
\bool_new:N \g__fdu_draft_bool
\bool_new:N \g__fdu_no_fonts_bool
\tl_const:Nn \c__fdu_fn_style_plain_tl           { plain           }
\tl_const:Nn \c__fdu_fn_style_libertinus_tl      { libertinus      }
\tl_const:Nn \c__fdu_fn_style_libertinus_n_tl    { libertinus*     }
\tl_const:Nn \c__fdu_fn_style_libertinus_sans_tl { libertinus-sans }
\tl_const:Nn \c__fdu_fn_style_pifont_tl          { pifont          }
\tl_const:Nn \c__fdu_fn_style_pifont_n_tl        { pifont*         }
\tl_const:Nn \c__fdu_fn_style_pifont_sans_tl     { pifont-sans     }
\tl_const:Nn \c__fdu_fn_style_pifont_sans_n_tl   { pifont-sans*    }
\tl_const:Nn \c__fdu_fn_style_xits_tl            { xits            }
\tl_const:Nn \c__fdu_fn_style_xits_sans_tl       { xits-sans       }
\tl_const:Nn \c__fdu_fn_style_xits_sans_n_tl     { xits-sans*      }
\clist_const:Nn \c__fdu_thm_style_plain_clist
  { plain, margin, change }
\clist_const:Nn \c__fdu_thm_style_break_clist
  { break, marginbreak, changebreak }
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
    draft .initial:n = false,
    nofonts .choice:,
    nofonts .bool_set:N = \g__fdu_no_fonts_bool,
    nofonts .default:n = true,
    nofonts .initial:n = false
  }
\ProcessKeysOptions { fdu / option }
\PassOptionsToClass { \g__fdu_to_book_clist } { book }
\LoadClass { book }
\RequirePackage [ no-math ] { fontspec }
\RequirePackage [
    UTF8,
    heading    = true,
    fontset    = none,
    zihao      = \c__fdu_def_font_size_tl,
    linespread = \c__fdu_def_line_spread_fp
  ] { ctex }
\RequirePackage { amsmath }
\RequirePackage { unicode-math }
\RequirePackage { geometry, fancyhdr }
\RequirePackage [ perpage ] { footmisc }
\RequirePackage [ amsmath, thmmarks ] { ntheorem }
\RequirePackage { graphicx }
\RequirePackage { longtable }
\RequirePackage { caption }
\RequirePackage { ulem }
\geometry
  {
    paper      = \c__fdu_def_paper_size_tl,
    top        = \c__fdu_def_page_margin_top_dim,
    bottom     = \c__fdu_def_page_margin_bottom_dim,
    left       = \c__fdu_def_page_margin_left_dim,
    right      = \c__fdu_def_page_margin_right_dim,
    headheight = \c__fdu_def_header_height_dim
  }
\bool_if:NT \g__fdu_draft_bool
  { \geometry { showframe } }
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
      \keys_set:nn { fdu / style } { footnotestyle = libertinus }
    },
    font / lm .code:n = {
      \setmainfont { Latin~ Modern~ Roman }
      \setsansfont { Latin~ Modern~ Sans  }
      \setmonofont { Latin~ Modern~ Mono  }
      \setmathfont { Latin~ Modern~ Math  }
      \keys_set:nn { fdu / style } { footnotestyle = pifont }
    },
    font / palatino .code:n = {
      \setmainfont { TeX~ Gyre~ Pagella       }
      \setsansfont { TeX~ Gyre~ Heros         }
      \setmonofont { TeX~ Gyre~ Cursor        }
        [ Ligatures = NoCommon ]
      \setmathfont { TeX~ Gyre~ Pagella~ Math }
      \keys_set:nn { fdu / style } { footnotestyle = pifont }
    },
    font / times .code:n = {
      \setmainfont { XITS              }
      \setsansfont { TeX~ Gyre~ Heros  }
      \setmonofont { TeX~ Gyre~ Cursor }
        [ Ligatures = NoCommon ]
      \setmathfont { XITS~ Math        }
      \keys_set:nn { fdu / style } { footnotestyle = xits }
    },
    cjkfont .choice:,
    cjkfont .value_required:n = true,
    cjkfont / adobe .code:n = {
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
    cjkfont / fandol .code:n = {
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
    cjkfont / founder .code:n = {
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
    cjkfont / mac .code:n = {
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
    cjkfont / windows .code:n = {
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
    }
  }
\cs_new_protected:Nn \fdu_cjk_font_song:
  {
    \xeCJK_family_if_exist:nTF { song }
      { \CJKfamily { song } } { \rmfamily }
  }
\cs_new_protected:Nn \fdu_cjk_font_hei:
  {
    \xeCJK_family_if_exist:nTF { hei  }
      { \CJKfamily { hei  } } { \sffamily }
  }
\cs_new_protected:Nn \fdu_cjk_font_fang:
  {
    \xeCJK_family_if_exist:nTF { fang }
      { \CJKfamily { fang } } { \ttfamily }
  }
\cs_new_protected:Nn \fdu_cjk_font_kai:
  {
    \xeCJK_family_if_exist:nTF { kai  }
      { \CJKfamily { kai  } } { \rmfamily \itshape }
  }
\NewDocumentCommand \fdu@song { } { \fdu_cjk_font_song: }
\NewDocumentCommand \fdu@hei  { } { \fdu_cjk_font_hei:  }
\NewDocumentCommand \fdu@fang { } { \fdu_cjk_font_fang: }
\NewDocumentCommand \fdu@kai  { } { \fdu_cjk_font_kai:  }
\keys_define:nn { fdu / style }
  {
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
    fullwidthstop .choice:,
    fullwidthstop / true  .code:n = {
      \char_set_active_eq:nN { "3002 }
        \c__fdu_full_stop_fullwidth_tl
      \char_set_catcode_active:n { "3002 }
    },
    fullwidthstop / false .code:n = { },
    fullwidthstop .default:n  = true
  }
\keys_set:nn { ctex }
  {
    chapter = {
      format      = \c__fdu_def_chapter_format_tl,
      beforeskip  = \c__fdu_def_chapter_before_sep_tl,
      afterskip   = \c__fdu_def_chapter_after_sep_tl,
      number      = { \arabic { chapter } },
      fixskip     = true
    },
    section = {
      format      = \c__fdu_def_section_format_tl,
      beforeskip  = \c__fdu_def_section_before_sep_tl,
      afterskip   = \c__fdu_def_section_after_sep_tl,
      fixskip     = true
    },
    subsection = {
      format      = \c__fdu_def_subsection_format_tl,
      beforeskip  = \c__fdu_def_subsection_before_sep_tl,
      afterskip   = \c__fdu_def_subsection_after_sep_tl,
      fixskip     = true
    }
  }
\fancyhf { }
\tl_new:N \l__fdu_header_center_mark_tl
\bool_if:NTF \g__fdu_twoside_bool
  {
    \fancyhead [ EL ] { \small \nouppercase { \fdu@kai \leftmark  } }
    \fancyhead [ OR ] { \small \nouppercase { \fdu@kai \rightmark } }
  }
  {
    \fancyhead [ L ] { \small \nouppercase { \fdu@kai \leftmark  } }
    \fancyhead [ R ] { \small \nouppercase { \fdu@kai \rightmark } }
    \fancyhead [ C ]
      {
        \small \nouppercase
          { \fdu@kai \l__fdu_header_center_mark_tl }
      }
  }
\fancyfoot [ C ] { \small \thepage }
\cs_new:Npn \fdu_front_matter_header:n #1
  {
    \bool_if:NTF \g__fdu_twoside_bool
      { \markboth { #1 } { #1 } }
      {
        \markboth { } { }
        \tl_gset:Nn \l__fdu_header_center_mark_tl { #1 }
      }
  }
\RenewDocumentCommand \cleardoublepage { }
  {
    \clearpage
    \bool_if:NT \g__fdu_twoside_bool
      {
        \int_if_odd:nF \c@page
          { \hbox:n { } \thispagestyle { empty } \newpage }
      }
    \tl_gset:Nn \l__fdu_header_center_mark_tl { }
  }
\pagestyle { fancy }
\RenewDocumentCommand \sectionmark { m }
  { \markright { \CTEXthesection \negthinspace \quad #1 } }
\tl_new:N \l__fdu_fn_style_tl
\keys_define:nn { fdu / style }
  {
    footnotestyle .choices:nn = {
      plain,
      libertinus, libertinus*, libertinus-sans,
      pifont,     pifont*,     pifont-sans,     pifont-sans*,
      xits,                    xits-sans,       xits-sans*
    }
    {
      \tl_gset_eq:NN \l__fdu_fn_style_tl \l_keys_choice_tl
      \int_compare:nTF
        { 5 <= \l_keys_choice_int <= 8 }
        { \RequirePackage { pifont } }
        {
          \int_compare:nT
            { 9 <= \l_keys_choice_int <= 11 }
            { \setmathfont { XITS~ Math } [ version = fn-XITS ] }
        }
    },
    footnotestyle .value_required:n = true
  }
\cs_new:Npn \fdu_fn_symbol_libertinus:V #1
  {
    \int_compare:nTF { #1 >= 21 }
      {
        \int_compare:nTF { #1 >= 47 }
          { \symbol { \int_eval:n { "24B6 - 47 + #1 } } }
          { \symbol { \int_eval:n { "24D0 - 21 + #1 } } }
      }
      { \symbol { \int_eval:n { "2460 - 1 + #1 } } }
  }
\cs_new:Npn \fdu_fn_symbol_libertinus_n:V #1
  {
    \int_compare:nTF { #1 >= 11 }
      { \symbol { \int_eval:n { "24EB - 11 + #1 } } }
      { \symbol { \int_eval:n { "2776 -  1 + #1 } } }
  }
\cs_new:Npn \fdu_fn_symbol_libertinus_sans:V #1
  { \fdu_fn_symbol_libertinus:V { #1 } }
\cs_new:Npn \fdu_fn_symbol_pifont:V #1
  { \ding { \int_eval:n { 171 + #1 } } }
\cs_new:Npn \fdu_fn_symbol_pifont_n:V #1
  { \ding { \int_eval:n { 181 + #1 } } }
\cs_new:Npn \fdu_fn_symbol_pifont_sans:V #1
  { \ding { \int_eval:n { 191 + #1 } } }
\cs_new:Npn \fdu_fn_symbol_pifont_sans_n:V #1
  { \ding { \int_eval:n { 201 + #1 } } }
\cs_new:Npn \fdu_fn_symbol_xits:V #1
  {
    \int_compare:nTF { #1 >= 10 }
      {
        \int_compare:nTF { #1 >= 36 }
          { \symbol { \int_eval:n { "24B6 - 36 + #1 } } }
          { \symbol { \int_eval:n { "24D0 - 10 + #1 } } }
      }
      { \symbol { \int_eval:n { "2460 - 1 + #1 } } }
  }
\cs_new:Npn \fdu_fn_symbol_xits_sans:V #1
  { \symbol { \int_eval:n { "2780 - 1 + #1 } } }
\cs_new:Npn \fdu_fn_symbol_xits_sans_n:V #1
  { \symbol { \int_eval:n { "278A - 1 + #1 } } }
\RenewDocumentCommand \thefootnote { }
  {
    \int_set:Nn \l__fdu_tmpa_int { \value { footnote } }
    \tl_case:NnF \l__fdu_fn_style_tl
      {
        \c__fdu_fn_style_plain_tl
          { \int_use:N \l__fdu_tmpa_int }
        \c__fdu_fn_style_libertinus_tl
          {
            \fontspec { Libertinus~ Serif }
            \fdu_fn_symbol_libertinus:V      \l__fdu_tmpa_int
          }
        \c__fdu_fn_style_libertinus_n_tl
          {
            \fontspec { Libertinus~ Serif }
            \fdu_fn_symbol_libertinus_n:V    \l__fdu_tmpa_int
          }
        \c__fdu_fn_style_libertinus_sans_tl
          {
            \fontspec { Libertinus~ Sans }
            \fdu_fn_symbol_libertinus_sans:V \l__fdu_tmpa_int
          }
        \c__fdu_fn_style_pifont_tl
          { \fdu_fn_symbol_pifont:V        \l__fdu_tmpa_int }
        \c__fdu_fn_style_pifont_n_tl
          { \fdu_fn_symbol_pifont_n:V      \l__fdu_tmpa_int }
        \c__fdu_fn_style_pifont_sans_tl
          { \fdu_fn_symbol_pifont_sans:V   \l__fdu_tmpa_int }
        \c__fdu_fn_style_pifont_sans_n_tl
          { \fdu_fn_symbol_pifont_sans_n:V \l__fdu_tmpa_int }
        \c__fdu_fn_style_xits_tl
          {
            \mathversion { fn-XITS }
            $ \fdu_fn_symbol_xits:V        \l__fdu_tmpa_int $
          }
        \c__fdu_fn_style_xits_sans_tl
          {
            \mathversion { fn-XITS }
            $ \fdu_fn_symbol_xits_sans:V   \l__fdu_tmpa_int $
          }
        \c__fdu_fn_style_xits_sans_n_tl
          {
            \mathversion { fn-XITS }
            $ \fdu_fn_symbol_xits_sans_n:V \l__fdu_tmpa_int $
          }
      }
      { \int_use:N \l__fdu_tmpa_int }
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
\tl_new:N \l__fdu_thm_style_tl
\tl_new:N \l__fdu_thm_header_font_tl
\tl_new:N \l__fdu_thm_body_font_tl
\tl_new:N \l__fdu_thm_qed_tl
\tl_new:N \l__fdu_thm_counter_tl
\keys_define:nn { fdu / theorem }
  {
    style      .tl_set:N  = \l__fdu_thm_style_tl,
    headerfont .tl_set:N  = \l__fdu_thm_header_font_tl,
    bodyfont   .tl_set:N  = \l__fdu_thm_body_font_tl,
    qed        .tl_set:N  = \l__fdu_thm_qed_tl,
    counter    .tl_set:N  = \l__fdu_thm_counter_tl
  }
\cs_new:Npn \fdu_thm_new:nnnn #1 #2 #3 #4
  {
    \theoremstyle { #1 }
    \newtheorem { #3 } { #4 } [ #2 ]
  }
\cs_generate_variant:Nn \fdu_thm_new:nnnn { Vnnn }
\cs_new:Npn \fdu_thm_no_number_new:nnn #1 #2 #3
  {
    \theoremstyle { #1 }
    \newtheorem { #2 } { #3 }
  }
\cs_generate_variant:Nn \fdu_thm_no_number_new:nnn { Vnn }
\cs_new:Npn \fdu_thm_set_qed:n         #1
  { \theoremsymbol     { #1 } }
\cs_new:Npn \fdu_thm_set_header_font:n #1
  { \theoremheaderfont { #1 } }
\cs_new:Npn \fdu_thm_set_body_font:n   #1
  { \theorembodyfont   { #1 } }
\cs_generate_variant:Nn \fdu_thm_set_qed:n         { V }
\cs_generate_variant:Nn \fdu_thm_set_header_font:n { V }
\cs_generate_variant:Nn \fdu_thm_set_body_font:n   { V }
\NewDocumentCommand \fdunewtheorem { s o m m }
  {
    \IfBooleanTF #1
      { \tl_set:Nn \l__fdu_thm_qed_tl { \ensuremath { \QED } } }
      { \tl_set:Nn \l__fdu_thm_qed_tl { } }
    \tl_set:Nn \l__fdu_thm_style_tl { plain }
    \IfValueT { #2 }
      { \keys_set:nn { fdu / theorem } { #2 } }
    \fdu_thm_set_header_font:V \l__fdu_thm_header_font_tl
    \fdu_thm_set_body_font:V   \l__fdu_thm_body_font_tl
    \fdu_thm_set_qed:V         \l__fdu_thm_qed_tl
    \IfBooleanTF #1
      {
        \clist_if_in:NVTF
          \c__fdu_thm_style_plain_clist
          \l__fdu_thm_style_tl
          { \tl_set:Nn \l__fdu_thm_style_tl { plain } }
          {
            \clist_if_in:NVTF
              \c__fdu_thm_style_break_clist
              \l__fdu_thm_style_tl
              { \tl_set:Nn \l__fdu_thm_style_tl { break } }
              { }
          }
        \tl_put_left:Nn \l__fdu_thm_style_tl { nonumber }
        \fdu_thm_no_number_new:Vnn \l__fdu_thm_style_tl
          { #3 } { #4 }
      }
      {
        \clist_clear:N \l__fdu_tmpa_clist
        \clist_concat:NNN \l__fdu_tmpa_clist
          \c__fdu_thm_style_plain_clist \c__fdu_thm_style_break_clist
        \clist_if_in:NVF
          \l__fdu_tmpa_clist \l__fdu_thm_style_tl
          { }
        \fdu_thm_new:Vnnn \l__fdu_thm_style_tl
          { \l__fdu_thm_counter_tl } { #3 } { #4 }
      }
  }
\captionsetup [ figure ]
  {
    font     = small,
    labelsep = quad
  }
\captionsetup [ table  ]
  {
    font     = { small, sf },
    labelsep = quad
  }
\RenewDocumentCommand \thefigure { }
  { \arabic { chapter } - \arabic { figure } }
\RenewDocumentCommand \thetable  { }
  { \arabic { chapter } - \arabic { table  } }
\tl_new:N    \l__fdu_info_title_tl
\tl_new:N    \l__fdu_info_date_tl
\tl_new:N    \l__fdu_info_author_tl
\tl_new:N    \l__fdu_info_supervisor_tl
\clist_new:N \l__fdu_info_instructors_clist
\tl_new:N    \l__fdu_info_department_tl
\tl_new:N    \l__fdu_info_major_tl
\tl_new:N    \l__fdu_info_student_id_tl
\tl_new:N    \l__fdu_info_school_id_tl
\clist_new:N \l__fdu_info_keywords_clist
\tl_new:N    \l__fdu_info_clc_tl
\tl_new:N    \l__fdu_info_title_en_tl
\tl_new:N    \l__fdu_info_author_en_tl
\tl_new:N    \l__fdu_info_supervisor_en_tl
\tl_new:N    \l__fdu_info_department_en_tl
\tl_new:N    \l__fdu_info_major_en_tl
\clist_new:N \l__fdu_info_keywords_en_clist
\keys_define:nn { fdu / info }
  {
    title       .tl_set:N    = \l__fdu_info_title_tl,
    title*      .tl_set:N    = \l__fdu_info_title_en_tl,
    date        .tl_set:N    = \l__fdu_info_date_tl,
    author      .tl_set:N    = \l__fdu_info_author_tl,
    author*     .tl_set:N    = \l__fdu_info_author_en_tl,
    supervisor  .tl_set:N    = \l__fdu_info_supervisor_tl,
    supervisor* .tl_set:N    = \l__fdu_info_supervisor_en_tl,
    instructors .clist_set:N = \l__fdu_info_instructors_clist,
    department  .tl_set:N    = \l__fdu_info_department_tl,
    department* .tl_set:N    = \l__fdu_info_department_en_tl,
    major       .tl_set:N    = \l__fdu_info_major_tl,
    major*      .tl_set:N    = \l__fdu_info_major_en_tl,
    studentid   .tl_set:N    = \l__fdu_info_student_id_tl,
    schoolid    .tl_set:N    = \l__fdu_info_school_id_tl,
    keywords    .clist_set:N = \l__fdu_info_keywords_clist,
    keywords*   .clist_set:N = \l__fdu_info_keywords_en_clist,
    clc         .tl_set:N    = \l__fdu_info_clc_tl
  }
\bool_new:N \l__fdu_secret_bool
\tl_new:N \l__fdu_info_secret_level_tl
\keys_define:nn { fdu / info }
  {
    secretlevel .choices:nn  = {
      none, i, ii, iii
    }
    {
      \int_compare:nTF
        { \l_keys_choice_int >= 2 }
        {
          \bool_set_true:N \l__fdu_secret_bool
          \setmathfont { XITS~ Math } [ version = secret-XITS ]
          \tl_set:Nn \l__fdu_info_secret_level_tl
            {
              \clist_item:Nn \c__fdu_def_secret_clist
                { \l_keys_choice_int - 1 }
            }
        }
        { \bool_set_false:N \l__fdu_secret_bool }
    },
    secretlevel .value_required:n = true,
    secretyear .tl_set:N = \l__fdu_info_secret_year_tl
  }
\cs_new:Npn \fdu_spread_box:Nn #1 #2
  {
    \makebox [ #1 ] [ s ]
      { \tl_map_inline:nn { #2 } { ##1 \hfil } \unskip }
  }
\cs_generate_variant:Nn \fdu_spread_box:Nn { NV }
\cs_generate_variant:Nn \fdu_spread_box:Nn { Nx }
\cs_new:Npn \fdu_center_box:Nn #1 #2
  { \makebox [ #1 ] [ c ] { #2 } }
\cs_generate_variant:Nn \fdu_center_box:Nn { NV }
\cs_new:Npn \fdu_fixed_width_box:Nn #1 #2
  { \parbox { #1 } { #2 } }
\cs_new:Npn \fdu_fixed_width_center_box:Nn #1 #2
  { \fdu_fixed_width_box:Nn { #1 } { \centering #2 } }
\cs_generate_variant:Nn \fdu_fixed_width_center_box:Nn { NV }
\cs_new:Npn \fdu_get_text_width:Nn #1 #2
  {
    \hbox_set:Nn \l__fdu_tmpa_box { #2 }
    \dim_set:Nn #1
      { \box_wd:N \l__fdu_tmpa_box }
  }
\cs_new:Npn \fdu_get_max_text_width:NN #1 #2
  {
    \group_begin:
    \clist_set_eq:NN \l__fdu_tmpa_clist #2
    \bool_until_do:nn { \clist_if_empty_p:N \l__fdu_tmpa_clist }
      {
        \clist_pop:NN \l__fdu_tmpa_clist \l__fdu_tmpa_tl
        \fdu_get_text_width:Nn \l__fdu_tmpa_dim
          { \large \l__fdu_tmpa_tl }
        \dim_gset:Nn #1
          { \dim_max:nn { #1 } { \l__fdu_tmpa_dim } }
      }
    \group_end:
  }
\cs_new:Npn \fdu_blank_underline:N #1
  { \uline { \hbox_to_wd:nn { #1 } { } } }
\cs_new:Npn \fdu_line_spread:N #1
  { \linespread { #1 } \selectfont }
\cs_generate_variant:Nn \fdu_line_spread:N { n }
\cs_new:Nn \__fdu_cover_id:
  {
    \begin{flushright}
      \dim_set:Nn \rightskip { \c__fdu_def_cover_id_margin_sep_tl }
      \fdu_fixed_width_box:Nn \c__fdu_def_cover_id_width_tl
        {
          \__fdu_cover_font_size_small:
          \bool_if:NT \l__fdu_secret_bool
            {
              \group_begin:
                \sffamily \mathversion { secret-XITS }
                \c__fdu_def_name_secret_level_tl
                \c__fdu_colon_fullwidth_tl
                \l__fdu_info_secret_level_tl
                \c__fdu_def_name_secret_star_tl
                \l__fdu_info_secret_year_tl
              \group_end:
              \par
            }
          \c__fdu_def_name_school_id_tl
          \c__fdu_colon_fullwidth_tl
          \l__fdu_info_school_id_tl
          \par
          \c__fdu_def_name_student_id_tl
          \c__fdu_colon_fullwidth_tl
          \l__fdu_info_student_id_tl
        }
    \end{flushright}
  }
\cs_new:Nn \__fdu_cover_logo:
  {
    \begin{center}
      \includegraphics [
        width = \c__fdu_def_cover_logo_width_tl
      ] { \c__fdu_def_cover_logo_file_name_tl }
    \end{center}
  }
\cs_new:Nn \__fdu_cover_title:
  {
    \begin{center}
      {
        \__fdu_cover_font_size_huge:
        \fdu_spread_box:NV
          \c__fdu_def_cover_type_width_tl
          \c__fdu_def_name_thesis_type_tl
      }
      \par \vspace { \c__fdu_def_cover_v_sep_iii_tl }
      {
        \__fdu_cover_font_size_normal:
        \c__fdu_def_name_degree_type_tl
      }
      \par \vspace { \c__fdu_def_cover_v_sep_iv_tl }
      {
        \__fdu_cover_font_size_large:  \sffamily
        \fdu_fixed_width_center_box:NV
          \c__fdu_def_cover_title_width_tl
          \l__fdu_info_title_tl
      }
      \par \vspace { \c__fdu_def_cover_v_sep_v_tl }
      {
        \__fdu_cover_font_size_normal: \bfseries
        \fdu_fixed_width_center_box:Nn
          \c__fdu_def_cover_title_en_width_tl
          {
            \fdu_line_spread:N
              \c__fdu_def_cover_title_en_line_spread_tl
            \l__fdu_info_title_en_tl
          }
      }
    \end{center}
  }
\cs_new:Nn \__fdu_cover_info:
  {
    \begin{center}
      \clist_set:Nn \l__fdu_tmpa_clist
        {
          \c__fdu_def_name_department_tl,
          \c__fdu_def_name_major_tl,
          \c__fdu_def_name_author_tl,
          \c__fdu_def_name_supervisor_tl,
          \c__fdu_def_name_date_tl,
        }
      \clist_set:Nn \l__fdu_tmpb_clist
        {
          \l__fdu_info_department_tl,
          \l__fdu_info_major_tl,
          \l__fdu_info_author_tl,
          \l__fdu_info_supervisor_tl,
          \l__fdu_info_date_tl
        }
      \fdu_get_max_text_width:NN
        \l__fdu_tmpb_dim \l__fdu_tmpb_clist
      \begin{minipage} [ c ] { \textwidth }
        \centering \__fdu_cover_font_size_normal:
        \bool_until_do:nn
          { \clist_if_empty_p:N \l__fdu_tmpa_clist }
          {
            \clist_pop:NN \l__fdu_tmpa_clist \l__fdu_tmpa_tl
            \clist_pop:NN \l__fdu_tmpb_clist \l__fdu_tmpb_tl
            \fdu_spread_box:Nx
              \c__fdu_def_cover_info_left_width_tl \l__fdu_tmpa_tl
            \c__fdu_colon_fullwidth_tl
            \fdu_center_box:NV
              \l__fdu_tmpb_dim \l__fdu_tmpb_tl
            \par \vspace { \c__fdu_def_cover_v_sep_vii_tl }
          }
      \end{minipage}
    \end{center}
  }
\cs_new:Npn \__fdu_decl_text:NNn #1 #2 #3
  {
    \begin{center}
      \__fdu_cover_font_size_large: \sffamily #1
    \end{center}
    \vspace { \c__fdu_def_decl_v_sep_iv_tl }
    \begin{center}
      \fdu_fixed_width_box:Nn \textwidth
        {
          \fdu_line_spread:N \c__fdu_def_decl_text_line_spread_tl
          \qquad #2
        }
    \end{center}
    \vspace { \c__fdu_def_decl_v_sep_iv_tl }
    { \hfill #3 }
  }
\NewDocumentCommand \makecoveri { }
  {
    \group_begin:
      \__fdu_cover_id:
      \vspace { \c__fdu_def_cover_v_sep_i_tl  }
      \__fdu_cover_logo:
      \vspace { \c__fdu_def_cover_v_sep_ii_tl }
      \__fdu_cover_title:
      \vspace { \c__fdu_def_cover_v_sep_vi_tl }
      \__fdu_cover_info:
      \vspace { \c__fdu_def_cover_v_sep_ix_tl }
    \group_end:
  }
\NewDocumentCommand \makecoverii { }
  {
    \group_begin:
      \cs_set_eq:NN \cleardoublepage \relax
      \thispagestyle { empty }
      \@schapter
        {
          \fdu_spread_box:NV
            \c__fdu_def_cover_instructors_width_tl
            \c__fdu_def_name_instructors_tl
        }
      \begin{center}
        \large
        \clist_use:Nn \l__fdu_info_instructors_clist { \par }
      \end{center}
    \group_end:
  }
\NewDocumentCommand \makecoveriii { }
  {
    \cleardoublepage
    \thispagestyle { empty }
    \vspace* { \c__fdu_def_decl_v_sep_i_tl }
    \__fdu_decl_text:NNn
      \c__fdu_def_name_originality_decl_tl
      \c__fdu_def_originality_decl_text_tl
      {
        \c__fdu_def_name_author_sign_tl
        \c__fdu_colon_fullwidth_tl
        \fdu_blank_underline:N \c__fdu_def_decl_sign_width_tl
        \quad
        \c__fdu_def_name_sign_date_tl
        \c__fdu_colon_fullwidth_tl
        \fdu_blank_underline:N \c__fdu_def_decl_date_width_tl
      }
    \vspace { \c__fdu_def_decl_v_sep_ii_tl }
    \__fdu_decl_text:NNn
      \c__fdu_def_name_authorization_decl_tl
      \c__fdu_def_authorization_decl_text_tl
      {
        \c__fdu_def_name_author_sign_tl
        \c__fdu_colon_fullwidth_tl
        \fdu_blank_underline:N \c__fdu_def_decl_sign_width_tl
        \quad
        \c__fdu_def_name_supervisor_sign_tl
        \c__fdu_colon_fullwidth_tl
        \fdu_blank_underline:N \c__fdu_def_decl_sign_width_tl
        \quad
        \c__fdu_def_name_sign_date_tl
        \c__fdu_colon_fullwidth_tl
        \fdu_blank_underline:N \c__fdu_def_decl_date_width_tl
      }
    \vspace { \c__fdu_def_decl_v_sep_iii_tl }
  }
\bool_new:N \l__fdu_auto_make_cover_bool
\keys_define:nn { fdu / style }
  {
    automakecover .bool_set:N = \l__fdu_auto_make_cover_bool,
    automakecover .default:n  = true
  }
\AtBeginDocument
  {
    \bool_if:NT \l__fdu_auto_make_cover_bool
      {
        \begin{titlepage}
          \makecoveri \newpage \makecoverii
        \end{titlepage}
      }
  }
\AtEndDocument
  { \bool_if:NT \l__fdu_auto_make_cover_bool { \makecoveriii } }
\keys_set:nn { ctex }
  {
    contentsname = { \c__fdu_def_name_toc_tl },
    chapter    / tocline = {
      \c__fdu_def_chapter_toc_format_tl    \CTEXnumberline { #1 } #2
    },
    section    / tocline = {
      \c__fdu_def_section_toc_format_tl    \CTEXnumberline { #1 } #2
    },
    subsection / tocline = {
      \c__fdu_def_subsection_toc_format_tl \CTEXnumberline { #1 } #2
    }
  }
\ctex_patch_cmd_once:NnnnTF \tableofcontents
  { }
  {
    \chapter*{\contentsname
      \@mkboth{%
        \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
  }
  {
    \chapter* { \contentsname }
    \fdu_front_matter_header:n { \c__fdu_def_name_toc_tl }
  }
  { } { \ctex_patch_failure:N \tableofcontents }
\NewDocumentEnvironment { abstract } { }
  {
    \chapter* { \c__fdu_def_name_abstract_tl }
    \fdu_front_matter_header:n { \c__fdu_def_name_abstract_tl }
    \addcontentsline { toc } { chapter }
      {
        \c__fdu_def_chapter_toc_format_tl
        \c__fdu_def_name_abstract_tl
      }
  }
  {
    \par \mbox{} \par
    \noindent \hangindent = 4 em  \hangafter = 1
    {
      \normalfont \sffamily
      \c__fdu_def_name_keywords_tl \c__fdu_colon_fullwidth_tl
    }
    \clist_use:Nn \l__fdu_info_keywords_clist
      { \c__fdu_semicolon_fullwidth_tl }
    \par
    \noindent
    {
      \normalfont \sffamily
      \c__fdu_def_name_clc_tl \c__fdu_colon_fullwidth_tl
    }
    \l__fdu_info_clc_tl
  }
\NewDocumentEnvironment { abstract* } { }
  {
    \chapter* { \c__fdu_def_name_abstract_en_tl }
    \fdu_front_matter_header:n { \c__fdu_def_name_abstract_en_tl }
    \addcontentsline { toc } { chapter }
      {
        \c__fdu_def_chapter_toc_format_tl
        \c__fdu_def_name_abstract_en_tl
      }
  }
  {
    \par \mbox{} \par
    \noindent \hangindent = 4 em \hangafter = 1
    \textbf{\c__fdu_def_name_keywords_en_tl} \quad
    \clist_use:Nn \l__fdu_info_keywords_en_clist { \quad }
    \par
    \noindent
    \textbf{\c__fdu_def_name_clc_en_tl} \quad
    \l__fdu_info_clc_tl
  }
\NewDocumentEnvironment { notation }
  { O { \c__fdu_def_notation_arg_tl } }
  {
    \chapter* { \c__fdu_def_name_notation_tl }
    \fdu_front_matter_header:n { \c__fdu_def_name_notation_tl }
    \addcontentsline { toc } { chapter }
      {
        \c__fdu_def_chapter_toc_format_tl
        \c__fdu_def_name_notation_tl
      }
    \group_begin:
      \dim_set_eq:NN \LTpre  \c_zero_dim
      \dim_set_eq:NN \LTpost \c_zero_dim
      \begin{longtable} { #1 }
  }
  {
      \end{longtable}
    \group_end:
  }
\keys_define:nn { fdu }
  {
    info  .meta:nn = { fdu / info  } { #1 },
    style .meta:nn = { fdu / style } { #1 }
  }
\keys_set:nn { fdu }
  {
    style   / fontsize      =  -4,
    style   / fullwidthstop =  false,
    style   / automakecover =  true,
    info    / secretlevel   =  none,
    info    / date          =  \zhtoday,
    info    / schoolid      =  10246,
    theorem / headerfont    = { \sffamily },
    theorem / bodyfont      = { \fdu@kai },
    theorem / counter       = { chapter }
  }
\bool_if:NF \g__fdu_no_fonts_bool
  {
    \keys_set:nn { fdu }
      {
        style / font    = times,
        style / cjkfont = fandol
      }
  }
\NewDocumentCommand \fdusetup { m }
  { \keys_set:nn { fdu } { #1 } }
\fdunewtheorem* { proof       } { \c__fdu_def_name_proof_tl      }
\fdunewtheorem  { axiom       } { \c__fdu_def_name_axiom_tl      }
\fdunewtheorem  { corollary   } { \c__fdu_def_name_corollary_tl  }
\fdunewtheorem  { definition  } { \c__fdu_def_name_definition_tl }
\fdunewtheorem  { example     } { \c__fdu_def_name_example_tl    }
\fdunewtheorem  { lemma       } { \c__fdu_def_name_lemma_tl      }
\fdunewtheorem  { theorem     } { \c__fdu_def_name_theorem_tl    }
\endinput
%%
%% End of file `fduthesis.cls'.
