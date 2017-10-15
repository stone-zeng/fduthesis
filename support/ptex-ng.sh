#!/usr/bin/env sh

# Install pTeX-ng
wget https://texlive.texjp.org/tltexjp-key.asc
tlmgr key add tltexjp-key.asc
tlmgr repository add http://texlive.texjp.org/current/tltexjp tltexjp
tlmgr pinning add tltexjp '*'
tlmgr install ptex-ng
tlmgr path add

# Install newest version of pTeX-ng (from GitHub)
if ! command -v aptex > /dev/null; then
  echo "I have found aptex!"
else
  echo "I haven't found aptex!"
fi

if ! command -v ptex-ng > /dev/null; then
  echo "I have found ptex-ng!"
else
  echo "I haven't found ptex-ng!"
fi

git clone https://github.com/clerkma/ptex-ng.git
cd ptex-ng
./build-aptex.sh

pwd
ls -al
cd src
pwd
ls -al

cd /home/travis/build/Stone-Zeng/fduthesis
cp ptex-ng/src/ptex-ng /tmp/texlive/bin/x86_64-linux

cd /tmp/texlive/bin/x86_64-linux
ls -al
cd /home/travis/build/Stone-Zeng/fduthesis

# For Windows
# wget http://www.ring.gr.jp/archives/text/TeX/ptex-win32/current/ptex-ng-w32.tar.xz
# tar -xJf ptex-ng-w32.tar.xz

# Generate format files
fmtutil-sys --byengine=ptex-ng
