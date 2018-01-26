#!/usr/bin/env sh

export TESTFILES="01-internal 02-basic 03-logo"

texlua build.lua save --engine xetex  $TESTFILES
texlua build.lua save --engine luatex $TESTFILES
texlua build.lua save 03-logo

texlua build.lua check
texlua build.lua check -f -e pdftex 03-logo
