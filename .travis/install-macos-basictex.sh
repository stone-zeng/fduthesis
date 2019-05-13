#!/usr/bin/env sh

export PATH=/Library/TeX/texbin:$PATH

# Change default package repository
sudo tlmgr option repository https://mirrors.rit.edu/CTAN/systems/texlive/tlnet

# Keep no backups (not required, simply makes cache bigger)
sudo tlmgr option -- autobackup 0

# Update the TL install but add nothing new
sudo tlmgr update --self --all --no-auto-install

# Packages
sudo tlmgr install      \
  adobemapping          \
  amsfonts              \
  arphic-ttf            \
  babel-japanese        \
  baekmuk               \
  biber                 \
  biblatex              \
  biblatex-gb7714-2015  \
  ctablestack           \
  ctex                  \
  currfile              \
  environ               \
  fandol                \
  footmisc              \
  gbt7714               \
  ipaex                 \
  japanese-otf          \
  kantlipsum            \
  l3build               \
  latexmk               \
  libertinus-fonts      \
  lm-math               \
  logreq                \
  lualatex-math         \
  luatex85              \
  luatexja              \
  ntheorem              \
  platex                \
  platex-tools          \
  preview               \
  ptex                  \
  ptex-base             \
  ptex-fontmaps         \
  ptex-fonts            \
  siunitx               \
  standalone            \
  symbol                \
  tex-gyre              \
  tex-gyre-math         \
  trimspaces            \
  uplatex               \
  uptex                 \
  uptex-base            \
  uptex-fonts           \
  varwidth              \
  xits                  \
  xstring               \
  zhlipsum              \
  zhmetrics-uptex       \
  zhnumber
