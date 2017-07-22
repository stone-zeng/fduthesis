#!/usr/bin/env sh

# Install `zhlipsum`
git clone https://github.com/Stone-Zeng/zhlipsum.git

mkdir -p /home/travis/texmf/tex/latex/zhlipsum
cp zhlipsum/zhlipsum.sty        \
  /home/travis/texmf/tex/latex/zhlipsum
cp zhlipsum/zhlipsum-zh-cn.def  \
  /home/travis/texmf/tex/latex/zhlipsum

mktexlsr

# Install fonts
cp -r /tmp/texlive/texmf-dist/fonts/opentype                 \
  /home/travis/.fonts
cp /tmp/texlive/texmf-var/fonts/conf/texlive-fontconfig.conf \
  /home/travis/.fonts.conf
fc-cache -fv
