#!/usr/bin/env sh

# From latex3
# https://github.com/latex3/latex3/blob/master/support/texlive.profile

# This script is used for testing using Travis
# It is intended to work on their VM set up: Ubuntu 12.04 LTS
# A minimal current TL is installed adding only the packages that are
# required

# See if there is a cached version of TL available
export PATH=/tmp/texlive/bin/x86_64-linux:$PATH
if ! command -v texlua > /dev/null; then
  # Obtain TeX Live
  wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
  tar -xzf install-tl-unx.tar.gz
  cd install-tl-20*

  # Install a minimal system
  ./install-tl --profile=../support/texlive.profile

  cd ..
fi

# TeX Base
tlmgr install         \
  tex                 \
  etex                \
  knuth-lib           \
  latex-bin           \
  tex-ini-files       \
  cm

# LaTeX3 packages
tlmgr install         \
  l3kernel            \
  l3experimental      \
  l3packages          \
  l3build

# XeTeX
tlmgr install         \
  xetex               \
  ifxetex             \
  unicode-data        \
  xecjk

# LuaTeX
tlmgr install         \
  luatex              \
  ifluatex            \
  lualatex-math       \
  lualibs             \
  luaotfload          \
  luatexbase          \
  luatexja

# Fonts
tlmgr install         \
  fontspec            \
  adobemapping        \
  amsfonts            \
  fandol              \
  libertinus          \
  lm                  \
  lm-math             \
  metafont            \
  mfware              \
  psnfss              \
  tex-gyre            \
  xits

# Math
tlmgr install         \
  amsmath             \
  unicode-math

# Other
tlmgr install         \
  ctex                \
  environ             \
  etoolbox            \
  fancyhdr            \
  filehook            \
  footmisc            \
  geometry            \
  graphics            \
  graphics-cfg        \
  graphics-def        \
  graphicx            \
  hyperref            \
  longtable           \
  ntheorem            \
  ms                  \
  oberdiek            \
  pgf                 \
  siunitx             \
  tools               \
  ulem                \
  xcolor              \
  xunicode            \
  zhnumber

# Keep no backups (not required, simply makes cache bigger)
tlmgr option -- autobackup 0

# Update the TL install but add nothing new
tlmgr update --self --all --no-auto-install
