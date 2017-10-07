#!/usr/bin/env sh

# From latex3
# https://github.com/latex3/latex3/blob/master/support/texlive.sh

# This script is used for testing using Travis
# It is intended to work on their VM set up: Ubuntu 12.04 LTS
# A minimal current TL is installed adding only the packages that are
# required

# See if there is a cached version of TL available
export PATH=/tmp/texlive/bin/x86_64-linux:$PATH
if ! command -v texlua > /dev/null; then
  # Obtain TeX Live
  wget https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/tlnet/install-tl-unx.tar.gz
  tar -xzf install-tl-unx.tar.gz
  cd install-tl-20*

  # Install a minimal system
  ./install-tl                                \
    --profile     ../support/texlive.profile  \
    --repository  https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/tlnet
  cd ..
fi

# Change default package repository
tlmgr option repository https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/tlnet

# Basic packages
tlmgr install         \
  adobemapping        \
  amsfonts            \
  amsmath             \
  caption             \
  cm                  \
  ctablestack         \
  ctex                \
  currfile            \
  environ             \
  etex                \
  etoolbox            \
  fancyhdr            \
  filehook            \
  fontspec            \
  footmisc            \
  geometry            \
  graphics            \
  graphics-cfg        \
  graphics-def        \
  hyperref            \
  ifluatex            \
  ifpdf               \
  ifxetex             \
  knuth-lib           \
  l3build             \
  l3experimental      \
  l3kernel            \
  l3packages          \
  latex-bin           \
  lualatex-math       \
  lualibs             \
  luaotfload          \
  luatex              \
  luatex85            \
  luatexbase          \
  luatexja            \
  metafont            \
  mfware              \
  ms                  \
  ntheorem            \
  oberdiek            \
  pgf                 \
  pifont              \
  preview             \
  psnfss              \
  siunitx             \
  standalone          \
  tex                 \
  tex-ini-files       \
  tools               \
  trimspaces          \
  ucharcat            \
  ulem                \
  unicode-data        \
  unicode-math        \
  url                 \
  varwidth            \
  xcolor              \
  xecjk               \
  xetex               \
  xkeyval             \
  xunicode            \
  zapfding            \
  zhnumber

# Recommended fonts (OpenType)
tlmgr install         \
  fandol              \
  libertine           \
  libertinus          \
  lm                  \
  lm-math             \
  tex-gyre            \
  tex-gyre-math       \
  xits

# For test
tlmgr install         \
  kantlipsum          \
  zhlipsum

# Keep no backups (not required, simply makes cache bigger)
tlmgr option -- autobackup 0

# Update the TL install but add nothing new
tlmgr update --self --all --no-auto-install
