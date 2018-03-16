#!/usr/bin/env sh

# Options
export TEXOPT="-interaction=batchmode -halt-on-error"

# Install `fduthesis`
cd source
xetex $TEXOPT "fduthesis.dtx"
# Now I'm directly modifying the .cls and .def files.
# cp fduthesis.cls       ../test/
# cp fduthesis-en.cls    ../test/
# cp fduthesis.def       ../test/

mkdir                  ../logo/
cp fdulogo.sty         ../logo/
cp fdulogo-example.tex ../logo/
cp fduthesis-cover.tex ../logo/

# Make logos
cd ../logo/
pdflatex $TEXOPT -shell-escape "fdulogo-example.tex"

mkdir          pdf/
mv fudan-*.pdf pdf/

cd ../test/
