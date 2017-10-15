#!/usr/bin/env sh

# Install pTeX-ng
wget https://texlive.texjp.org/tltexjp-key.asc
tlmgr key add tltexjp-key.asc
tlmgr repository add http://texlive.texjp.org/current/tltexjp tltexjp
tlmgr pinning add tltexjp '*'
tlmgr install ptex-ng
tlmgr path add

rm --verbose /tmp/texlive/bin/x86_64-linux/ptex-ng
rm --verbose /tmp/texlive/bin/x86_64-linux/platex-ng

# Build the newest version of pTeX-ng
git clone https://github.com/clerkma/ptex-ng.git
cd ptex-ng
./build-aptex.sh
cd ..

# For Windows
# wget http://www.ring.gr.jp/archives/text/TeX/ptex-win32/current/ptex-ng-w32.tar.xz
# tar -xJf ptex-ng-w32.tar.xz

# Generate format files
cp --verbose ptex-ng/src/ptex-ng /tmp/texlive/bin/x86_64-linux
fmtutil-sys --byengine=ptex-ng
