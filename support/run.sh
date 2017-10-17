#!/usr/bin/env sh

# Install `fduthesis`
cd source
xetex fduthesis.dtx
# Now I'm directly modifying the .cls files.
# cp fduthesis.cls       ../test/fduthesis.cls
# cp fduthesis-en.cls    ../test/fduthesis-en.cls
cp fduthesis.def       ../test/fduthesis.def
cp fduthesis-user.def  ../test/fduthesis-user.def

mkdir ../logo
cp fdulogo.sty         ../logo/fdulogo.sty
cp fdulogo-example.tex ../logo/fdulogo-example.tex
cp fduthesis-cover.tex ../logo/fduthesis-cover.tex

# Make logo
cd ../logo
pdflatex -interaction=nonstopmode -shell-escape fdulogo-example
pdflatex -interaction=nonstopmode               fduthesis-cover
mkdir pdf
mv fudan-*.pdf pdf

# For pTeX-ng test
cp pdf/fudan-emblem-new-a-blue.pdf ../test/fudan-emblem-new-a-blue.pdf
cp pdf/fudan-emblem-new-b-red.pdf  ../test/fudan-emblem-new-b-red.pdf
cp pdf/fudan-name-black.pdf        ../test/fudan-name.pdf

# Make logo
# cd ../logo
# pdflatex -interaction=nonstopmode -shell-escape fdulogo-example
# pdflatex -interaction=nonstopmode               fduthesis-cover
# rm fudan-*.pdf

# xelatex  -interaction=nonstopmode fudan-emblem
# xelatex  -interaction=nonstopmode fudan-motto
# xelatex  -interaction=nonstopmode fudan-name
# lualatex -interaction=nonstopmode fudan-emblem
# lualatex -interaction=nonstopmode fudan-motto
# lualatex -interaction=nonstopmode fudan-name

# Make test theses
# The following commands will not give the errors correctly. So I
# put them into `.travis.yml`.
## cd ../test
## xelatex  -interaction=nonstopmode test
## lualatex -interaction=nonstopmode test
## xelatex  -interaction=nonstopmode test-en
## lualatex -interaction=nonstopmode test-en
