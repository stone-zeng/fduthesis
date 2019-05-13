#!/usr/bin/env sh

cd source

xetex -interaction=batchmode fduthesis.dtx
cp fduthesis.cls    ../test
cp fduthesis-en.cls ../test
cp fduthesis.def    ../test

cd ..
