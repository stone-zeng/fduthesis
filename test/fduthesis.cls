%%
%% This is file `fduthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% fduthesis.dtx  (with options: `class')
%% 
%%     Copyright (C) 2017, 2018 by Xiangdong Zeng <xdzeng96@gmail.com>
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
%%               and the derived files fduthesis.ins,
%%                                     fduthesis.cls,
%%                                     fduthesis-en.cls,
%%                                     fduthesis.def,
%%                                     fdudoc.cls,
%%                                     fdulogo.sty,
%%                                     fdulogo-example.tex,
%%                                     fduthesis-cover.tex,
%%                                     fduthesis-en.tex,
%%                                     fduthesis.pdf,
%%                                     fduthesis-en.pdf,
%%                                     latexmkrc,
%%                                     latexmkrc-en,
%%                                 and README.md.
%% 
\NeedsTeXFormat{LaTeX2e}
\RequirePackage{expl3}
\GetIdInfo $Id: fduthesis.dtx 0.6 2017-12-01 12:00:00Z Xiangdong Zeng <xdzeng96@gmail.com> $
  {Thesis template for Fudan University}
\ProvidesExplClass{\ExplFileName}
  {\ExplFileDate}{\ExplFileVersion}{\ExplFileDescription}
\RequirePackage { xparse, xtemplate, l3keys2e }
\clist_map_inline:nn { expl3, xparse, xtemplate, l3keys2e }
  {
    \@ifpackagelater {#1} { 2017/12/16 }
      { } { \msg_error:nnn { fduthesis } { l3-too-old } {#1} }
  }
\msg_new:nnn { fduthesis } { l3-too-old }
  {
    Package~ "#1"~ is~ too~ old. \\\\
    Please~ update~ an~ up-to-date~ version~ of~ the~ bundles \\
    "l3kernel"~ and~ "l3packages"~ using~ your~ TeX~ package \\
    manager~ or~ from~ CTAN.
  }
%%\sys_if_engine_xetex:F
%%  {
%%    \sys_if_engine_luatex:F
%%      {
%%        \msg_fatal:nnx { fduthesis } { unsupported-engine }
%%          { \c_sys_engine_str }
%%      }
%%  }
\msg_new:nnn { fduthesis } { unsupported-engine }
  {
    The~ fduthesis~ class~ requires~ either~ XeTeX~ or~ LuaTeX. \\\\
    "#1"~ is~ not~ supported~ at~ present.~ You~ must~ change \\
    your~ typesetting~ engine~ to~ "xelatex"~ or~ "lualatex".
  }
\box_new:N   \l__fdu_tmpa_box
\clist_new:N \l__fdu_tmpa_clist
\clist_new:N \l__fdu_tmpb_clist
\dim_new:N   \l__fdu_tmpa_dim
\dim_new:N   \l__fdu_tmpb_dim
\skip_new:N  \l__fdu_tmpa_skip
\tl_new:N    \l__fdu_tmpa_tl
\tl_new:N    \l__fdu_tmpb_tl
\int_new:N \g__fdu_thesis_type_int
\clist_new:N \g__fdu_to_ctexbook_clist
\clist_new:N \g__fdu_to_hyperref_clist
\bool_new:N \g__fdu_twoside_bool
\bool_set_true:N \g__fdu_twoside_bool
\bool_new:N \g__fdu_draft_bool
\tl_new:N \g__fdu_config_tl
\cs_generate_variant:Nn \cs_generate_variant:Nn { cn }
\cs_generate_variant:Nn \file_input:n           { V  }
\cs_generate_variant:Nn \int_to_arabic:n        { v  }
\cs_generate_variant:Nn \keys_define:nn         { nx }
\cs_generate_variant:Nn \tl_map_inline:nn       { xn }
\prg_generate_conditional_variant:Nnn \tl_if_eq:nn { Vn } { T, TF }
\cs_new:Npn \__fdu_quad:  { \skip_horizontal:n { 1 em } }
\cs_new:Npn \__fdu_qquad: { \skip_horizontal:n { 2 em } }
\cs_new_protected:Npn \__fdu_vspace:N #1
  {
    \dim_set_eq:NN \l__fdu_tmpa_dim \prevdepth
    \hrule height \c_zero_dim
    \nobreak
    \skip_vertical:N #1
    \skip_vertical:N \c_zero_skip
    \dim_set_eq:NN \prevdepth \l__fdu_tmpa_dim
  }
\cs_new_protected:Npn \__fdu_vspace:n #1
  {
    \skip_set:Nn \l__fdu_tmpa_skip {#1}
    \__fdu_vspace:N \l__fdu_tmpa_skip
  }
\cs_generate_variant:Nn \__fdu_vspace:N { c }
\cs_new:Npn \__fdu_symbol:n #1 { \tex_char:D #1 \scan_stop: }
\cs_new:Npn \__fdu_arabic:n #1
  { \int_to_arabic:v { c@ #1 } }
\cs_new_protected:Npn \__fdu_patch_cmd:Nnn #1#2#3
  {
    \ctex_patch_cmd_once:NnnnTF #1 { } {#2} {#3}
      { } { \ctex_patch_failure:N #1 }
  }
\cs_new_protected:Npn \__fdu_appto_cmd:Nn #1#2
  {
    \ctex_appto_cmd:NnnTF #1 { } {#2}
      { } { \ctex_patch_failure:N #1 }
  }
\cs_new_protected:Npn \__fdu_define_fn_style:nn #1#2
  { \tl_const:cn { c__fdu_fn_style_ #1 _tl } {#2} }
%%\cs_new_protected:Npn \__fdu_define_punct:nn #1#2
%%  { \tl_const:cn { c__fdu_ #1 _tl } { \__fdu_symbol:n {#2} } }
%%>>>
\cs_new_protected:Npn \__fdu_define_punct:nn #1#2
  { \tl_const:cn { c__fdu_ #1 _tl } {#2} }
%%<<<
\cs_new_protected:Npn \__fdu_define_name:nn #1#2
  { \tl_const:cn { c__fdu_name_ #1 _tl } {#2} }
\cs_new_protected:Npn \__fdu_define_name:nnn #1#2#3
  {
    \tl_const:cn { c__fdu_name_ #1    _tl } {#2}
    \tl_const:cn { c__fdu_name_ #1 _en_tl } {#3}
  }
\cs_new:Npn \__fdu_msg_new:nn  { \msg_new:nnn      { fduthesis } }
\cs_new:Npn \__fdu_error:n     { \msg_error:nn     { fduthesis } }
\cs_new:Npn \__fdu_error:nn    { \msg_error:nnn    { fduthesis } }
\cs_new:Npn \__fdu_error:nx    { \msg_error:nnx    { fduthesis } }
\cs_new:Npn \__fdu_error:nnn   { \msg_error:nnnn   { fduthesis } }
\cs_new:Npn \__fdu_warning:n   { \msg_warning:nn   { fduthesis } }
\cs_new:Npn \__fdu_warning:nn  { \msg_warning:nnn  { fduthesis } }
\cs_new:Npn \__fdu_warning:nxx { \msg_warning:nnxx { fduthesis } }
\cs_new:Npn \__fdu_info:nx     { \msg_info:nnx     { fduthesis } }
\keys_define:nn { fdu / option }
  {
    type .choice:,
    type .value_required:n = true,
    type .choices:nn =
      { doctor, master, bachelor }
      { \int_set_eq:NN \g__fdu_thesis_type_int \l_keys_choice_int },
    type .initial:n = bachelor,
    oneside .value_forbidden:n = true,
    twoside .value_forbidden:n = true,
    oneside .code:n =
      {
        \clist_gput_right:Nn \g__fdu_to_ctexbook_clist { oneside }
        \bool_set_false:N    \g__fdu_twoside_bool
      },
    twoside .code:n =
      {
        \clist_gput_right:Nn \g__fdu_to_ctexbook_clist { twoside }
        \bool_set_true:N     \g__fdu_twoside_bool
      },
    draft .choice:,
    draft / true  .code:n =
      {
        \bool_set_true:N     \g__fdu_draft_bool
        \clist_gput_right:Nn \g__fdu_to_ctexbook_clist { draft }
      },
    draft / false .code:n =
      { \bool_set_false:N    \g__fdu_draft_bool },
    draft .default:n = true,
    draft .initial:n = false,
    config .tl_set:N = \g__fdu_config_tl,
    unknown .code:n = { \__fdu_error:n { unknown-option } }
  }
\__fdu_msg_new:nn { unknown-option }
  { Class~ option~ "\l_keys_key_tl"~ is~ unknown. }
\ProcessKeysOptions { fdu / option }
%%>>>
\RequirePackage{CJKutf8}
%%<<<
\file_input:n { fduthesis.def }
\tl_if_empty:NF \g__fdu_config_tl
  {
    \file_input:V \g__fdu_config_tl
    \__fdu_info:nx { load-config-file } { \g__fdu_config_tl }
  }
\__fdu_msg_new:nn { load-config-file }
  { You~ are~ loading~ config~ file~ '#1'. }
\PassOptionsToClass
  {
    UTF8,
    heading    = true,
%%    fontset    = none,
%%>>>
    %zhmap      = false,
    %fontset    = windowsnew,
%<<<
    zihao      = -4,
    linespread = \c__fdu_line_spread_fp,
    \g__fdu_to_ctexbook_clist
  }
  { ctexbook }
\clist_map_inline:nn
  {
%%    { no-math           } { fontspec },
    { perpage           } { footmisc },
    { amsmath, thmmarks } { ntheorem }
  }
  { \PassOptionsToPackage #1 }
\RequirePackage { etoolbox }
\LoadClass { ctexbook }
\RequirePackage
  {
    amsmath,
%%    unicode-math,
    geometry,
    fancyhdr,
    footmisc,
    ntheorem,
    graphicx,
    longtable,
    caption,
    xcolor
  }
\cs_new_protected:Npn \__fdu_check_package:nnn #1#2#3
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
%%\__fdu_check_package:nnn { fontspec     } { 2017/09/22 } { 2.6e   }
%%\__fdu_check_package:nnn { unicode-math } { 2017/11/18 } { 0.8i   }
%%\sys_if_engine_xetex:T
%%  { \__fdu_check_package:nnn { xeCJK } { 2017/08/07 } { 3.5.0 } }
\geometry
  {
    paper      = a4paper,
    vmargin    = 2.54 cm,
    hmargin    = 3.18 cm,
    headheight = 15 pt
  }
\bool_if:NT \g__fdu_draft_bool { \geometry { showframe } }
\prop_new:N \g__fdu_font_name_prop
\prop_new:N \g__fdu_font_options_prop
\prop_new:N \g__fdu_cjk_font_name_prop
\prop_new:N \g__fdu_cjk_font_options_prop
%%\keys_define:nn { fdu / style }
%%  {
%%    font .choice:,
%%    font .value_required:n = true,
%%    font / libertinus .code:n =
%%      {
%%        \fdu_choose_font:nn { main } { Libertinus~ Serif }
%%        \fdu_choose_font:nn { sans } { Libertinus~ Sans  }
%%        \fdu_choose_font_with_option:nnn { mono }
%%          { TeX~ Gyre~ Cursor } { Ligatures = Common Off }
%%        \fdu_choose_font:nn { math } { Libertinus~ Math  }
%%        \keys_set:nn { fdu / style } { footnote-style = libertinus }
%%      },
%%    font / lm .code:n =
%%      {
%%        \fdu_choose_font:nn { main } { Latin~ Modern~ Roman }
%%        \fdu_choose_font:nn { sans } { Latin~ Modern~ Sans  }
%%        \fdu_choose_font:nn { mono } { Latin~ Modern~ Mono  }
%%        \fdu_choose_font:nn { math } { Latin~ Modern~ Math  }
%%        \keys_set:nn { fdu / style } { footnote-style = pifont }
%%      },
%%    font / palatino .code:n =
%%      {
%%        \fdu_choose_font:nn { main } { TeX~ Gyre~ Pagella }
%%        \fdu_choose_font:nn { sans } { TeX~ Gyre~ Heros   }
%%        \fdu_choose_font_with_option:nnn { mono }
%%          { TeX~ Gyre~ Cursor } { Ligatures = Common Off }
%%        \fdu_choose_font:nn { math } { TeX~ Gyre~ Pagella~ Math }
%%        \keys_set:nn { fdu / style } { footnote-style = pifont }
%%      },
%%    font / times .code:n =
%%      {
%%        \fdu_choose_font_with_option:nnn { main } { XITS }
%%          {
%%            UprightFeatures    = { SmallCapsFont = *               },
%%            BoldFeatures       = { SmallCapsFont = *~ Bold         },
%%            ItalicFeatures     = { SmallCapsFont = *~ Italic       },
%%            BoldItalicFeatures = { SmallCapsFont = *~ Bold~ Italic },
%%          }
%%        \fdu_choose_font:nn { sans } { TeX~ Gyre~ Heros  }
%%        \fdu_choose_font_with_option:nnn { mono }
%%          { TeX~ Gyre~ Cursor } { Ligatures = Common Off }
%%        \fdu_choose_font:nn { math } { XITS~ Math        }
%%        \keys_set:nn { fdu / style } { footnote-style = xits }
%%      },
%%    font / none .code:n =
%%      {
%%        \__fdu_initialize_prop:Nn \g__fdu_font_name_prop
%%          { main, sans, mono, math }
%%        \__fdu_initialize_prop:Nn \g__fdu_font_options_prop
%%          { main, sans, mono, math }
%%        \keys_set:nn { fdu / style } { footnote-style = plain }
%%      },
%%    cjk-font .choice:,
%%    cjk-font .value_required:n = true,
%%    cjk-font / adobe .code:n =
%%      {
%%        \fdu_choose_cjk_font:nn { song } { Adobe~ Song~     Std }
%%        \fdu_choose_cjk_font:nn { hei  } { Adobe~ Heiti~    Std }
%%        \fdu_choose_cjk_font:nn { fang } { Adobe~ Fangsong~ Std }
%%        \fdu_choose_cjk_font:nn { kai  } { Adobe~ Kaiti~    Std }
%%      },
%%    cjk-font / fandol .code:n =
%%      {
%%        \fdu_choose_cjk_font_with_option:nnn { song }
%%          { FandolSong } { BoldFont = FandolSong~ Bold }
%%        \fdu_choose_cjk_font:nn { hei  } { FandolHei  }
%%        \fdu_choose_cjk_font:nn { fang } { FandolFang }
%%        \fdu_choose_cjk_font:nn { kai  } { FandolKai  }
%%      },
%%    cjk-font / founder .code:n =
%%      {
%%        \fdu_choose_cjk_font_with_option:nnn { song }
%%          { FZShuSong-Z01 } { BoldFont = FZXiaoBiaoSong-B05 }
%%        \fdu_choose_cjk_font:nn { hei  } { FZHei-B01      }
%%        \fdu_choose_cjk_font:nn { fang } { FZFangSong-Z02 }
%%        \fdu_choose_cjk_font:nn { kai  } { FZKai-Z03      }
%%      },
%%    cjk-font / mac .code:n =
%%      {
%%        \fdu_choose_cjk_font_with_option:nnn { song }
%%          { STSong } { BoldFont = STZhongsong }
%%        \fdu_choose_cjk_font:nn { hei  } { STHeiti    }
%%        \fdu_choose_cjk_font:nn { fang } { STFangsong }
%%        \fdu_choose_cjk_font:nn { kai  } { STKaiti    }
%%      },
%%    cjk-font / windows .code:n =
%%      {
%%        \fdu_choose_cjk_font:nn { song } { SimSun   }
%%        \fdu_choose_cjk_font:nn { hei  } { SimHei   }
%%        \fdu_choose_cjk_font:nn { fang } { FangSong }
%%        \fdu_choose_cjk_font:nn { kai  } { KaiTi    }
%%      },
%%    cjk-font / none .code:n =
%%      {
%%        \__fdu_initialize_prop:Nn \g__fdu_cjk_font_name_prop
%%          { rm, sf, tt, kai }
%%        \__fdu_initialize_prop:Nn \g__fdu_cjk_font_options_prop
%%          { rm, sf, tt, kai }
%%      }
%%  }
%%\cs_new_protected:Npn \__fdu_initialize_prop:Nn #1#2
%%  {
%%    \prop_gclear:N #1
%%    \clist_map_inline:nn {#2} { \prop_gput:Nnn #1 {##1} { } }
%%  }
%%\clist_map_inline:nn
%%  { main, sans, mono, math }
%%  {
%%    \exp_args:Nc \RenewDocumentCommand { set #1 font } { O { } m O { } }
%%      { \fdu_choose_font_with_option:nnn { #1 } {##2} { ##1, ##3 } }
%%  }
%%\RenewDocumentCommand \setCJKmainfont { O { } m O { } }
%%  { \fdu_choose_cjk_font_with_option:nnn { rm } {#2} { #1, #3 } }
%%\RenewDocumentCommand \setCJKsansfont { O { } m O { } }
%%  { \fdu_choose_cjk_font_with_option:nnn { sf } {#2} { #1, #3 } }
%%\RenewDocumentCommand \setCJKmonofont { O { } m O { } }
%%  { \fdu_choose_cjk_font_with_option:nnn { tt } {#2} { #1, #3 } }
%%\RenewDocumentCommand \setCJKfamilyfont { m O { } m O { } }
%%  { \fdu_choose_cjk_font_with_option:nnn {#1} {#3} { #2, #4 } }
%%\cs_new_protected:Npn \fdu_choose_font_with_option:nnn #1#2#3
%%  {
%%    \prop_gput:Nnn \g__fdu_font_name_prop    {#1} {#2}
%%    \prop_gput:Nnn \g__fdu_font_options_prop {#1} {#3}
%%  }
%%\cs_new_protected:Npn \fdu_choose_font:nn #1#2
%%  {
%%    \prop_gput:Nnn \g__fdu_font_name_prop    {#1} {#2}
%%    \prop_gput:Nnn \g__fdu_font_options_prop {#1} {  }
%%  }
%%\cs_new_protected:Npn \fdu_choose_cjk_font_with_option:nnn #1#2#3
%%  {
%%    \prop_gput:Nnn \g__fdu_cjk_font_name_prop    {#1} {#2}
%%    \prop_gput:Nnn \g__fdu_cjk_font_options_prop {#1} {#3}
%%  }
%%\cs_new_protected:Npn \fdu_choose_cjk_font:nn #1#2
%%  {
%%    \prop_gput:Nnn \g__fdu_cjk_font_name_prop    {#1} {#2}
%%    \prop_gput:Nnn \g__fdu_cjk_font_options_prop {#1} {  }
%%  }
%%\cs_new_protected:Npn \__fdu_set_font:
%%  {
%%    \clist_map_inline:nn { main, sans, mono, math }
%%      {
%%        \prop_get:NnN \g__fdu_font_name_prop    {##1} \l__fdu_tmpa_tl
%%        \prop_get:NnN \g__fdu_font_options_prop {##1} \l__fdu_tmpb_tl
%%        \tl_if_empty:NT \l__fdu_tmpa_tl
%%          { \__fdu_error:nn { font-not-defined } {##1} }
%%        \use:c { __fdu_set_ ##1 _font:VV } \l__fdu_tmpa_tl \l__fdu_tmpb_tl
%%      }
%%  }
%%\clist_map_inline:nn { main, sans, mono }
%%  {
%%    \cs_new_protected:cpx { __fdu_set_ #1 _font:nn } ##1 ##2
%%      { \exp_not:c { __fontspec_main_set #1 font:nn } {##2} {##1} }
%%  }
%%\cs_new_protected:Npn \__fdu_set_math_font:nn #1#2
%%  { \__um_setmathfont:nn {#2} {#1} }
%%\clist_map_inline:nn { main, sans, mono, math }
%%  { \cs_generate_variant:cn { __fdu_set_ #1 _font:nn } { VV } }
%%\cs_new_protected:Npn \__fdu_set_cjk_font:
%%  {
%%    \clist_map_inline:nn { rm, sf, tt, kai }
%%      {
%%        \use:c { __fdu_parse_cjk_ ##1 _font: }
%%        \__fdu_check_cjk_font:n   {##1}
%%        \__fdu_set_cjk_font_aux:n {##1}
%%      }
%%    \clist_map_inline:nn { song, hei, fang }
%%      {
%%        \prop_gremove:Nn \g__fdu_cjk_font_name_prop    {##1}
%%        \prop_gremove:Nn \g__fdu_cjk_font_options_prop {##1}
%%      }
%%  }
%%\tl_new:N    \l__fdu_font_name_tl
%%\clist_new:N \l__fdu_font_options_clist
%%\cs_new_protected:Npn \__fdu_parse_cjk_rm_font:
%%  {
%%    \prop_get:NnNF \g__fdu_cjk_font_name_prop
%%      { rm } \l__fdu_font_name_tl
%%      {
%%        \__fdu_get_cjk_font_name_options:nn { rm } { song }
%%        \use_ii:nn
%%          {
%%            \tl_if_in:NnF \l__fdu_font_options_clist { BoldFont = }
%%              {
%%                \clist_put_right:Nx \l__fdu_font_options_clist
%%                  { BoldFont = \l__fdu_font_name_tl }
%%              }
%%          }
%%          {
%%            \prop_get:NnN \g__fdu_cjk_font_name_prop { hei }
%%              \l__fdu_tmpa_tl
%%            \clist_put_right:Nx \l__fdu_font_options_clist
%%              { BoldFont = \l__fdu_tmpa_tl }
%%          }
%%        \__fdu_get_cjk_kai_font:
%%        \__fdu_set_cjk_font_options:n { rm }
%%      }
%%  }
%%\cs_new_protected:Npn \__fdu_parse_cjk_sf_font:
%%  {
%%    \prop_get:NnNF \g__fdu_cjk_font_name_prop
%%      { sf } \l__fdu_font_name_tl
%%      {
%%        \__fdu_get_cjk_font_name_options:nn { sf } { hei }
%%        \clist_put_right:Nx \l__fdu_font_options_clist
%%          {
%%            BoldFont       = \l__fdu_font_name_tl,
%%            ItalicFont     = \l__fdu_font_name_tl,
%%            BoldItalicFont = \l__fdu_font_name_tl
%%          }
%%        \__fdu_set_cjk_font_options:n { sf }
%%      }
%%  }
%%\cs_new_protected:Npn \__fdu_parse_cjk_tt_font:
%%  {
%%    \prop_get:NnNF \g__fdu_cjk_font_name_prop
%%      { tt } \l__fdu_font_name_tl
%%      {
%%        \__fdu_get_cjk_font_name_options:nn { tt } { fang }
%%        \clist_put_right:Nx \l__fdu_font_options_clist
%%          { BoldFont = \l__fdu_font_name_tl }
%%        \__fdu_get_cjk_kai_font:
%%        \__fdu_set_cjk_font_options:n { tt }
%%      }
%%  }
%%\cs_new_protected:Npn \__fdu_parse_cjk_kai_font:
%%  {
%%    \prop_get:NnN \g__fdu_cjk_font_name_prop { kai }
%%      \l__fdu_font_name_tl
%%    \clist_set:Nx \l__fdu_font_options_clist
%%      {
%%        BoldFont       = \l__fdu_font_name_tl,
%%        ItalicFont     = \l__fdu_font_name_tl,
%%        BoldItalicFont = \l__fdu_font_name_tl
%%      }
%%    \__fdu_set_cjk_font_options:n { kai }
%%  }
%%\cs_new_protected:Npn \__fdu_get_cjk_font_name_options:nn #1#2
%%  {
%%    \prop_get:NnN  \g__fdu_cjk_font_name_prop    {#2} \l__fdu_font_name_tl
%%    \prop_gput:NnV \g__fdu_cjk_font_name_prop    {#1} \l__fdu_font_name_tl
%%    \prop_get:NnN  \g__fdu_cjk_font_options_prop {#2} \l__fdu_tmpa_tl
%%    \clist_set:NV  \l__fdu_font_options_clist \l__fdu_tmpa_tl
%%  }
%%\cs_new_protected:Npn \__fdu_get_cjk_kai_font:
%%  {
%%    \prop_get:NnN \g__fdu_cjk_font_name_prop { kai }
%%      \l__fdu_tmpa_tl
%%    \clist_put_right:Nx \l__fdu_font_options_clist
%%      {
%%        ItalicFont     = \l__fdu_tmpa_tl,
%%        BoldItalicFont = \l__fdu_tmpa_tl
%%      }
%%  }
%%\cs_new_protected:Npn \__fdu_set_cjk_font_options:n #1
%%  {
%%    \prop_put:NnV \g__fdu_cjk_font_options_prop {#1}
%%      \l__fdu_font_options_clist
%%  }
%%\cs_new_protected:Npn \__fdu_check_cjk_font:n #1
%%  {
%%    \prop_get:NnN \g__fdu_cjk_font_name_prop {#1}
%%      \l__fdu_font_name_tl
%%    \tl_if_empty:NT \l__fdu_font_name_tl
%%      { \__fdu_error:nn { cjk-font-not-defined } {#1} }
%%  }
%%\cs_generate_variant:Nn \xeCJK_set_family:nnn    { nVV }
%%\cs_generate_variant:Nn \ctex_ltj_set_family:nnn { nVV }
%%\cs_new_protected:Npx \__fdu_set_cjk_font_aux:n #1
%%  {
%%    \prop_get:NnN \exp_not:N \g__fdu_cjk_font_name_prop    {#1}
%%      \exp_not:N \l__fdu_tmpa_tl
%%    \prop_get:NnN \exp_not:N \g__fdu_cjk_font_options_prop {#1}
%%      \exp_not:N \l__fdu_tmpb_tl
%%    \sys_if_engine_xetex:TF
%%      { \xeCJK_set_family:nVV }
%%      { \sys_if_engine_luatex:T { \ctex_ltj_set_family:nVV } }
%%    {#1} \exp_not:n { \l__fdu_tmpb_tl \l__fdu_tmpa_tl }
%%  }
%%\__fdu_msg_new:nn { font-not-defined }
%%  {
%%    \str_upper_case:f { \tl_head:n {#1} } \tl_tail:n {#1} ~
%%    font~ is~ not~ defined. \\\\
%%    You~ can~ set~ option~ "font"~ via~ "\string\fdusetup",~
%%    or~ use~ command~ \\
%%    "\string\set #1 font"~ to~ define~ new~ font~ families.
%%  }
%%\__fdu_msg_new:nn { cjk-font-not-defined }
%%  {
%%    CJK~ font~ family~ "#1"~ is~ not~ defined. \\\\
%%    You~ can~ set~ option~ "cjk-font"~ via~ "\string\fdusetup",~
%%    or~ use~ commands~ \\
%%    "\string\setCJKmainfont",~ "\string\setCJKsansfont"~ or~
%%    "\string\setCJKmonofont",~ etc~ \\
%%    to~ define~ new~ CJK~ font~ families.
%%  }
%%\sys_if_engine_xetex:T
%%  {
%%    \prop_gput:Nnn \g__xeCJK_family_font_name_prop { rm } { }
%%    \prop_gput:Nnn \g__xeCJK_family_name_prop      { rm } { }
%%    \msg_redirect_name:nnn { xeCJK } { CJKfamily-redef } { none }
%%  }
%%\ctex_at_end_preamble:n
%%  {
%%    \__fdu_set_font:
%%    \__fdu_set_cjk_font:
%%  }
%%\sys_if_engine_xetex:TF
%%  {
%%    \prg_new_protected_conditional:Npnn
%%      \fdu_family_if_exist:n #1 { TF }
%%      {
%%        \xeCJK_family_if_exist:nTF {#1}
%%          { \prg_return_true: } { \prg_return_false: }
%%      }
%%  }
%%  {
%%    \sys_if_engine_luatex:T
%%      {
%%        \prg_new_protected_conditional:Npnn
%%          \fdu_family_if_exist:n #1 { TF }
%%          {
%%            \ctex_ltj_family_if_exist:nNTF {#1} \l__fdu_tmpa_tl
%%              { \prg_return_true: } { \prg_return_false: }
%%          }
%%      }
%%  }
%%\cs_new_protected:Npx \fdu_cjk_font_kai:
%%  {
%%    \fdu_family_if_exist:nTF { kai }
%%      {
%%        \sys_if_engine_xetex:TF
%%          { \xeCJK_switch_family:n { kai } }
%%          {
%%            \sys_if_engine_luatex:T
%%              { \ctex_ltj_switch_family:n { kai } }
%%          }
%%      }
%%      { \exp_not:n { \rmfamily \itshape } }
%%  }
%%\cs_new_eq:NN \fdu@kai \fdu_cjk_font_kai:
%%\keys_set:nn { unicode-math }
%%  {
%%    math-style = ISO,
%%    bold-style = ISO,
%%  }
%%>>>
\cs_new_protected:Npx \fdu_cjk_font_kai:
  { \exp_not:n { \rmfamily \itshape } }
\cs_new_eq:NN \fdu@kai \fdu_cjk_font_kai:
%%<<<
\keys_define:nn { fdu / style }
  {
    font-size .choice:,
    font-size .value_required:n = true,
    font-size / -4 .code:n = { },
    font-size /  5 .code:n =
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
    fullwidth-stop .choice:,
    fullwidth-stop .value_required:n = true,
    fullwidth-stop / catcode .code:n =
      { \__fdu_set_fullwidth_stop_catcode: },
    fullwidth-stop / mapping .code:n =
      {
        \sys_if_engine_xetex:TF
          {
            \clist_gset:Nn \g__xeCJK_default_features_clist
              { Mapping = fullwidth-stop }
          }
          {
%%            \sys_if_engine_luatex:T
%%              {
                \__fdu_warning:n { mapping-not-available }
                \__fdu_set_fullwidth_stop_catcode:
%%              }
          }
      },
    fullwidth-stop / false .code:n = { }
  }
\__fdu_msg_new:nn { mapping-not-available }
  {
    Option~ "fullwidth-stop = mapping"~ is~ not~ available~ in~ LuaTeX. \\
    "fullwidth-stop = catcode"~ will~ be~ set~ instead.
  }
\cs_new_protected:Npn \__fdu_set_fullwidth_stop_catcode:
  {
%%    \char_set_active_eq:nN { "3002 } \c__fdu_fullwidth_full_stop_tl
%%    \char_set_catcode_active:n { "3002 }
%%>>>
    % http://bbs.ctex.org/forum.php?mod=viewthread&tid=71625
    % ^^e3^^80^^82 句号
    % ^^ef^^bc^^8e 句点
    \AtBeginDocument
      {
        \cs_new_eq:cN { __fdu_cjk_char_e3:w } ^^e3
        \cs_set:Npn ^^e3 ^^80 ##1
          {
            \int_compare:nTF { `##1 = `^^82 }
              { ^^ef ^^bc ^^8e }
              { \use:c { __fdu_cjk_char_e3:w } ^^80 ##1 }
          }
      }
%%<<<
  }
\keys_set:nn { ctex }
  {
    chapter =
      {
        format      = \huge \normalfont \sffamily \centering,
        beforeskip  = 50 pt,
        afterskip   = 40 pt,
        number      = \__fdu_arabic:n { chapter },
        fixskip     = true
      },
    section =
      {
        format      = \Large \normalfont \sffamily \raggedright,
        beforeskip  = 3.5 ex plus 1.0 ex minus 0.2 ex,
        afterskip   = 2.7 ex plus 0.5 ex,
        fixskip     = true
      },
    subsection =
      {
        format      = \large \normalfont \sffamily \raggedright,
        beforeskip  = 3.25 ex plus 1.0 ex minus 0.2 ex,
        afterskip   = 2.5  ex plus 0.3 ex,
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
%%\clist_map_inline:nn
%%  {
%%    { plain           } { plain           },
%%    { libertinus      } { libertinus      },
%%    { libertinus_neg  } { libertinus*     },
%%    { libertinus_sans } { libertinus-sans },
%%    { pifont          } { pifont          },
%%    { pifont_neg      } { pifont*         },
%%    { pifont_sans     } { pifont-sans     },
%%    { pifont_sans_neg } { pifont-sans*    },
%%    { xits            } { xits            },
%%    { xits_sans       } { xits-sans       },
%%    { xits_sans_neg   } { xits-sans*      }
%%  }
%%  { \__fdu_define_fn_style:nn #1 }
%%\tl_new:N \l__fdu_fn_style_tl
%%\keys_define:nn { fdu / style }
%%  {
%%    footnote-style .choices:nn =
%%      {
%%        plain,
%%        libertinus, libertinus*, libertinus-sans,
%%        pifont,     pifont*,     pifont-sans,     pifont-sans*,
%%        xits,                    xits-sans,       xits-sans*
%%      }
%%      {
%%        \tl_gset_eq:NN \l__fdu_fn_style_tl \l_keys_choice_tl
%%        \int_compare:nT { 5 <= \l_keys_choice_int <= 8 }
%%          { \RequirePackage { pifont } }
%%      },
%%    footnote-style .value_required:n = true
%%  }
%%\cs_new:Npn \__fdu_fn_symbol_libertinus:n #1
%%  {
%%    \int_compare:nTF { #1 >= 21 }
%%      {
%%        \int_compare:nTF { #1 >= 47 }
%%          { \__fdu_symbol:n { \int_eval:n { "24B6 - 47 + #1 } } }
%%          { \__fdu_symbol:n { \int_eval:n { "24D0 - 21 + #1 } } }
%%      }
%%      { \__fdu_symbol:n { \int_eval:n { "2460 - 1 + #1 } } }
%%  }
%%\cs_new:Npn \__fdu_fn_symbol_libertinus_neg:n #1
%%  {
%%    \int_compare:nTF { #1 >= 11 }
%%      { \__fdu_symbol:n { \int_eval:n { "24EB - 11 + #1 } } }
%%      { \__fdu_symbol:n { \int_eval:n { "2776 -  1 + #1 } } }
%%  }
%%\cs_new_eq:NN \__fdu_fn_symbol_libertinus_sans:n
%%  \__fdu_fn_symbol_libertinus:n
%%\cs_new:Npn \__fdu_fn_symbol_pifont:n #1
%%  { \ding { \int_eval:n { 171 + #1 } } }
%%\cs_new:Npn \__fdu_fn_symbol_pifont_neg:n #1
%%  { \ding { \int_eval:n { 181 + #1 } } }
%%\cs_new:Npn \__fdu_fn_symbol_pifont_sans:n #1
%%  { \ding { \int_eval:n { 191 + #1 } } }
%%\cs_new:Npn \__fdu_fn_symbol_pifont_sans_neg:n #1
%%  { \ding { \int_eval:n { 201 + #1 } } }
%%\cs_new:Npn \__fdu_fn_symbol_xits:n #1
%%  {
%%    \int_compare:nTF { #1 >= 10 }
%%      {
%%        \int_compare:nTF { #1 >= 36 }
%%          { \__fdu_symbol:n { \int_eval:n { "24B6 - 36 + #1 } } }
%%          { \__fdu_symbol:n { \int_eval:n { "24D0 - 10 + #1 } } }
%%      }
%%      { \__fdu_symbol:n { \int_eval:n { "2460 - 1 + #1 } } }
%%  }
%%\cs_new:Npn \__fdu_fn_symbol_xits_sans:n #1
%%  { \__fdu_symbol:n { \int_eval:n { "2780 - 1 + #1 } } }
%%\cs_new:Npn \__fdu_fn_symbol_xits_sans_neg:n #1
%%  { \__fdu_symbol:n { \int_eval:n { "278A - 1 + #1 } } }
%%\cs_set:Npn \thefootnote { \fdu_footnote_number:N \c@footnote }
%%\cs_new:Npn \fdu_footnote_number:N #1
%%  {
%%    \tl_case:NnF \l__fdu_fn_style_tl
%%      {
%%        \c__fdu_fn_style_plain_tl
%%          { \int_use:N #1 }
%%        \c__fdu_fn_style_libertinus_tl
%%          {
%%            \fontspec { Libertinus~ Serif }
%%            \__fdu_fn_symbol_libertinus:n {#1}
%%          }
%%        \c__fdu_fn_style_libertinus_neg_tl
%%          {
%%            \fontspec { Libertinus~ Serif }
%%            \__fdu_fn_symbol_libertinus_neg:n {#1}
%%          }
%%        \c__fdu_fn_style_libertinus_sans_tl
%%          {
%%            \fontspec { Libertinus~ Sans }
%%            \__fdu_fn_symbol_libertinus_sans:n {#1}
%%          }
%%        \c__fdu_fn_style_pifont_tl
%%          { \__fdu_fn_symbol_pifont:n {#1} }
%%        \c__fdu_fn_style_pifont_neg_tl
%%          { \__fdu_fn_symbol_pifont_neg:n {#1} }
%%        \c__fdu_fn_style_pifont_sans_tl
%%          { \__fdu_fn_symbol_pifont_sans:n {#1} }
%%        \c__fdu_fn_style_pifont_sans_neg_tl
%%          { \__fdu_fn_symbol_pifont_sans_neg:n {#1} }
%%        \c__fdu_fn_style_xits_tl
%%          {
%%            \fontspec { XITS }
%%            \__fdu_fn_symbol_xits:n {#1}
%%          }
%%        \c__fdu_fn_style_xits_sans_tl
%%          {
%%            \fontspec { XITS }
%%            \__fdu_fn_symbol_xits_sans:n {#1}
%%          }
%%        \c__fdu_fn_style_xits_sans_neg_tl
%%          {
%%            \fontspec { XITS }
%%            \__fdu_fn_symbol_xits_sans_neg:n {#1}
%%          }
%%      }
%%      { \int_use:N #1 }
%%  }
\cs_set:Npn \@makefntext #1
  {
    \mode_leave_vertical:
    \hbox_to_wd:nn { 1.5 em } { \@thefnmark \hfil }
    #1
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
    style       .tl_set:N  = \l__fdu_thm_style_tl,
    header-font .tl_set:N  = \l__fdu_thm_header_font_tl,
    body-font   .tl_set:N  = \l__fdu_thm_body_font_tl,
    qed         .tl_set:N  = \l__fdu_thm_qed_tl,
    counter     .tl_set:N  = \l__fdu_thm_counter_tl
  }
\cs_new_eq:NN \__fdu_thm_ntheorem_style:n \theoremstyle
\cs_new_eq:NN \__fdu_thm_ntheorem_new:w   \newtheorem
\RenewDocumentCommand \newtheorem { s o m m }
  {
    \IfBooleanTF {#1}
      { \tl_set:Nn \l__fdu_thm_qed_tl { \ensuremath { \QED } } }
      { \tl_set:Nn \l__fdu_thm_qed_tl { } }
    \tl_set:Nn \l__fdu_thm_style_tl { plain }
    \IfValueT {#2} { \keys_set:nn { fdu / theorem } {#2} }
    \fdu_thm_set_header_font:V \l__fdu_thm_header_font_tl
    \fdu_thm_set_body_font:V   \l__fdu_thm_body_font_tl
    \fdu_thm_set_qed:V         \l__fdu_thm_qed_tl
    \IfBooleanTF {#1}
      {
        \clist_if_in:nVF { plain, break } \l__fdu_thm_style_tl
          {
            \clist_if_in:NVTF
              \c__fdu_thm_style_plain_clist \l__fdu_thm_style_tl
              { \__fdu_thm_redefine_style:n { plain } }
              {
                \clist_if_in:NVTF
                  \c__fdu_thm_style_break_clist \l__fdu_thm_style_tl
                  { \__fdu_thm_redefine_style:n { break } }
                  {
                    \__fdu_error:nx { unknown-theorem-style }
                      { \l__fdu_thm_style_tl }
                  }
              }
          }
        \tl_put_left:Nn \l__fdu_thm_style_tl { nonumber }
        \fdu_thm_new_no_number:Vxx \l__fdu_thm_style_tl {#3} { \exp_not:o {#4} }
      }
      {
        \clist_clear:N \l__fdu_tmpa_clist
        \clist_concat:NNN \l__fdu_tmpa_clist
          \c__fdu_thm_style_plain_clist \c__fdu_thm_style_break_clist
        \clist_if_in:NVF \l__fdu_tmpa_clist \l__fdu_thm_style_tl
          {
            \__fdu_error:nx { unknown-theorem-style }
              { \l__fdu_thm_style_tl }
          }
        \fdu_thm_new:VVxx \l__fdu_thm_style_tl \l__fdu_thm_counter_tl
          {#3} { \exp_not:o {#4} }
      }
  }
\cs_new:Npn \__fdu_thm_redefine_style:n #1
  {
    \__fdu_warning:nxx { redefine-theorem-style }
      {#1} { \l__fdu_thm_style_tl }
    \tl_set:Nn \l__fdu_thm_style_tl {#1}
  }
\__fdu_msg_new:nn { redefine-theorem-style }
  { Theorem~ style~ "#2"~ will~ be~ redefined~ as~ "#1". }
\__fdu_msg_new:nn { unknown-theorem-style }
  { Theorem~ style~ "#1"~ is~ unknown. }
\cs_new:Npn \fdu_thm_new:nnnn #1#2#3#4
  {
    \__fdu_thm_ntheorem_style:n {#1}
    \__fdu_thm_ntheorem_new:w   {#3} {#4} [#2]
  }
\cs_generate_variant:Nn \fdu_thm_new:nnnn { VVxx }
\cs_new:Npn \fdu_thm_new_no_number:nnn #1#2#3
  {
    \__fdu_thm_ntheorem_style:n {#1}
    \__fdu_thm_ntheorem_new:w   {#2} {#3}
  }
\cs_generate_variant:Nn \fdu_thm_new_no_number:nnn { Vxx }
\cs_new:Npn \fdu_thm_set_qed:n         #1 { \theoremsymbol     {#1} }
\cs_new:Npn \fdu_thm_set_header_font:n #1 { \theoremheaderfont {#1} }
\cs_new:Npn \fdu_thm_set_body_font:n   #1 { \theorembodyfont   {#1} }
\cs_generate_variant:Nn \fdu_thm_set_qed:n         { V }
\cs_generate_variant:Nn \fdu_thm_set_header_font:n { V }
\cs_generate_variant:Nn \fdu_thm_set_body_font:n   { V }
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
\cs_set:Npn \thefigure
  { \__fdu_arabic:n { chapter } - \__fdu_arabic:n { figure } }
\cs_set:Npn \thetable
  { \__fdu_arabic:n { chapter } - \__fdu_arabic:n { table  } }
\clist_map_inline:nn
  {
    title, date, author, supervisor, department, major, student_id,
    school_id, clc
  }
  { \tl_new:c { l__fdu_info_ #1 _tl } }
\clist_new:N \l__fdu_info_instructors_clist
\clist_new:N \l__fdu_info_keywords_clist
\clist_map_inline:nn
  { title, author, supervisor, department, major }
  { \tl_new:c { l__fdu_info_ #1 _en_tl } }
\clist_new:N \l__fdu_info_keywords_en_clist
\int_new:N \l__fdu_info_degree_type_int
\keys_define:nn { fdu / info }
  {
    degree      .choices:nn  =
      { academic, professional }
      { \int_set_eq:NN \l__fdu_info_degree_type_int \l_keys_choice_int },
    title       .tl_set:N    = \l__fdu_info_title_tl,
    title*      .tl_set:N    = \l__fdu_info_title_en_tl,
    date        .tl_set:N    = \l__fdu_info_date_tl,
    author      .tl_set:N    = \l__fdu_info_author_tl,
    author*     .tl_set:N    = \l__fdu_info_author_en_tl,
    supervisor  .tl_set:N    = \l__fdu_info_supervisor_tl,
    instructors .clist_set:N = \l__fdu_info_instructors_clist,
    department  .tl_set:N    = \l__fdu_info_department_tl,
    major       .tl_set:N    = \l__fdu_info_major_tl,
    student-id  .tl_set:N    = \l__fdu_info_student_id_tl,
    school-id   .tl_set:N    = \l__fdu_info_school_id_tl,
    keywords    .clist_set:N = \l__fdu_info_keywords_clist,
    keywords*   .clist_set:N = \l__fdu_info_keywords_en_clist,
    clc         .tl_set:N    = \l__fdu_info_clc_tl
  }
\tl_new:N    \l__fdu_cover_logo_tl
\clist_new:N \l__fdu_cover_logo_size_clist
\keys_define:nn { fdu / style }
  {
    logo      .tl_set:N    = \l__fdu_cover_logo_tl,
    logo-size .clist_set:N = \l__fdu_cover_logo_size_clist
  }
\bool_new:N \l__fdu_secret_bool
\tl_new:N \l__fdu_info_secret_level_tl
\keys_define:nn { fdu / info }
  {
    secret-level .choices:nn  =
      { none, i, ii, iii }
      {
        \int_compare:nTF
          { \l_keys_choice_int >= 2 }
          {
            \bool_set_true:N \l__fdu_secret_bool
            \tl_set:Nn \l__fdu_info_secret_level_tl
              {
                \clist_item:Nn \c__fdu_secret_clist
                  { \l_keys_choice_int - 1 }
              }
          }
          { \bool_set_false:N \l__fdu_secret_bool }
      },
    secret-level .value_required:n = true,
    secret-year  .tl_set:N = \l__fdu_info_secret_year_tl
  }
\cs_new_protected:Npn \__fdu_spread_box:nn #1#2
  {
%%    \mode_leave_vertical:
%%    \hbox_to_wd:nn {#1}
%%      { \tl_map_inline:xn {#2} { ##1 \hfil } \unskip }
%%>>>
    \CJKfilltwosides {#1}
      #2
    \endCJKfilltwosides
%%<<<
  }
\cs_new_protected:Npn \__fdu_center_box:nn #1#2
  {
    \mode_leave_vertical:
    \hbox_to_wd:nn {#1} { \hfil #2 \hfil }
  }
\cs_generate_variant:Nn \__fdu_center_box:nn  { Vn }
\cs_new:Npn \__fdu_fixed_width_box:nn #1#2
  { \parbox {#1} {#2} }
\cs_new:Npn \__fdu_fixed_width_center_box:nn #1#2
  { \parbox {#1} { \centering #2 } }
\cs_new:Npn \__fdu_get_text_width:Nn #1#2
  {
    \hbox_set:Nn \l__fdu_tmpa_box {#2}
    \dim_set:Nn #1 { \box_wd:N \l__fdu_tmpa_box }
  }
\cs_generate_variant:Nn \__fdu_get_text_width:Nn { NV }
\cs_new:Npn \__fdu_get_max_text_width:NN #1#2
  {
    \group_begin:
      \clist_set_eq:NN \l__fdu_tmpa_clist #2
      \bool_until_do:nn { \clist_if_empty_p:N \l__fdu_tmpa_clist }
        {
          \clist_pop:NN \l__fdu_tmpa_clist \l__fdu_tmpa_tl
          \__fdu_get_text_width:NV \l__fdu_tmpa_dim \l__fdu_tmpa_tl
          \dim_gset:Nn #1 { \dim_max:nn {#1} { \l__fdu_tmpa_dim } }
        }
    \group_end:
  }
\cs_new:Npn \__fdu_blank_underline:n #1
  { \rule [ -0.5 ex ] {#1} { 0.4 pt } }
\cs_new:Npn \__fdu_line_spread:N #1
  { \linespread { \fp_use:N #1 } \selectfont }
\cs_new:Npn \__fdu_line_spread:n #1
  { \linespread {#1} \selectfont }
\cs_new_protected:Npn \__fdu_cover_id:
  {
    \__fdu_fixed_width_box:nn { 120 pt }
      {
        \bool_if:NT \l__fdu_secret_bool
          {
            \group_begin:
              \sffamily
              \__fdu_cover_id_aux:n { secret_level }
%%              \c__fdu_name_secret_star_tl
%%>>>
              $\bigstar$
%%<<<
              \l__fdu_info_secret_year_tl
            \group_end:
            \par
          }
        \__fdu_cover_id_aux:n { school_id  } \par
        \__fdu_cover_id_aux:n { student_id }
      }
    \hbox_to_wd:nn { -24 pt } { }
  }
\cs_new:Npn \__fdu_cover_id_aux:n #1
  {
    \tl_use:c { c__fdu_name_ #1 _tl }
    \c__fdu_fullwidth_colon_tl
    \tl_use:c { l__fdu_info_ #1 _tl }
  }
\cs_new_protected:Npn \__fdu_cover_logo:
  {
    \clist_pop:NN   \l__fdu_cover_logo_size_clist \l__fdu_tmpa_tl
    \clist_pop:NNTF \l__fdu_cover_logo_size_clist \l__fdu_tmpb_tl
      {
        \tl_if_empty:NTF \l__fdu_tmpa_tl
          { \includegraphics [ height = \l__fdu_tmpb_tl ] }
          {
            \includegraphics
              [ width  = \l__fdu_tmpa_tl, height = \l__fdu_tmpb_tl ]
          }
      }
      { \includegraphics [ width = \l__fdu_tmpa_tl ] }
    { \l__fdu_cover_logo_tl }
  }
\cs_new_protected:Npn \__fdu_cover_type:
  {
    \tl_set:Nx \l__fdu_tmpa_tl
      {
        \clist_item:Nn \c__fdu_thesis_type_clist
          { \g__fdu_thesis_type_int }
      }
    \__fdu_spread_box:nn { 0.45 \textwidth } { \l__fdu_tmpa_tl }
  }
\cs_new_protected:Npn \__fdu_cover_degree:
  {
    \int_compare:nNnT \g__fdu_thesis_type_int = \c_two
      {
        \tl_set:Nx \l__fdu_tmpa_tl
          {
            \clist_item:Nn \c__fdu_degree_type_clist
              { \l__fdu_info_degree_type_int }
          }
        \c__fdu_fullwidth_left_paren_tl
        \l__fdu_tmpa_tl
        \c__fdu_fullwidth_right_paren_tl
      }
  }
\cs_new_protected:Npn \__fdu_cover_info:
  {
    \begin{minipage} [ c ] { \textwidth }
      \centering \zihao { 4 }
      \clist_set:Nx \l__fdu_tmpa_clist
        {
          \exp_not:o { \c__fdu_name_department_tl },
          \exp_not:o { \c__fdu_name_major_tl      },
          \exp_not:o { \c__fdu_name_author_tl     },
          \exp_not:o { \c__fdu_name_supervisor_tl },
          \exp_not:o { \c__fdu_name_date_tl       },
        }
      \clist_set:Nx \l__fdu_tmpb_clist
        {
          \exp_not:o { \l__fdu_info_department_tl },
          \exp_not:o { \l__fdu_info_major_tl      },
          \exp_not:o { \l__fdu_info_author_tl     },
          \exp_not:o { \l__fdu_info_supervisor_tl },
          \exp_not:o { \l__fdu_info_date_tl       }
        }
      \__fdu_get_max_text_width:NN \l__fdu_tmpb_dim \l__fdu_tmpb_clist
      \bool_until_do:nn
        { \clist_if_empty_p:N \l__fdu_tmpa_clist }
        {
          \clist_pop:NN \l__fdu_tmpa_clist \l__fdu_tmpa_tl
          \clist_pop:NN \l__fdu_tmpb_clist \l__fdu_tmpb_tl
          \__fdu_spread_box:nn { 6 em } { \l__fdu_tmpa_tl }
          \c__fdu_fullwidth_colon_tl
          \__fdu_center_box:Vn \l__fdu_tmpb_dim { \l__fdu_tmpb_tl }
          \skip_vertical:n { 1 ex }
        }
    \end{minipage}
  }
\cs_new_protected:Npn \__fdu_cover_signature:N #1
  {
    \clist_map_inline:Nn #1
      {
        ##1 \c__fdu_fullwidth_colon_tl
        \__fdu_blank_underline:n { 6 em }
        \__fdu_quad:
      }
  }
\DeclareObjectType { fdu / cover } { \c_zero }
\NewDocumentCommand \DeclareCoverTemplate { m m }
  { \fdu_cover_declare_template:nn {#1} {#2} }
\cs_new_protected:Npn \fdu_cover_declare_template:nn #1#2
  {
    \tl_set:Nn \l__fdu_cover_template_tl {#1}
    \__fdu_cover_declare_template_interface:nx {#1}
      {
        format      : tokenlist,
        top-skip    : skip,
        bottom-skip : skip,
        \clist_map_function:nN {#2} \__fdu_cover_key_type:n
      }
    \tl_new:c   { l__fdu_cover / #1 / format_tl   }
    \skip_new:c { l__fdu_cover / #1 / top_skip    }
    \skip_new:c { l__fdu_cover / #1 / bottom_skip }
    \clist_map_inline:nn {#2}
      {
        \tl_new:c   { l__fdu_cover / #1 / ##1 / content_tl  }
        \tl_new:c   { l__fdu_cover / #1 / ##1 / format_tl   }
        \skip_new:c { l__fdu_cover / #1 / ##1 / bottom_skip }
      }
    \__fdu_cover_declare_template_code:nxn {#1}
      {
        format      = \exp_not:c { l__fdu_cover / #1 / format_tl   },
        top-skip    = \use:c     { l__fdu_cover / #1 / top_skip    },
        bottom-skip = \use:c     { l__fdu_cover / #1 / bottom_skip },
        \clist_map_function:nN {#2} \__fdu_cover_key_binding:n
      }
      {
        \AssignTemplateKeys
        \tl_use:c       { l__fdu_cover / #1 / format_tl }
        \__fdu_vspace:c { l__fdu_cover / #1 / top_skip  }
        \clist_map_inline:nn {#2}
          {
            \use:c { __fdu_cover / #1 / ####1 / align:n }
              {
                \tl_use:c { l__fdu_cover / #1 / ####1 / format_tl  }
                \tl_use:c { l__fdu_cover / #1 / ####1 / content_tl }
                \par
              }
            \__fdu_vspace:c { l__fdu_cover / #1 / ####1 / bottom_skip }
          }
        \__fdu_vspace:c { l__fdu_cover / #1 / bottom_skip }
      }
  }
\tl_new:N \l__fdu_cover_template_tl
\cs_new_protected:Npn \__fdu_cover_declare_template_interface:nn #1#2
  { \DeclareTemplateInterface { fdu / cover } {#1} { \c_zero } {#2} }
\cs_new_protected:Npn \__fdu_cover_declare_template_code:nnn #1#2#3
  { \DeclareTemplateCode { fdu / cover } {#1} { \c_zero } {#2} {#3} }
\cs_generate_variant:Nn \__fdu_cover_declare_template_interface:nn { nx  }
\cs_generate_variant:Nn \__fdu_cover_declare_template_code:nnn     { nxn }
\cs_new:Npn \__fdu_cover_key_type:n #1
  {
    #1 / content     : tokenlist,
    #1 / format      : tokenlist,
    #1 / bottom-skip : skip,
    #1 / align       : choice { left, right, center, normal } = normal,
  }
\cs_new:Npn \__fdu_cover_key_binding:n #1
  {
    #1 / content     =
      \exp_not:c
        { l__fdu_cover / \l__fdu_cover_template_tl / #1 / content_tl  },
    #1 / format      =
      \exp_not:c
        { l__fdu_cover / \l__fdu_cover_template_tl / #1 / format_tl   },
    #1 / bottom-skip =
      \exp_not:c
        { l__fdu_cover / \l__fdu_cover_template_tl / #1 / bottom_skip },
    #1 / align       =
      {
        left   =
          \exp_not:N \cs_set_protected:cpn
            { __fdu_cover / \l__fdu_cover_template_tl / #1 / align:n }
            \exp_not:n {##1}
            {
              \exp_not:n
                {
                  \group_begin:
                    \flushleft ##1 \endflushleft
                  \group_end:
                }
            },
        right  =
          \exp_not:N \cs_set_protected:cpn
            { __fdu_cover / \l__fdu_cover_template_tl / #1 / align:n }
            \exp_not:n {##1}
            {
              \exp_not:n
                {
                  \group_begin:
                    \flushright ##1 \endflushright
                  \group_end:
                }
            },
        center =
          \exp_not:N \cs_set_protected:cpn
            { __fdu_cover / \l__fdu_cover_template_tl / #1 / align:n }
            \exp_not:n {##1}
            {
              \exp_not:n
                {
                  \group_begin:
                    \center ##1 \endcenter
                  \group_end:
                }
            },
        normal =
          \exp_not:N \cs_set_protected:cpn
            { __fdu_cover / \l__fdu_cover_template_tl / #1 / align:n }
            \exp_not:n {##1}
            { \exp_not:n { \group_begin: ##1 \group_end: } }
      },
  }
\NewDocumentCommand \makecoveri { }
  {
    \thispagestyle { empty }
    \UseInstance { fdu / cover } { cover-i-default }
  }
\NewDocumentCommand \makecoverii { }
  {
    \thispagestyle { empty }
    \UseInstance { fdu / cover } { cover-ii-default }
  }
\NewDocumentCommand \makecoveriii { }
  {
    \cleardoublepage
    \thispagestyle { empty }
    \UseInstance { fdu / cover } { cover-iii-default }
  }
\DeclareCoverTemplate { cover-i   }
  { id, logo, type, degree, title, title-en, info }
\DeclareCoverTemplate { cover-ii  } { title, name-list }
\DeclareCoverTemplate { cover-iii }
  {
    originality-decl-name,
    originality-decl-text,
    originality-decl-sig,
    authorization-decl-name,
    authorization-decl-text,
    authorization-decl-sig
  }
\DeclareInstance { fdu / cover } { cover-i-default } { cover-i }
  {
    bottom-skip            = 0 pt plus 1.5 fill,
    id       / content     = \__fdu_cover_id:,
    logo     / content     = \__fdu_cover_logo:,
    type     / content     = \__fdu_cover_type:,
    degree   / content     = \__fdu_cover_degree:,
    title    / content     =
      \__fdu_fixed_width_center_box:nn
        { 0.9 \textwidth } { \l__fdu_info_title_tl },
    title-en / content     =
      \__fdu_fixed_width_center_box:nn
        { 0.9 \textwidth } { \l__fdu_info_title_en_tl },
    info     / content     = \__fdu_cover_info:,
    id       / format      = \zihao { -5 },
    type     / format      = \zihao {  2 },
    degree   / format      = \zihao {  4 },
    title    / format      = \zihao { -2 } \sffamily,
    title-en / format      =
      \__fdu_line_spread:n { 1.2 } \zihao { 4 } \bfseries,
    id       / bottom-skip = 0 pt plus 1.6 fill,
    logo     / bottom-skip = 0 pt plus 0.3 fill,
    type     / bottom-skip = -18 pt,
    degree   / bottom-skip = 0 pt plus 0.8 fill,
    title-en / bottom-skip = 0 pt plus 2.5 fill,
    id       / align       = right,
    logo     / align       = center,
    type     / align       = center,
    degree   / align       = center,
    title    / align       = center,
    title-en / align       = center,
    info     / align       = center,
  }
\DeclareInstance { fdu / cover } { cover-ii-default } { cover-ii }
  {
    title     / content =
      \__fdu_spread_box:nn { 7 em } { \c__fdu_name_instructors_tl },
    name-list / content =
      \clist_use:Nn \l__fdu_info_instructors_clist { \par },
    title     / format  = \zihao { 2 } \sffamily,
    name-list / format  = \large,
    title     / align   = center,
    name-list / align   = center,
  }
\DeclareInstance { fdu / cover } { cover-iii-default } { cover-iii }
  {
    format                                =
      \__fdu_line_spread:n { 1.8 },
    top-skip                              = 0 pt plus 0.2 fill,
    bottom-skip                           = 0 pt plus 2.5 fill,
    originality-decl-name   / content     = \c__fdu_name_orig_decl_tl,
    originality-decl-text   / content     = \c__fdu_orig_decl_text_tl,
    originality-decl-sig    / content     =
      \__fdu_cover_signature:N \c__fdu_orig_decl_sign_clist,
    authorization-decl-name / content     = \c__fdu_name_auth_decl_tl,
    authorization-decl-text / content     = \c__fdu_auth_decl_text_tl,
    authorization-decl-sig  / content     =
      \__fdu_cover_signature:N \c__fdu_auth_decl_sign_clist,
    originality-decl-name   / format      =
      \__fdu_line_spread:n { 1.2 } \zihao { -2 } \sffamily,
    authorization-decl-name / format      =
      \__fdu_line_spread:n { 1.2 } \zihao { -2 } \sffamily,
    originality-decl-name   / bottom-skip = 0.4 cm,
    originality-decl-text   / bottom-skip = 0.4 cm,
    originality-decl-sig    / bottom-skip = 0 pt plus 2.5 fill,
    authorization-decl-name / bottom-skip = 0.4 cm,
    authorization-decl-text / bottom-skip = 0.4 cm,
    originality-decl-name   / align       = center,
    originality-decl-sig    / align       = right,
    authorization-decl-name / align       = center,
    authorization-decl-sig  / align       = right,
  }
\bool_new:N \l__fdu_auto_make_cover_bool
\keys_define:nn { fdu / style }
  {
    auto-make-cover .bool_set:N = \l__fdu_auto_make_cover_bool,
    auto-make-cover .default:n  = true
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
\tl_const:Nn \__fdu_chapter_toc_format:    { \normalfont \sffamily }
\tl_const:Nn \__fdu_chapter_toc_en_format: { \bfseries }
\keys_set:nn { ctex }
  {
    contentsname = \c__fdu_name_toc_tl,
    chapter / tocline =
      {
        \__fdu_chapter_toc_format:
        \CTEXnumberline {#1} #2
      },
    section / tocline =
      {
         \CTEXnumberline {#1} #2
      },
    subsection / tocline =
      {
        \fdu@kai
         \CTEXnumberline {#1} #2
      }
  }
\__fdu_patch_cmd:Nnn \tableofcontents
  {
    \chapter*{\contentsname
      \@mkboth{%
        \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
  }
  {
    \chapter* { \contentsname }
    \fdu_front_matter_header:n { \c__fdu_name_toc_tl }
  }
\NewDocumentEnvironment { abstract  } { }
  { \__fdu_abstract_begin:    } { \__fdu_abstract_end:      }
\NewDocumentEnvironment { abstract* } { }
  { \__fdu_abstract_en_begin: } { \__fdu_abstract_en_end:   }
\cs_new_protected:Npn \__fdu_abstract_begin:
  {
    \chapter* { \c__fdu_name_abstract_tl }
    \fdu_front_matter_header:n { \c__fdu_name_abstract_tl }
    \addcontentsline { toc } { chapter }
      {
        \__fdu_chapter_toc_format:
        \c__fdu_name_abstract_tl
      }
  }
\cs_new_protected:Npn \__fdu_abstract_en_begin:
  {
    \chapter* { \c__fdu_name_abstract_en_tl }
    \fdu_front_matter_header:n { \c__fdu_name_abstract_en_tl }
    \addcontentsline { toc } { chapter }
      {
        \__fdu_chapter_toc_format:
        \c__fdu_name_abstract_en_tl
      }
  }
\cs_new_protected:Npn \__fdu_abstract_end:
  {
    \__fdu_keywords_par:
    \textsf { \c__fdu_name_keywords_tl \c__fdu_fullwidth_colon_tl }
    \clist_use:Nn \l__fdu_info_keywords_clist
      { \c__fdu_fullwidth_semicolon_tl }
    \__fdu_clc_par:
    \textsf { \c__fdu_name_clc_tl \c__fdu_fullwidth_colon_tl }
    \l__fdu_info_clc_tl
  }
\cs_new_protected:Npn \__fdu_abstract_en_end:
  {
    \__fdu_keywords_par:
    \textbf { \c__fdu_name_keywords_en_tl } \__fdu_quad:
    \clist_use:Nn \l__fdu_info_keywords_en_clist { \__fdu_quad: }
    \__fdu_clc_par:
    \textbf { \c__fdu_name_clc_en_tl } \__fdu_quad:
    \l__fdu_info_clc_tl
  }
\cs_new:Npn \__fdu_keywords_par:
  {
    \par \mode_leave_vertical: \par
    \noindent \hangindent = 4 em  \hangafter = 1
  }
\cs_new:Npn \__fdu_clc_par:
  { \par \noindent }
\NewDocumentEnvironment { notation } { O { l p { 7.5 cm } } }
  {
    \__fdu_notation_begin:
    \group_begin:
      \__fdu_notation_long_table_setup:
      \longtable {#1}
  }
  {
      \endlongtable
    \group_end:
  }
\cs_new_protected:Npn \__fdu_notation_begin:
  {
    \chapter* { \c__fdu_name_notation_tl }
    \fdu_front_matter_header:n { \c__fdu_name_notation_tl }
    \addcontentsline { toc } { chapter }
      {
        \__fdu_chapter_toc_format:
        \c__fdu_name_notation_tl
      }
  }
\cs_new_protected:Npn \__fdu_notation_long_table_setup:
  {
      \dim_set_eq:NN \LTpre  \c_zero_dim
      \dim_set_eq:NN \LTpost \c_zero_dim
  }
\bool_new:N \l__fdu_bibtex_bool
\tl_new:N \l__fdu_bib_style_tl
\tl_new:N \l__fdu_bib_gb_style_tl
\tl_new:N \l__fdu_cite_style_tl
\tl_new:N \l__fdu_bib_resource_tl
\keys_define:nn { fdu / style }
  {
    bib-backend .choice:,
    bib-backend .value_required:n = true,
    bib-backend / bibtex   .code:n =
      { \bool_set_true:N  \l__fdu_bibtex_bool },
    bib-backend / biblatex .code:n =
      { \bool_set_false:N \l__fdu_bibtex_bool },
    bib-style .choice:,
    bib-style .value_required:n = true,
    bib-style / numerical    .code:n =
      {
        \tl_set:Nn  \l__fdu_bib_gb_style_tl { numerical  }
        \tl_clear:N \l__fdu_bib_style_tl
      },
    bib-style / author-year .code:n =
      {
        \tl_set:Nn  \l__fdu_bib_gb_style_tl { author-year }
        \tl_clear:N \l__fdu_bib_style_tl
      },
    bib-style / unknown     .code:n =
      { \tl_set_eq:NN \l__fdu_bib_style_tl \l_keys_value_tl },
    cite-style .code:n =
      {
        \bool_if:NTF \l__fdu_bibtex_bool
          { \__fdu_warning:n { cite-style-not-available } }
          { \tl_set:Nn \l__fdu_cite_style_tl {#1} }
      },
    bib-resource .tl_set:N = \l__fdu_bib_resource_tl
  }
\__fdu_msg_new:nn { cite-style-not-available }
  { Option~ "cite-style"~ is~ not~ available~ in~ BibTeX. }
\ctex_at_end_preamble:n
  {
    \bool_if:NTF \l__fdu_bibtex_bool
      {
        \RequirePackage [ sort & compress ] { natbib }
        \__fdu_bibtex_setup:
        \NewDocumentCommand \printbibliography { o }
          {
            \exp_args:NV \bibliography \l__fdu_bib_resource_tl
            \IfValueT {#1}
              { \__fdu_warning:nn { invalid-option-in-bibtex } {#1} }
          }
      }
      {
        \__fdu_biblatex_setup:
        \RequirePackage [ backend = biber, hyperref = manual, natbib ]
          { biblatex }
        \exp_args:NV \addbibresource \l__fdu_bib_resource_tl
        \__fdu_biblatex_allow_url_break:
      }
  }
\__fdu_msg_new:nn { invalid-option-in-bibtex }
  { Option(s)~ "#1"~ are~ invalid~ in~ BibTeX. }
\cs_new:Npn \__fdu_bibtex_setup:
  {
    \tl_if_empty:NTF \l__fdu_bib_style_tl
      {
        \tl_if_eq:VnTF \l__fdu_bib_gb_style_tl { numerical }
          {
            \bibliographystyle { gbt7714-unsrt }
            \__fdu_set_cite_style_numerical:
          }
          {
            \tl_if_eq:VnT \l__fdu_bib_gb_style_tl { author-year }
              {
                \bibliographystyle { gbt7714-plain }
                \__fdu_set_cite_style_author_year:
                \cs_set_eq:NN \cite \citep
              }
          }
      }
      { \exp_args:NV \bibliographystyle \l__fdu_bib_style_tl }
  }
\cs_new:Npn \__fdu_biblatex_setup:
  {
    \tl_if_empty:NTF \l__fdu_bib_style_tl
      {
        \tl_if_eq:VnTF \l__fdu_bib_gb_style_tl { numerical }
          { \PassOptionsToPackage { style = gb7714-2015 } }
          {
            \tl_if_eq:VnT \l__fdu_bib_gb_style_tl { author-year }
              { \PassOptionsToPackage { style = gb7714-2015ay } }
          }
      }
      { \PassOptionsToPackage { style = \l__fdu_bib_style_tl } }
    { biblatex }
    \tl_if_empty:NF \l__fdu_cite_style_tl
      {
        \PassOptionsToPackage { citestyle = \l__fdu_bib_style_tl }
          { biblatex }
      }
  }
\cs_new:Npn \__fdu_biblatex_allow_url_break:
  {
    \int_set_eq:NN \c@biburlucpenalty  \c_one
    \int_set_eq:NN \c@biburlnumpenalty \c_one
    \int_set_eq:NN \c@biburllcpenalty  \c_one
  }
\cs_new:Npn \__fdu_set_cite_style_numerical:
  {
    \NAT@numberstrue \NAT@supertrue
    \cs_set:Npn \NAT@open  { [  }
    \cs_set:Npn \NAT@close { ]  }
    \cs_set:Npn \NAT@sep   { ,~ }
  }
\cs_new:Npn \__fdu_set_cite_style_author_year:
  {
    \NAT@numbersfalse
    \cs_set_eq:NN \NAT@open  \c__fdu_fullwidth_left_paren_tl
    \cs_set_eq:NN \NAT@close \c__fdu_fullwidth_right_paren_tl
    \cs_set_eq:NN \NAT@sep   \c__fdu_fullwidth_semicolon_tl
    \cs_set_eq:NN \NAT@aysep \c__fdu_fullwidth_comma_tl
    \cs_set_eq:NN \NAT@yrsep \c__fdu_ideographic_comma_tl
  }
\cs_set:Npn \bibsection
  {
    \chapter* { \bibname }
    \fdu_front_matter_header:n { \bibname }
    \addcontentsline { toc } { chapter }
      { \__fdu_chapter_toc_format: \bibname }
  }
\NewDocumentCommand \hypersetup { m }
  { \fdu_hyperref_setup:n {#1} }
\cs_new_protected:Npn \fdu_hyperref_setup:n #1
  { \clist_gput_right:Nn \g__fdu_to_hyperref_clist {#1} }
\cs_new:Npn \__fdu_set_hyperlink_color_key:n #1
  {
    hyperlink-color / \clist_item:nn {#1} {1} .code:n =
      {
        \__fdu_define_hyperlink_color:nnn
          { \clist_item:nn {#1} {2} }
          { \clist_item:nn {#1} {3} }
          { \clist_item:nn {#1} {4} }
        \fdu_hyperref_setup:n
          {
            linkcolor = fdu@link, linkbordercolor = fdu@link,
            urlcolor  = fdu@url,  urlbordercolor  = fdu@url,
            citecolor = fdu@cite, citebordercolor = fdu@cite
          }
      },
  }
\cs_new_protected:Npn \__fdu_define_hyperlink_color:nnn #1#2#3
  {
    \definecolorset { HTML } { fdu@ } { }
      { link, #1; url, #2; cite, #3 }
  }
\keys_define:nx { fdu / style }
  {
    hyperlink .choice:,
    hyperlink .value_required:n = true,
    hyperlink / border .code:n = { },
    hyperlink / color  .code:n =
      { \fdu_hyperref_setup:n { colorlinks = true } },
    hyperlink / none   .code:n =
      { \fdu_hyperref_setup:n { hidelinks  = true } },
    hyperlink-color .choice:,
    hyperlink-color .value_required:n = true,
    \clist_map_function:nN
      {
        { autumn,    D70000, D75F00, AF8700 },
        { business,  D14542, 295497, 1F6E43 },
        { classic,   FF0000, 0000FF, 00FF00 },
        { default,   990000, 0000B2, 007F00 },
        { elegant,   961212, C31818, 9B764F },
        { fantasy,   FF4A19, FF3F94, 934BA1 },
        { material,  E91E63, 009688, 4CAF50 },
        { science,   CA0619, 389F9D, FF8920 },
        { summer,    00AFAF, 5F5FAF, 5F8700 },
        { graylevel, 616161, 616161, 616161 },
        { prl,       2D3092, 2D3092, 2D3092 }
      }
      \__fdu_set_hyperlink_color_key:n
  }
\cs_new:Npn \fdu_allow_url_break:
  {
    \cs_new:Npn \__fdu_add_url_break_points:
      { \tl_map_function:NN \c__fdu_url_break_points_tl \do }
    \__fdu_appto_cmd:Nn \UrlBreaks
      { \UrlOrds \__fdu_add_url_break_points: }
  }
\tl_const:Nn \c__fdu_url_break_points_tl
  {
    abcdefghijklmnopqrstuvwxyz
    ABCDEFGHIJKLMNOPQRSTUVWXYZ
    0123456789
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
        pdfcreator  = \c__fdu_name_pdf_creator_tl
      }
    \exp_args:NV \hypersetup \g__fdu_to_hyperref_clist
    \fdu_allow_url_break:
    \bool_if:NF \l__fdu_bibtex_bool { \BiblatexManualHyperrefOn }
  }
\ctex_at_end_package:nn { hyperref }
  {
    \pdfstringdefDisableCommands
      {
        \cs_set_eq:NN \fdu@kai \prg_do_nothing:
        \cs_set_eq:NN \quad    \c_space_tl
        \cs_set_eq:NN \qquad   \c_space_tl
      }
  }
\keys_define:nn { fdu }
  {
    info  .meta:nn = { fdu / info  } {#1},
    style .meta:nn = { fdu / style } {#1}
  }
\keys_set:nn { fdu }
  {
%%    style   / font            = times,
%%    style   / cjk-font        = fandol,
    style   / font-size       = -4,
    style   / fullwidth-stop  = false,
    style   / auto-make-cover = true,
    style   / logo            = { fudan-name.pdf },
    style   / logo-size       = { 0.5 \textwidth },
    style   / hyperlink       = color,
    style   / hyperlink-color = default,
    style   / bib-style       = numerical,
    info    / degree          = academic,
    info    / secret-level    = none,
    info    / school-id       = { 10246 },
    info    / date            = { \zhtoday },
    theorem / header-font     = { \sffamily },
    theorem / body-font       = { \fdu@kai },
    theorem / counter         = { chapter }
  }
\NewDocumentCommand \fdusetup { m }
  { \keys_set:nn { fdu } {#1} }
\newtheorem* { proof       } { \c__fdu_name_proof_tl      }
\newtheorem  { axiom       } { \c__fdu_name_axiom_tl      }
\newtheorem  { corollary   } { \c__fdu_name_corollary_tl  }
\newtheorem  { definition  } { \c__fdu_name_definition_tl }
\newtheorem  { example     } { \c__fdu_name_example_tl    }
\newtheorem  { lemma       } { \c__fdu_name_lemma_tl      }
\newtheorem  { theorem     } { \c__fdu_name_theorem_tl    }
\endinput
%%
%% End of file `fduthesis.cls'.
