#!/usr/bin/env sh

mkdir -p "thesis"
cd "thesis"

cp -f "../docs/main.tex"                          .
cp -f "../docs/main.bib"                          .
cp -f "../docs/example-image.png"                 .
cp -f "../source/fduthesis.dtx"                   .
cp -f "../source/fduthesis-doc.dtx"               .
cp -f "../source/fduthesis-logo.dtx"              .
cp -f "../testfiles/support/fudan-emblem.pdf"     .
cp -f "../testfiles/support/fudan-emblem-new.pdf" .
cp -f "../testfiles/support/fudan-name.pdf"       .

xetex "fduthesis.dtx" > /dev/null

rm *.dtx
rm *.ins
rm *.log
rm *.md

rm "fdudoc.cls"
rm "fdulogo-example.tex"
rm "fduthesis-cover.tex"

cd ..
