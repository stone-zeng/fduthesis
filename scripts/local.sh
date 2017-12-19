#!/usr/bin/env sh

# Install fonts
# See https://tex.stackexchange.com/q/257231/136923 and
# https://www.tug.org/texlive/doc/texlive-en/texlive-en.html#x1-340003.4.4
cp -r /tmp/texlive/texmf-dist/fonts/opentype                 \
  /home/travis/.fonts
cp /tmp/texlive/texmf-var/fonts/conf/texlive-fontconfig.conf \
  /home/travis/.fonts.conf
fc-cache -fv
