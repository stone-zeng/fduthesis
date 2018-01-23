#!/usr/bin/env sh

# Install `fduthesis`
cd source
xetex fduthesis.dtx
cp fduthesis.cls       ../test/
cp fduthesis-en.cls    ../test/
cp fduthesis.def       ../test/
cp fduthesis-user.def  ../test/

mkdir                  ../logo/
cp fdulogo.sty         ../logo/
cp fdulogo-example.tex ../logo/
cp fduthesis-cover.tex ../logo/

# Make logos
cd ../logo/
pdflatex -interaction=nonstopmode -shell-escape fdulogo-example
pdflatex -interaction=nonstopmode               fduthesis-cover

mkdir          pdf/
mv fudan-*.pdf pdf/

cd ../test/

# Make test theses
latexmk -xelatex  -f test
latexmk -xelatex  -f test-en
source ../scripts/clean.sh
latexmk -lualatex -f test
latexmk -lualatex -f test-en
source ../scripts/clean.sh

latexmk -xelatex  -f test-biblatex
