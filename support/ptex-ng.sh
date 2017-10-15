#!/usr/bin/env sh

# Install pTeX-ng
wget https://texlive.texjp.org/tltexjp-key.asc
tlmgr key add tltexjp-key.asc
tlmgr repository add http://texlive.texjp.org/current/tltexjp tltexjp
tlmgr pinning add tltexjp '*'
tlmgr install ptex-ng
tlmgr path add

# Install newest version of pTeX-ng (from GitHub)
git clone https://github.com/clerkma/ptex-ng.git
cd ptex-ng
./build-aptex.sh
cd /home/travis/.travis/build/Stone-Zeng/fduthesis
cp ./ptex-ng/aptex /tmp/texlive/bin/x86_64-linux

# For Windows
# wget http://www.ring.gr.jp/archives/text/TeX/ptex-win32/current/ptex-ng-w32.tar.xz
# tar -xJf ptex-ng-w32.tar.xz

# Generate format files
fmtutil-sys --byengine=aptex
