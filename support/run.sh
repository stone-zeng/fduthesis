#!/usr/bin/env sh

# Install `fduthesis`
cd source
xetex fduthesis.dtx
cp fduthesis.cls      ../test/fduthesis.cls
cp fduthesis-en.cls   ../test/fduthesis-en.cls
cp fduthesis.def      ../test/fduthesis.def
cp fduthesis-user.def ../test/fduthesis-user.def

# Make logo
# cd ../logo
# pdflatex -interaction=nonstopmode fudan-emblem
# pdflatex -interaction=nonstopmode fudan-motto
# pdflatex -interaction=nonstopmode fudan-name
# xelatex  -interaction=nonstopmode fudan-emblem
# xelatex  -interaction=nonstopmode fudan-motto
# xelatex  -interaction=nonstopmode fudan-name
# lualatex -interaction=nonstopmode fudan-emblem
# lualatex -interaction=nonstopmode fudan-motto
# lualatex -interaction=nonstopmode fudan-name

# Make test theses
cd ../test
xelatex  -interaction=nonstopmode test
cat test.log
# lualatex -interaction=nonstopmode test
# xelatex  -interaction=nonstopmode test-en
# lualatex -interaction=nonstopmode test-en
