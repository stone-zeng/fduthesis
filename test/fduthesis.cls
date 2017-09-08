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
%%     This work consists of the files fduthesis.dtx,
%%                                     fduthesis-doc.dtx,
%%                                     fduthesis-logo.dtx,
%%               and the derived files fduthesis.pdf,
%%                                     fduthesis.ins,
%%                                     fduthesis.cls,
%%                                     fduthesis-en.cls,
%%                                     fduthesis.def,
%%                                     fduthesis-user.def,
%%                                     fdudoc.cls,
%%                                     fdulogo.sty,
%%                                     fdulogo-example.tex,
%%                                     fduthesis-cover.tex,
%%                                     fudan-*.pdf,
%%                                     fudan-*.png,
%%                                     fduthesis-cover.pdf,
%%                                     latexmkrc,
%%                                 and README.md.
%% 
\NeedsTeXFormat{LaTeX2e}
\RequirePackage{expl3}
\GetIdInfo $Id: fduthesis.dtx 0.4 2017-08-14 12:00:00Z Xiangdong Zeng <pssysrq@163.com> $
  {Thesis template for Fudan University}
\ProvidesExplClass{\ExplFileName}
  {\ExplFileDate}{\ExplFileVersion}{\ExplFileDescription}
\msg_new:nnn { fduthesis } { unsupported-engine }
  {
    The~ fduthesis~ class~ requires~ either~ XeTeX~ or~ LuaTeX. \\\\
    "#1"~ is~ not~ supported~ at~ present.~ You~ must~ change \\
    your~ typesetting~ engine~ to~ "xelatex"~ or~ "lualatex".
  }
\sys_if_engine_xetex:F
  {
    \sys_if_engine_luatex:F
      {
        \msg_fatal:nnx { fduthesis } { unsupported-engine }
          { \c_sys_engine_str }
      }
  }
\RequirePackage { xparse, l3keys2e }
\msg_new:nnn { fduthesis } { l3-too-old }
  {
    Package~ "#1"~ is~ too~ old. \\\\
    Please~ update~ an~ up-to-date~ version~ of~ the~ bundles \\
    "l3kernel"~ and~ "l3packages"~ using~ your~ TeX~ package \\
    manager~ or~ from~ CTAN.
  }
\clist_map_inline:nn { expl3, xparse, l3keys2e }
  {
    \@ifpackagelater {#1} { 2017/07/19 }
      { } { \msg_error:nnn { fduthesis } { l3-too-old } {#1} }
  }
\file_input:n { fduthesis.def }
\file_input:n { fduthesis-user.def }
\box_new:N   \l__fdu_tmpa_box
\dim_new:N   \l__fdu_tmpa_dim
\dim_new:N   \l__fdu_tmpb_dim
\tl_new:N    \l__fdu_tmpa_tl
\tl_new:N    \l__fdu_tmpb_tl
\clist_new:N \l__fdu_tmpa_clist
\clist_new:N \l__fdu_tmpb_clist
\clist_new:N \g__fdu_to_book_clist
\clist_new:N \g__fdu_to_hyperref_clist
\bool_new:N \g__fdu_twoside_bool
\bool_set_true:N \g__fdu_twoside_bool
\bool_new:N \g__fdu_no_fonts_bool
\bool_new:N \g__fdu_draft_bool
\cs_new_protected_nopar:Npn \__fdu_msg_new:nn
  { \msg_new:nnn       { fduthesis } }
\cs_new_protected_nopar:Npn \__fdu_error:n
  { \msg_error:nn      { fduthesis } }
\cs_new_protected_nopar:Npn \__fdu_error:nn
  { \msg_error:nnn     { fduthesis } }
\cs_new_protected_nopar:Npn \__fdu_error:nnn
  { \msg_error:nnnn    { fduthesis } }
\keys_define:nn { fdu / option }
  {
    oneside .value_forbidden:n = true,
    twoside .value_forbidden:n = true,
    oneside .code:n =
      {
        \clist_gput_right:Nn \g__fdu_to_book_clist { oneside }
        \bool_set_false:N    \g__fdu_twoside_bool
      },
    twoside .code:n =
      {
        \clist_gput_right:Nn \g__fdu_to_book_clist { twoside }
        \bool_set_true:N     \g__fdu_twoside_bool
      },
    nofonts .choice:,
    nofonts .bool_set:N = \g__fdu_no_fonts_bool,
    nofonts .default:n = true,
    nofonts .initial:n = false,
    draft .choice:,
    draft / true  .code:n =
      {
        \bool_set_true:N     \g__fdu_draft_bool
        \clist_gput_right:Nn \g__fdu_to_book_clist { draft }
      },
    draft / false .code:n =
      { \bool_set_false:N    \g__fdu_draft_bool },
    draft .default:n = true,
    draft .initial:n = false,
    %unknown .code:n = { \__fdu_error:n { unknown-option } }
  }
\__fdu_msg_new:nn { unknown-option }
  { Class~ option~ "\l_keys_key_tl"~ is~ unknown. }
\ProcessKeysOptions { fdu / option }
\PassOptionsToClass { \g__fdu_to_book_clist } { book }
\LoadClass { book }
\RequirePackage [ no-math ] { fontspec }
\RequirePackage
  [
    UTF8,
    heading    = true,
    fontset    = none,
    zihao      = \c__fdu_def_font_size_tl,
    linespread = \c__fdu_def_line_spread_fp
  ]
  { ctex }
\RequirePackage { amsmath }
\RequirePackage { unicode-math }
\RequirePackage { geometry, fancyhdr }
\RequirePackage [ perpage ] { footmisc }
\RequirePackage [ amsmath, thmmarks ] { ntheorem }
\RequirePackage { graphicx }
\RequirePackage { longtable }
\RequirePackage { caption }
\RequirePackage { xcolor }
\cs_new:Npn \__fdu_check_package:nnn #1#2#3
  {
    \@ifpackagelater {#1} {#2}
      { } { \__fdu_error:nnn { package-too-old } {#1} {#3} }
  }
\__fdu_msg_new:nn { package-too-old }
  {
    Package~ "#1"~ is~ too~ old. \\
    The~ fduthesis~ class~ only~ supports~ "#1"~ with~ a~ version \\
    higher~ than~ v#2. \\\\
    Please~ update~ an~ up-to-date~ version~ of~ it~ using~ your \\
    TeX~ package~ manager~ or~ from~ CTAN.
  }
\__fdu_check_package:nnn { ctex         } { 2017/08/07 } { 2.4.10 }
\__fdu_check_package:nnn { fontspec     } { 2017/07/23 } { 2.6c   }
\__fdu_check_package:nnn { unicode-math } { 2017/08/02 } { 0.8f   }
\sys_if_engine_xetex:T
  { \__fdu_check_package:nnn { xeCJK } { 2017/08/07 } { 3.5.0 } }
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


\tl_new:N    \g__fdu_main_font_tl
\tl_new:N    \g__fdu_sans_font_tl
\tl_new:N    \g__fdu_mono_font_tl
\tl_new:N    \g__fdu_math_font_tl
\clist_new:N \g__fdu_main_font_option_clist
\clist_new:N \g__fdu_sans_font_option_clist
\clist_new:N \g__fdu_mono_font_option_clist
\clist_new:N \g__fdu_math_font_option_clist

\tl_new:N    \g__fdu_cjk_main_font_tl
\tl_new:N    \g__fdu_cjk_sans_font_tl
\tl_new:N    \g__fdu_cjk_mono_font_tl
\clist_new:N \g__fdu_cjk_main_font_option_clist
\clist_new:N \g__fdu_cjk_sans_font_option_clist
\clist_new:N \g__fdu_cjk_mono_font_option_clist

\tl_new:N    \g__fdu_cjk_song_font_tl
\tl_new:N    \g__fdu_cjk_hei_font_tl
\tl_new:N    \g__fdu_cjk_fang_font_tl
\tl_new:N    \g__fdu_cjk_kai_font_tl
\tl_new:N    \g__fdu_cjk_songbf_font_tl
% 暂时不需要
%\clist_new:N \g__fdu_cjk_song_font_option_clist
%\clist_new:N \g__fdu_cjk_hei_font_option_clist
%\clist_new:N \g__fdu_cjk_fang_font_option_clist
%\clist_new:N \g__fdu_cjk_kai_font_option_clist
%\clist_new:N \g__fdu_cjk_songbf_font_option_clist



% #1 = main/sans/mono/math
% #2 = font name
% #3 = options
\cs_new_protected:Npn \fdu_choose_font_with_option:nnn #1#2#3
  {
    \tl_set:cn    { g__fdu_ #1 _font_tl           } {#2}
    \clist_set:cn { g__fdu_ #1 _font_option_clist } {#3}
  }
\cs_new_protected:Npn \fdu_choose_font:nn #1#2
  { \tl_set:cn { g__fdu_ #1 _font_tl } {#2} }

% #1 = song/hei/fang/kai/songbf
% #2 = font name
% #3 = options
\cs_new_protected:Npn \fdu_choose_cjk_font_with_option:nnn #1#2#3
  {
    \tl_set:cn    { g__fdu_cjk_ #1 _font_tl           } {#2}
    \clist_set:cn { g__fdu_cjk_ #1 _font_option_clist } {#3}
  }
\cs_new_protected:Npn \fdu_choose_cjk_font:nn #1#2
  { \tl_set:cn { g__fdu_cjk_ #1 _font_tl } {#2} }


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 字体选项
\keys_define:nn { fdu / style }
  {
    font .choice:,
    font .value_required:n = true,
    font / libertinus .code:n =
      {
        \fdu_choose_font:nn { main } { Libertinus~ Serif }
        \fdu_choose_font:nn { sans } { Libertinus~ Sans  }
        \fdu_choose_font_with_option:nnn { mono }
          { TeX~ Gyre~ Cursor } { Ligatures = Common Off }
        \fdu_choose_font:nn { math } { Libertinus~ Math  }
        \keys_set:nn { fdu / style } { footnotestyle = libertinus }
      },
    font / lm .code:n =
      {
        \fdu_choose_font:nn { main } { Latin~ Modern~ Roman }
        \fdu_choose_font:nn { sans } { Latin~ Modern~ Sans  }
        \fdu_choose_font:nn { mono } { Latin~ Modern~ Mono  }
        \fdu_choose_font:nn { math } { Latin~ Modern~ Math  }
        \keys_set:nn { fdu / style } { footnotestyle = pifont }
      },
    font / palatino .code:n =
      {
        \fdu_choose_font:nn { main } { TeX~ Gyre~ Pagella }
        \fdu_choose_font:nn { sans } { TeX~ Gyre~ Heros   }
        \fdu_choose_font_with_option:nnn { mono }
          { TeX~ Gyre~ Cursor } { Ligatures = Common Off }
%%%%%%%%%%% DEBUG
        \fdu_choose_font:nn { math } { TeX~ Gyre~ Pagella~ Math }
        %\fdu_choose_font_with_option:nnn { math }
        %  { TeX~ Gyre~ Pagella~ Math } { math-style=upright }
%%%%%%%%%%% DEBUG
        \keys_set:nn { fdu / style } { footnotestyle = pifont }
      },
    font / times .code:n =
      {
        \fdu_choose_font:nn { main } { XITS              }
        \fdu_choose_font:nn { sans } { TeX~ Gyre~ Heros  }
        \fdu_choose_font_with_option:nnn { mono }
          { TeX~ Gyre~ Cursor } { Ligatures = Common Off }
        \fdu_choose_font:nn { math } { XITS~ Math        }
        \keys_set:nn { fdu / style } { footnotestyle = xits }
      },
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    cjkfont .choice:,
    cjkfont .value_required:n = true,
    cjkfont / adobe .code:n =
      {
        \fdu_choose_cjk_font:nn { song   } { Adobe~ Song~     Std }
        \fdu_choose_cjk_font:nn { hei    } { Adobe~ Heiti~    Std }
        \fdu_choose_cjk_font:nn { fang   } { Adobe~ Fangsong~ Std }
        \fdu_choose_cjk_font:nn { kai    } { Adobe~ Kaiti~    Std }
        \fdu_choose_cjk_font:nn { songbf } { }
      },
    cjkfont / fandol .code:n =
      {
        \fdu_choose_cjk_font:nn { song   } { FandolSong       }
        \fdu_choose_cjk_font:nn { hei    } { FandolHei        }
        \fdu_choose_cjk_font:nn { fang   } { FandolFang       }
        \fdu_choose_cjk_font:nn { kai    } { FandolKai        }
        \fdu_choose_cjk_font:nn { songbf } { FandolSong~ Bold }
      },
    cjkfont / founder .code:n =
      {
        \fdu_choose_cjk_font:nn { song   } { FZShuSong-Z01      }
        \fdu_choose_cjk_font:nn { hei    } { FZHei-B01          }
        \fdu_choose_cjk_font:nn { fang   } { FZFangSong-Z02     }
        \fdu_choose_cjk_font:nn { kai    } { FZKai-Z03          }
        \fdu_choose_cjk_font:nn { songbf } { FZXiaoBiaoSong-B05 }
      },
    cjkfont / mac .code:n =
      {
        \fdu_choose_cjk_font:nn { song   } { STSong      }
        \fdu_choose_cjk_font:nn { hei    } { STHeiti     }
        \fdu_choose_cjk_font:nn { fang   } { STFangsong  }
        \fdu_choose_cjk_font:nn { kai    } { STKaiti     }
        \fdu_choose_cjk_font:nn { songbf } { STZhongsong }
      },
    cjkfont / windows .code:n =
      {
        \fdu_choose_cjk_font:nn { song   } { SimSun   }
        \fdu_choose_cjk_font:nn { hei    } { SimHei   }
        \fdu_choose_cjk_font:nn { fang   } { FangSong }
        \fdu_choose_cjk_font:nn { kai    } { KaiTi    }
        \fdu_choose_cjk_font:nn { songbf } { }
      }
  }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 设定西文字体

\cs_generate_variant:Nn \__fontspec_main_setmainfont:nnn { nvv }
\cs_generate_variant:Nn \__fontspec_main_setsansfont:nnn { nvv }
\cs_generate_variant:Nn \__fontspec_main_setmonofont:nnn { nvv }

\cs_new:Npn \__fdu_set_font:
  {
    \clist_map_inline:nn { main, sans, mono }
      { \__fdu_set_font_aux:n {##1} }
    % 数学字体另外处理
    \__fdu_set_math_font:VV
      \g__fdu_math_font_tl \g__fdu_math_font_option_clist
  }

\cs_new:Npn \__fdu_set_font_aux:n #1
  {
    % `\__fontspec_main_set...font:n` 的参数 1、3 均为 options
    % 我们这里只用了参数 2、3
    \use:c { __fontspec_main_set #1 font:nvv } { }
      { g__fdu_ #1 _font_tl } { g__fdu_ #1 _font_option_clist }
  }

% unicode-math 中 \setmathfont 的拷贝
% 没有办法，只好把代码复制一遍了
% #1 = font name
% #2 = options
\cs_new:Npn \__fdu_set_math_font:nn #1#2
  {
    \tl_set:Nn \l__um_fontname_tl {#1}
    \__um_init:
    \cs_if_exist:cF { S@ \f@size } { \calculate@math@sizes }
    \csname S@\f@size\endcsname
    \keys_set_known:nnN {unicode-math} {#2} \l__um_unknown_keys_clist
    \bool_if:NT \l__um_init_bool { \__um_log:n {default-math-font} }
    \__um_fontspec_select_font:
    \bool_if:nT { \l__um_ot_math_bool && !\g__um_mainfont_already_set_bool }
      {
        \__um_declare_math_sizes:
        \__um_fontspec_select_font:
      }
    \cs_if_exist:cF { sym \__um_symfont_tl }
      {
        \DeclareSymbolFont{\__um_symfont_tl}
          {\encodingdefault}{\l__um_family_tl}{\mddefault}{\updefault}
      }
    \SetSymbolFont{\__um_symfont_tl}{\l__um_mversion_tl}
      {\encodingdefault}{\l__um_family_tl}{\mddefault}{\updefault}
    \tl_set:Nn \l__um_tmpa_tl {normal}
    \tl_if_eq:NNT \l__um_mversion_tl \l__um_tmpa_tl
      {
        \SetSymbolFont{\__um_symfont_tl}{bold}
          {\encodingdefault}{\l__um_family_tl}{\bfdefault}{\updefault}
      }
    \bool_if:nT { \l__um_ot_math_bool && !\g__um_mainfont_already_set_bool }
      {
        \bool_set_true:N \g__um_mainfont_already_set_bool
        \__um_setup_legacy_fam_two:
        \__um_setup_legacy_fam_three:
      }
    \__um_input_math_symbol_table:
    \__um_remap_symbols:
    \__um_setup_mathactives:
    \__um_setup_delcodes:
    \__um_setup_alphabets:
    \__um_setup_negations:
    \ignorespaces
  }
\cs_generate_variant:Nn \__fdu_set_math_font:nn { VV }


% 设定中文字体

% 不能展开，各 tl 变量应当在最后调用字体时放进来
\cs_new:Npn \__fdu_set_cjk_font:
  {
    \__fdu_set_cjk_font_aux:nn { main }
      {
        \__fdu_set_cjk_main_font:Vx \g__fdu_cjk_song_font_tl
          {
            BoldFont       = \g__fdu_cjk_hei_font_tl,  % 加上 黑体/粗宋 选项
            ItalicFont     = \g__fdu_cjk_kai_font_tl,
            BoldItalicFont = \g__fdu_cjk_kai_font_tl   % 讲道理应该用粗楷
          }
      }
    \__fdu_set_cjk_font_aux:nn { sans }
      {
        \__fdu_set_cjk_sans_font:Vx \g__fdu_cjk_hei_font_tl
          {
            BoldFont       = \g__fdu_cjk_hei_font_tl,  % 加上 粗黑 选项？
            ItalicFont     = \g__fdu_cjk_hei_font_tl,
            BoldItalicFont = \g__fdu_cjk_hei_font_tl
          }
      }
    \__fdu_set_cjk_font_aux:nn { mono }
      {
        \__fdu_set_cjk_mono_font:Vx \g__fdu_cjk_fang_font_tl
          {
            BoldFont       = \g__fdu_cjk_fang_font_tl,
            ItalicFont     = \g__fdu_cjk_kai_font_tl,
            BoldItalicFont = \g__fdu_cjk_kai_font_tl   % 应该用粗楷
          }
      }
    % 原则上楷体就够了
    \__fdu_set_cjk_kai_font:V \g__fdu_cjk_kai_font_tl
  }

\cs_new:Npn \__fdu_set_cjk_font_aux:nn #1#2
  {
    \bool_if:cTF { l__fdu_set_cjk_ #1 _font_bool }
      {
        \__fdu_set_cjk_main_font:vv
          { g__fdu_cjk_ #1 _font_tl           }
          { g__fdu_cjk_ #1 _font_option_clist }
      }
      {#2}
  }


% #1 = font name
% #2 = options
\cs_new_protected:Npx \__fdu_set_cjk_main_font:nn #1#2
  {
    \sys_if_engine_xetex:TF
      { \xeCJK_set_family:nnn { \CJKrmdefault } {#2} {#1} }
      {
        \sys_if_engine_luatex:T
          { \ctex_ltj_set_family:nnn { \CJKrmdefault } {#2} {#1} }
      }
  }
\cs_new_protected:Npx \__fdu_set_cjk_sans_font:nn #1#2
  {
    \sys_if_engine_xetex:TF
      { \xeCJK_set_family:nnn { \CJKsfdefault } {#2} {#1} }
      {
        \sys_if_engine_luatex:T
          { \ctex_ltj_set_family:nnn { \CJKsfdefault } {#2} {#1} }
      }
  }
\cs_new_protected:Npx \__fdu_set_cjk_mono_font:nn #1#2
  {
    \sys_if_engine_xetex:TF
      { \xeCJK_set_family:nnn { \CJKttdefault } {#2} {#1} }
      {
        \sys_if_engine_luatex:T
          { \ctex_ltj_set_family:nnn { \CJKttdefault } {#2} {#1} }
      }
  }
\cs_generate_variant:Nn \__fdu_set_cjk_main_font:nn { Vx, vv }
\cs_generate_variant:Nn \__fdu_set_cjk_sans_font:nn { Vx, vv }
\cs_generate_variant:Nn \__fdu_set_cjk_mono_font:nn { Vx, vv }


\cs_new:Npx \__fdu_set_cjk_kai_font:n #1
  {
    \sys_if_engine_xetex:TF
      { \exp_not:N \xeCJK_set_family:nnn { kai } { } {#1} }
      {
        \sys_if_engine_luatex:T
          { \exp_not:N \ctex_ltj_set_family:nnn { kai } { } {#1} }
      }
  }
\cs_generate_variant:Nn \__fdu_set_cjk_kai_font:n { V }


% xeCJK: 这里给这两个 prop 赋一个值，使得 xeCJK 认为已定义 rm family
% LuaTeX 引擎下 ctex-ltj 不会报 warning，暂且不管
\sys_if_engine_xetex:T
  {
    \prop_put:Nnn \g__xeCJK_family_font_name_prop { rm } { }
    \prop_put:Nnn \g__xeCJK_family_name_prop      { rm } { }
  }

% 重定义文档命令
% 使得只选择字体，而不实际调用字体
\RenewDocumentCommand \setmainfont { O { } m O { } }
  { \fdu_choose_font_with_option:nnn { main } {#2} {#1, #3} }
\RenewDocumentCommand \setsansfont { O { } m O { } }
  { \fdu_choose_font_with_option:nnn { sans } {#2} {#1, #3} }
\RenewDocumentCommand \setmonofont { O { } m O { } }
  { \fdu_choose_font_with_option:nnn { mono } {#2} {#1, #3} }
\RenewDocumentCommand \setmathfont { O { } m O { } }
  { \fdu_choose_font_with_option:nnn { math } {#2} {#1, #3} }



\bool_new:N \l__fdu_set_cjk_main_font_bool
\bool_new:N \l__fdu_set_cjk_sans_font_bool
\bool_new:N \l__fdu_set_cjk_mono_font_bool


\RenewDocumentCommand \setCJKmainfont { O { } m O { } }
  {
    \bool_set_true:N \l__fdu_set_cjk_main_font_bool
    \fdu_choose_cjk_font_with_option:nnn { main } {#2} {#1, #3}
  }
\RenewDocumentCommand \setCJKsansfont { O { } m O { } }
  {
    \bool_set_true:N \l__fdu_set_cjk_sans_font_bool
    \fdu_choose_cjk_font_with_option:nnn { sans } {#2} {#1, #3}
  }
\RenewDocumentCommand \setCJKmonofont { O { } m O { } }
  {
    \bool_set_true:N \l__fdu_set_cjk_mono_font_bool
    \fdu_choose_cjk_font_with_option:nnn { mono } {#2} {#1, #3}
  }


% 导言区末尾载入字体
\ctex_at_end_preamble:n
  {
%\tl_show:N \g__fdu_main_font_tl
%\tl_show:N \g__fdu_sans_font_tl
%\tl_show:N \g__fdu_mono_font_tl
%\tl_show:N \g__fdu_math_font_tl

    \__fdu_set_font:
    \__fdu_set_cjk_font:
%\clist_show:N \g__fdu_main_font_option_clist
%\prop_show:N \g__xeCJK_family_name_prop
%\prop_show:N \g__xeCJK_family_font_name_prop
  }



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 字型切换（主要用于楷体）

% 分引擎定义 \fdu_family_if_exist:nTF
\sys_if_engine_xetex:TF
  {
    \prg_new_protected_conditional:Npnn
      \fdu_family_if_exist:n #1 { TF }
      {
        \xeCJK_family_if_exist:nTF {#1}
          { \prg_return_true: } { \prg_return_false: }
      }
  }
  {
    \sys_if_engine_luatex:T
      {
        \prg_new_protected_conditional:Npnn
          \fdu_family_if_exist:n #1 { TF }
          {
            \ctex_ltj_family_if_exist:nNTF {#1} \l__fdu_tmpa_tl
              { \prg_return_true: } { \prg_return_false: }
          }
      }
  }

% 以下定义 \fdu_cjk_font_...:，目前也只有楷体需要

\cs_new_protected:Npx \fdu_cjk_font_kai:
  {
    \fdu_family_if_exist:nTF { kai }
      {
        \sys_if_engine_xetex:TF
          { \xeCJK_switch_family:n { kai } }
          {
            \sys_if_engine_luatex:T
              { \ctex_ltj_switch_family:n { kai } }
          }
      }
      { \exp_not:n { \rmfamily \itshape } }
  }

\cs_new_eq:NN \fdu@kai \fdu_cjk_font_kai:

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%              %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%% 字体设置结束 %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%              %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\keys_define:nn { fdu / style }
  {
    fontsize .choice:,
    fontsize .value_required:n = true,
    fontsize / -4 .code:n = { },
    fontsize /  5 .code:n =
      {
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
    fullwidthstop / true  .code:n =
      {
        \char_set_active_eq:nN { "3002 }
          \c__fdu_full_stop_fullwidth_tl
        \char_set_catcode_active:n { "3002 }
      },
    fullwidthstop / false .code:n = { },
    fullwidthstop .default:n  = true
  }
\keys_set:nn { ctex }
  {
    chapter =
      {
        format      = \c__fdu_def_chapter_format_tl,
        beforeskip  = \c__fdu_def_chapter_before_sep_tl,
        afterskip   = \c__fdu_def_chapter_after_sep_tl,
        number      = { \arabic { chapter } },
        fixskip     = true
      },
    section =
      {
        format      = \c__fdu_def_section_format_tl,
        beforeskip  = \c__fdu_def_section_before_sep_tl,
        afterskip   = \c__fdu_def_section_after_sep_tl,
        fixskip     = true
      },
    subsection =
      {
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
      { \markboth {#1} {#1} }
      {
        \markboth { } { }
        \tl_gset:Nn \l__fdu_header_center_mark_tl {#1}
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
\NewDocumentCommand \hypersetup { m }
  { \fdu_hyperref_setup:n {#1} }
\cs_new:Npn \fdu_hyperref_setup:n #1
  { \clist_gput_right:Nn \g__fdu_to_hyperref_clist {#1} }
\keys_define:nn { fdu / style }
  {
    hyperlink .choice:,
    hyperlink .value_required:n = true,
    hyperlink / border .code:n = { },
    hyperlink / color  .code:n =
      { \fdu_hyperref_setup:n { colorlinks = true } },
    hyperlink / none   .code:n =
      { \fdu_hyperref_setup:n { hidelinks  = true } },
    hyperlinkcolor .choice:,
    hyperlinkcolor .value_required:n = true,
    hyperlinkcolor / autumn    .code:n =
      {
        \__fdu_set_hyperlink_color:nnn
          { D70000 } { D75F00 } { AF8700 }
      },
    hyperlinkcolor / business  .code:n =
      {
        \__fdu_set_hyperlink_color:nnn
          { D14542 } { 295497 } { 1F6E43 }
      },
    hyperlinkcolor / classic   .code:n =
      {
        \__fdu_set_hyperlink_color:nnn
          { FF0000 } { 0000FF } { 00FF00 }
      },
    hyperlinkcolor / default   .code:n =
      {
        \__fdu_set_hyperlink_color:nnn
          { 990000 } { 0000B2 } { 007F00 }
      },
    hyperlinkcolor / elegant   .code:n =
      {
        \__fdu_set_hyperlink_color:nnn
          { 961212 } { C31818 } { 9B764F }
      },
    hyperlinkcolor / fantasy   .code:n =
      {
        \__fdu_set_hyperlink_color:nnn
          { FF4A19 } { FF3F94 } { 934BA1 }
      },
    hyperlinkcolor / material  .code:n =
      {
        \__fdu_set_hyperlink_color:nnn
          { E91E63 } { 009688 } { 4CAF50 }
      },
    hyperlinkcolor / science   .code:n =
      {
        \__fdu_set_hyperlink_color:nnn
          { CA0619 } { 389F9D } { FF8920 }
      },
    hyperlinkcolor / summer    .code:n =
      {
        \__fdu_set_hyperlink_color:nnn
          { 00AFAF } { 5F5FAF } { 5F8700 }
      },
    hyperlinkcolor / graylevel .code:n =
      {
        \__fdu_set_hyperlink_color:nnn
          { 616161 } { 616161 } { 616161 }
      },
    hyperlinkcolor / prl       .code:n =
      {
        \__fdu_set_hyperlink_color:nnn
          { 0000FF } { 0000FF } { 0000FF }
      },
  }
\cs_new:Npn \__fdu_set_hyperlink_color:nnn #1#2#3
  {
    \__fdu_define_hyperlink_color:nnn {#1} {#2} {#3}
    \fdu_hyperref_setup:n
      {
        linkcolor = fdu@link, linkbordercolor = fdu@link,
        urlcolor  = fdu@url,  urlbordercolor  = fdu@url,
        citecolor = fdu@cite, citebordercolor = fdu@cite
      }
  }
\cs_new:Npn \__fdu_define_hyperlink_color:nnn #1#2#3
  {
    \definecolorset { HTML } { fdu@ } { }
      { link, #1; url, #2; cite, #3}
  }
\ctex_at_end_preamble:n
  {
    \RequirePackage { hyperref }
    \hypersetup
      {
        bookmarksnumbered = true,
        pdftitle    = \l__fdu_info_title_tl,
        pdfauthor   = \l__fdu_info_author_tl,
        pdfkeywords = \l__fdu_info_keywords_clist,
        pdfcreator  = \c__fdu_def_name_pdf_creator_tl
      }
    \exp_args:NV \hypersetup \g__fdu_to_hyperref_clist
  }
\tl_const:Nn \c__fdu_fn_style_plain_tl           { plain           }
\tl_const:Nn \c__fdu_fn_style_libertinus_tl      { libertinus      }
\tl_const:Nn \c__fdu_fn_style_libertinus_negative_tl
  { libertinus* }
\tl_const:Nn \c__fdu_fn_style_libertinus_sans_tl { libertinus-sans }
\tl_const:Nn \c__fdu_fn_style_pifont_tl          { pifont          }
\tl_const:Nn \c__fdu_fn_style_pifont_negative_tl { pifont*         }
\tl_const:Nn \c__fdu_fn_style_pifont_sans_tl     { pifont-sans     }
\tl_const:Nn \c__fdu_fn_style_pifont_sans_negative_tl
  { pifont-sans* }
\tl_const:Nn \c__fdu_fn_style_xits_tl            { xits            }
\tl_const:Nn \c__fdu_fn_style_xits_sans_tl       { xits-sans       }
\tl_const:Nn \c__fdu_fn_style_xits_sans_negative_tl
  { xits-sans* }
\tl_new:N \l__fdu_fn_style_tl
\bool_if:NT \g__fdu_no_fonts_bool
  { \tl_set_eq:NN \l__fdu_fn_style_tl \c__fdu_fn_style_plain_tl }
\keys_define:nn { fdu / style }
  {
    footnotestyle .choices:nn =
      {
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
              {
                \__fdu_set_math_font:nn
                  { XITS~ Math } { version = fn-XITS }
              }
          }
      },
    footnotestyle .value_required:n = true
  }
\cs_new:Npn \__fdu_fn_symbol_libertinus:n #1
  {
    \int_compare:nTF { #1 >= 21 }
      {
        \int_compare:nTF { #1 >= 47 }
          { \symbol { \int_eval:n { "24B6 - 47 + #1 } } }
          { \symbol { \int_eval:n { "24D0 - 21 + #1 } } }
      }
      { \symbol { \int_eval:n { "2460 - 1 + #1 } } }
  }
\cs_new:Npn \__fdu_fn_symbol_libertinus_negative:n #1
  {
    \int_compare:nTF { #1 >= 11 }
      { \symbol { \int_eval:n { "24EB - 11 + #1 } } }
      { \symbol { \int_eval:n { "2776 -  1 + #1 } } }
  }
\cs_new_eq:NN \__fdu_fn_symbol_libertinus_sans:n
  \__fdu_fn_symbol_libertinus:n
\cs_new:Npn \__fdu_fn_symbol_pifont:n #1
  { \ding { \int_eval:n { 171 + #1 } } }
\cs_new:Npn \__fdu_fn_symbol_pifont_negative:n #1
  { \ding { \int_eval:n { 181 + #1 } } }
\cs_new:Npn \__fdu_fn_symbol_pifont_sans:n #1
  { \ding { \int_eval:n { 191 + #1 } } }
\cs_new:Npn \__fdu_fn_symbol_pifont_sans_negative:n #1
  { \ding { \int_eval:n { 201 + #1 } } }
\cs_new:Npn \__fdu_fn_symbol_xits:n #1
  {
    \int_compare:nTF { #1 >= 10 }
      {
        \int_compare:nTF { #1 >= 36 }
          { \symbol { \int_eval:n { "24B6 - 36 + #1 } } }
          { \symbol { \int_eval:n { "24D0 - 10 + #1 } } }
      }
      { \symbol { \int_eval:n { "2460 - 1 + #1 } } }
  }
\cs_new:Npn \__fdu_fn_symbol_xits_sans:n #1
  { \symbol { \int_eval:n { "2780 - 1 + #1 } } }
\cs_new:Npn \__fdu_fn_symbol_xits_sans_negative:n #1
  { \symbol { \int_eval:n { "278A - 1 + #1 } } }
\RenewDocumentCommand \thefootnote { }
  { \fdu_footnote_number:n { \value { footnote } } }
\cs_new:Npn \fdu_footnote_number:n #1
  {
    \tl_case:NnF \l__fdu_fn_style_tl
      {
        \c__fdu_fn_style_plain_tl
          { \int_use:N #1 }
        \c__fdu_fn_style_libertinus_tl
          {
            \fontspec { Libertinus~ Serif }
            \__fdu_fn_symbol_libertinus:n {#1}
          }
        \c__fdu_fn_style_libertinus_negative_tl
          {
            \fontspec { Libertinus~ Serif }
            \__fdu_fn_symbol_libertinus_negative:n {#1}
          }
        \c__fdu_fn_style_libertinus_sans_tl
          {
            \fontspec { Libertinus~ Sans }
            \__fdu_fn_symbol_libertinus_sans:n {#1}
          }
        \c__fdu_fn_style_pifont_tl
          { \__fdu_fn_symbol_pifont:n {#1} }
        \c__fdu_fn_style_pifont_negative_tl
          { \__fdu_fn_symbol_pifont_negative:n {#1} }
        \c__fdu_fn_style_pifont_sans_tl
          { \__fdu_fn_symbol_pifont_sans:n {#1} }
        \c__fdu_fn_style_pifont_sans_negative_tl
          { \__fdu_fn_symbol_pifont_sans_negative:n {#1} }
        \c__fdu_fn_style_xits_tl
          {
            \mathversion { fn-XITS }
            $ \__fdu_fn_symbol_xits:n {#1} $
          }
        \c__fdu_fn_style_xits_sans_tl
          {
            \mathversion { fn-XITS }
            $ \__fdu_fn_symbol_xits_sans:n {#1} $
          }
        \c__fdu_fn_style_xits_sans_negative_tl
          {
            \mathversion { fn-XITS }
            $ \__fdu_fn_symbol_xits_sans_negative:n {#1} $
          }
      }
      { \int_use:N #1 }
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
\clist_const:Nn \c__fdu_thm_style_plain_clist
  { plain, margin, change }
\clist_const:Nn \c__fdu_thm_style_break_clist
  { break, marginbreak, changebreak }
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
\cs_new:Npn \fdu_thm_new:nnnn #1#2#3#4
  {
    \theoremstyle {#1}
    \newtheorem {#3} {#4} [#2]
  }
\cs_generate_variant:Nn \fdu_thm_new:nnnn { Vnnn }
\cs_new:Npn \fdu_thm_new_no_number:nnn #1#2#3
  {
    \theoremstyle {#1}
    \newtheorem {#2} {#3}
  }
\cs_generate_variant:Nn \fdu_thm_new_no_number:nnn { Vnn }
\cs_new:Npn \fdu_thm_set_qed:n         #1
  { \theoremsymbol     {#1} }
\cs_new:Npn \fdu_thm_set_header_font:n #1
  { \theoremheaderfont {#1} }
\cs_new:Npn \fdu_thm_set_body_font:n   #1
  { \theorembodyfont   {#1} }
\cs_generate_variant:Nn \fdu_thm_set_qed:n         { V }
\cs_generate_variant:Nn \fdu_thm_set_header_font:n { V }
\cs_generate_variant:Nn \fdu_thm_set_body_font:n   { V }
\NewDocumentCommand \fdunewtheorem { s o m m }
  {
    \IfBooleanTF #1
      { \tl_set:Nn \l__fdu_thm_qed_tl { \ensuremath { \QED } } }
      { \tl_set:Nn \l__fdu_thm_qed_tl { } }
    \tl_set:Nn \l__fdu_thm_style_tl { plain }
    \IfValueT {#2}
      { \keys_set:nn { fdu / theorem } {#2} }
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
        \fdu_thm_new_no_number:Vnn \l__fdu_thm_style_tl {#3} {#4}
      }
      {
        \clist_clear:N \l__fdu_tmpa_clist
        \clist_concat:NNN \l__fdu_tmpa_clist
          \c__fdu_thm_style_plain_clist \c__fdu_thm_style_break_clist
        \clist_if_in:NVF
          \l__fdu_tmpa_clist \l__fdu_thm_style_tl
          { }
        \fdu_thm_new:Vnnn \l__fdu_thm_style_tl
          { \l__fdu_thm_counter_tl } {#3} {#4}
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
\tl_new:N    \l__fdu_cover_logo_tl
\clist_new:N \l__fdu_cover_logo_size_clist
\keys_define:nn { fdu / style }
  {
    logo     .tl_set:N    = \l__fdu_cover_logo_tl,
    logosize .clist_set:N = \l__fdu_cover_logo_size_clist
  }
\bool_new:N \l__fdu_secret_bool
\tl_new:N \l__fdu_info_secret_level_tl
\keys_define:nn { fdu / info }
  {
    secretlevel .choices:nn  =
      { none, i, ii, iii }
      {
        \int_compare:nTF
          { \l_keys_choice_int >= 2 }
          {
            \bool_set_true:N \l__fdu_secret_bool
            \__fdu_set_math_font:nn
              { XITS~ Math } { version = secret-XITS }
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
\cs_new:Npn \fdu_spread_box:Nn #1#2
  {
    \makebox [#1] [ s ]
      { \tl_map_inline:nn {#2} { ##1 \hfil } \unskip }
  }
\cs_generate_variant:Nn \fdu_spread_box:Nn { NV }
\cs_generate_variant:Nn \fdu_spread_box:Nn { Nx }
\cs_new:Npn \fdu_center_box:Nn #1#2
  { \makebox [#1] [ c ] {#2} }
\cs_generate_variant:Nn \fdu_center_box:Nn { NV }
\cs_new:Npn \fdu_fixed_width_box:Nn #1#2
  { \parbox {#1} {#2} }
\cs_new:Npn \fdu_fixed_width_center_box:Nn #1#2
  { \fdu_fixed_width_box:Nn {#1} { \centering #2 } }
\cs_generate_variant:Nn \fdu_fixed_width_center_box:Nn { NV }
\cs_new:Npn \fdu_get_text_width:Nn #1#2
  {
    \hbox_set:Nn \l__fdu_tmpa_box {#2}
    \dim_set:Nn #1
      { \box_wd:N \l__fdu_tmpa_box }
  }
\cs_new:Npn \fdu_get_max_text_width:NN #1#2
  {
    \group_begin:
    \clist_set_eq:NN \l__fdu_tmpa_clist #2
    \bool_until_do:nn { \clist_if_empty_p:N \l__fdu_tmpa_clist }
      {
        \clist_pop:NN \l__fdu_tmpa_clist \l__fdu_tmpa_tl
        \fdu_get_text_width:Nn \l__fdu_tmpa_dim
          { \large \l__fdu_tmpa_tl }
        \dim_gset:Nn #1
          { \dim_max:nn {#1} { \l__fdu_tmpa_dim } }
      }
    \group_end:
  }
\cs_new:Npn \fdu_blank_underline:N #1
  { \rule [ -0.5 ex ] {#1} { 0.4 pt } }
\cs_new:Npn \fdu_line_spread:N #1
  { \linespread {#1} \selectfont }
\cs_generate_variant:Nn \fdu_line_spread:N { n }
\cs_new:Npn \__fdu_cover_id:
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
\cs_new:Npn \__fdu_cover_logo:
  {
    \begin{center}
      \clist_pop:NN   \l__fdu_cover_logo_size_clist \l__fdu_tmpa_tl
      \clist_pop:NNTF \l__fdu_cover_logo_size_clist \l__fdu_tmpb_tl
        {
          \tl_if_empty:NTF \l__fdu_tmpa_tl
            { \includegraphics [ height = \l__fdu_tmpb_tl ] }
            {
              \includegraphics
                [
                  width  = \l__fdu_tmpa_tl,
                  height = \l__fdu_tmpb_tl
                ]
            }
        }
        { \includegraphics [ width = \l__fdu_tmpa_tl ] }
      { \l__fdu_cover_logo_tl }
    \end{center}
  }
\cs_new:Npn \__fdu_cover_title:
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
\cs_new:Npn \__fdu_cover_info:
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
\cs_new:Npn \__fdu_decl_text:NNn #1#2#3
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
    contentsname = \c__fdu_def_name_toc_tl,
    chapter / tocline =
      {
        \c__fdu_def_chapter_toc_format_tl    \CTEXnumberline {#1} #2
      },
    section / tocline =
      {
        \c__fdu_def_section_toc_format_tl    \CTEXnumberline {#1} #2
      },
    subsection / tocline =
      {
        \c__fdu_def_subsection_toc_format_tl \CTEXnumberline {#1} #2
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
    \par \mode_leave_vertical: \par
    \noindent \hangindent = 4 em  \hangafter = 1
    \group_begin:
      \normalfont \sffamily
      \c__fdu_def_name_keywords_tl \c__fdu_colon_fullwidth_tl
    \group_end:
    \clist_use:Nn \l__fdu_info_keywords_clist
      { \c__fdu_semicolon_fullwidth_tl }
    \par
    \noindent
    \group_begin:
      \normalfont \sffamily
      \c__fdu_def_name_clc_tl \c__fdu_colon_fullwidth_tl
    \group_end:
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
    \par \mode_leave_vertical: \par
    \noindent \hangindent = 4 em \hangafter = 1
    \textbf { \c__fdu_def_name_keywords_en_tl } \quad
    \clist_use:Nn \l__fdu_info_keywords_en_clist { \quad }
    \par
    \noindent
    \textbf { \c__fdu_def_name_clc_en_tl } \quad
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
      \begin{longtable} {#1}
  }
  {
      \end{longtable}
    \group_end:
  }
\keys_define:nn { fdu }
  {
    info  .meta:nn = { fdu / info  } {#1},
    style .meta:nn = { fdu / style } {#1}
  }
\keys_set:nn { fdu }
  {
    style   / fontsize       =  -4,
    style   / fullwidthstop  =  false,
    style   / automakecover  =  true,
    style   / logo           =  { fudan-name.pdf },
    style   / logosize       =  { 0.5 \textwidth },
    style   / hyperlink      =  color,
    style   / hyperlinkcolor =  default,
    info    / secretlevel    =  none,
    info    / date           =  \zhtoday,
    info    / schoolid       =  { 10246 },
    theorem / headerfont     = { \sffamily },
    theorem / bodyfont       = { \fdu@kai },
    theorem / counter        = { chapter }
  }


%\bool_show:N \g__fdu_no_fonts_bool
\bool_if:NF \g__fdu_no_fonts_bool
  {
    \keys_set:nn { fdu }
      {
        style / font    = times,
        style / cjkfont = fandol
      }
  }




\NewDocumentCommand \fdusetup { m }
  { \keys_set:nn { fdu } {#1} }
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
