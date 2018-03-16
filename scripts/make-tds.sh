#!/usr/bin/env sh

mkdir -p TDS/doc/latex/fduthesis/
mkdir -p TDS/tex/latex/fduthesis/
mkdir -p TDS/source/latex/fduthesis/
mkdir -p TDS/temp/

cp source/*.dtx TDS/temp/

cd TDS/temp/
xetex -interaction=batchmode -halt-on-error "fduthesis.dtx"
texlua ../../scripts/get-doc-en.lua "fduthesis.dtx" "fduthesis-en.tex"
cd ../..

mv TDS/temp/*.dtx             TDS/source/latex/fduthesis/
mv TDS/temp/*.ins             TDS/source/latex/fduthesis/
mv TDS/temp/*.cls             TDS/tex/latex/fduthesis/
mv TDS/temp/*.sty             TDS/tex/latex/fduthesis/
mv TDS/temp/*.def             TDS/tex/latex/fduthesis/
mv TDS/temp/*.tex             TDS/doc/latex/fduthesis/
mv TDS/temp/README.md         TDS/doc/latex/fduthesis/
mv TDS/temp/latexmkrc.cfg     TDS/doc/latex/fduthesis/latexmkrc
mv TDS/temp/latexmkrc-en.cfg  TDS/doc/latex/fduthesis/latexmkrc-en
cp source/*.pdf               TDS/doc/latex/fduthesis/
cp doc/fduthesis-template.tex TDS/doc/latex/fduthesis/

cd TDS/
rm -r temp/

zip -r fduthesis.tds.zip .
cd ..
mv -f TDS/*.zip .

rm -r TDS/
