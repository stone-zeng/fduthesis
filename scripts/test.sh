#!/usr/bin/env sh

TESTFILES=\
"
01-internal
02-basic
03-basic-en
04-cover
05-declaration
06-logo
"

l3build save -e xetex  $TESTFILES
l3build save -e luatex $TESTFILES
