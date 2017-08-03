#!/usr/bin/env sh

# Install `zhlipsum`
git clone https://github.com/Stone-Zeng/zhlipsum.git

cd zhlipsum/source
xetex zhlipsum.ins

cd ../..

mkdir -p /home/travis/texmf/tex/latex/zhlipsum
cp zhlipsum/source/zhlipsum.sty        \
  /home/travis/texmf/tex/latex/zhlipsum
cp zhlipsum/source/zhlipsum-zh-cn.def  \
  /home/travis/texmf/tex/latex/zhlipsum

mktexlsr

# Install fonts
# See https://tex.stackexchange.com/q/257231/136923 and
# https://www.tug.org/texlive/doc/texlive-en/texlive-en.html#x1-340003.4.4
cp -r /tmp/texlive/texmf-dist/fonts/opentype                 \
  /home/travis/.fonts
cp /tmp/texlive/texmf-var/fonts/conf/texlive-fontconfig.conf \
  /home/travis/.fonts.conf
fc-cache -fv
