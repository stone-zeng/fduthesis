#!/usr/bin/env sh

# Options
export TEXOPT="-interaction=batchmode -halt-on-error"
export LATEXMKOPT="-silent -f"

# Install `fduthesis`
cd source
xetex $TEXOPT "fduthesis.dtx"
cp fduthesis.cls       ../test/
cp fduthesis-en.cls    ../test/
cp fduthesis.def       ../test/

mkdir                  ../logo/
cp fdulogo.sty         ../logo/
cp fdulogo-example.tex ../logo/
cp fduthesis-cover.tex ../logo/

# Make logos
cd ../logo/
pdflatex $TEXOPT -shell-escape "fdulogo-example.tex"
pdflatex $TEXOPT               "fduthesis-cover.tex"

# mkdir                   pdf/
# mv fudan-*.pdf          pdf/
# cp fudan-name-black.pdf         ../testfiles/support/fudan-name.pdf
cp fudan-name-black.pdf         ../test/fudan-name.pdf
cp fudan-emblem-a-black.pdf     ../test/fudan-emblem.pdf
cp fudan-emblem-new-a-black.pdf ../test/fudan-emblem-new.pdf

cd ../test/

# Make test theses
latexmk -xelatex  $LATEXMKOPT "test.tex"
latexmk -xelatex  $LATEXMKOPT "test-en.tex"
source ../scripts/clean.sh

latexmk -lualatex $LATEXMKOPT "test.tex"
latexmk -lualatex $LATEXMKOPT "test-en.tex"
source ../scripts/clean.sh

latexmk -xelatex  $LATEXMKOPT "test-biblatex.tex"

cd ..
