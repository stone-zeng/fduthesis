#!/usr/bin/env sh

# This script is used for creating CTAN archive of fduthesis.

JOB_NAME=fduthesis
WORKING_DIR=$PWD

# Copy all the files to system temp folder, in order to use
# chmod correctly.
TEMP_DIR=/tmp/$JOB_NAME

TDS_DIR=$TEMP_DIR/TDS
CTAN_DIR=$TEMP_DIR/$JOB_NAME

SRC_DIR=$TDS_DIR/source/latex/$JOB_NAME
TEX_DIR=$TDS_DIR/tex/latex/$JOB_NAME
DOC_DIR=$TDS_DIR/doc/latex/$JOB_NAME

LOGO_DIR=$WORKING_DIR/logo/pdf
RELEASE_DIR=$WORKING_DIR/release
OVERLEAF_DIR=$RELEASE_DIR/overleaf
DOC_EN_SCRIPT=$WORKING_DIR/scripts/get-doc-en.lua

mkdir -p $TEMP_DIR

mkdir -p $TDS_DIR
mkdir -p $CTAN_DIR
mkdir -p $OVERLEAF_DIR

mkdir -p $SRC_DIR
mkdir -p $TEX_DIR
mkdir -p $DOC_DIR

cp $WORKING_DIR/source/*.dtx              $TEMP_DIR
cp $WORKING_DIR/source/*.pdf              $TEMP_DIR
cp $WORKING_DIR/docs/main.tex             $TEMP_DIR
cp $WORKING_DIR/docs/main.bib             $TEMP_DIR
cp $WORKING_DIR/docs/*.png                $TEMP_DIR
cp $LOGO_DIR/fudan-emblem-a-black.pdf     $TEMP_DIR/fudan-emblem.pdf
cp $LOGO_DIR/fudan-emblem-new-a-black.pdf $TEMP_DIR/fudan-emblem-new.pdf
cp $LOGO_DIR/fudan-name-black.pdf         $TEMP_DIR/fudan-name.pdf

cd $TEMP_DIR
xetex $JOB_NAME.dtx > /dev/null
texlua $DOC_EN_SCRIPT $JOB_NAME.dtx $JOB_NAME-en.tex

# All files should be rw-r--r--
chmod 644 $TEMP_DIR/*.*

cp $TEMP_DIR/*.dtx $SRC_DIR
cp $TEMP_DIR/*.ins $SRC_DIR

cp $TEMP_DIR/*.cls $TEX_DIR
cp $TEMP_DIR/*.def $TEX_DIR
cp $TEMP_DIR/*.sty $TEX_DIR

# These files should not be put in doc/
cp $TEMP_DIR/fudan-emblem.pdf     $TEX_DIR
cp $TEMP_DIR/fudan-emblem-new.pdf $TEX_DIR
cp $TEMP_DIR/fudan-name.pdf       $TEX_DIR

cp $TEMP_DIR/*.md                 $DOC_DIR
cp $TEMP_DIR/*.tex                $DOC_DIR
cp $TEMP_DIR/$JOB_NAME*.pdf       $DOC_DIR

rm $DOC_DIR/main.tex

# Overleaf
cp $JOB_NAME.cls                  $OVERLEAF_DIR
cp $JOB_NAME-en.cls               $OVERLEAF_DIR
cp $JOB_NAME.def                  $OVERLEAF_DIR
cp main.tex                       $OVERLEAF_DIR
cp main.bib                       $OVERLEAF_DIR
cp $TEMP_DIR/fudan-emblem.pdf     $OVERLEAF_DIR
cp $TEMP_DIR/fudan-emblem-new.pdf $OVERLEAF_DIR
cp $TEMP_DIR/fudan-name.pdf       $OVERLEAF_DIR
cp *.png                          $OVERLEAF_DIR

# Make TDS zip
cd $TDS_DIR
zip -qr9 $JOB_NAME.tds.zip .

cp $TEMP_DIR/*.dtx $CTAN_DIR
cp $TEMP_DIR/*.md  $CTAN_DIR
cp $TEMP_DIR/*.pdf $CTAN_DIR

rm $TEMP_DIR/*.*
cp $TDS_DIR/*.zip $TEMP_DIR
rm -r $TDS_DIR

# Make CTAN zip
cd $TEMP_DIR
zip -qr9 $JOB_NAME.zip .

# Make Overleaf zip
cd $OVERLEAF_DIR
zip -qr9 $JOB_NAME-overleaf.zip .

cd $WORKING_DIR
cp -f $TEMP_DIR/*.zip     $RELEASE_DIR
cp -f $OVERLEAF_DIR/*.zip $RELEASE_DIR

rm -r $TEMP_DIR
rm -r $OVERLEAF_DIR
