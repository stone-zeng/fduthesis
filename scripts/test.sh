#!/usr/bin/env sh

export TESTFILES=\
"
01-internal
02-basic
03-basic-en
04-cover
05-declaration
06-logo
"

texlua build.lua save --engine xetex  $TESTFILES
texlua build.lua save --engine luatex $TESTFILES
texlua build.lua save "06-logo"

# texlua build.lua check --halt-on-error
# texlua build.lua check --halt-on-error --quiet --force --engine pdftex "06-logo"
