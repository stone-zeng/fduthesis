@echo off

mkdir "thesis"
cd    "thesis"

copy /Y "..\doc\fduthesis-template.tex"       .
copy /Y "..\source\fduthesis.dtx"             .
copy /Y "..\source\fduthesis-doc.dtx"         .
copy /Y "..\source\fduthesis-logo.dtx"        .
copy /Y "..\logo\pdf\fudan-emblem-a-black.pdf"     ".\fudan-emblem.pdf"
copy /Y "..\logo\pdf\fudan-emblem-new-a-black.pdf" ".\fudan-emblem-new.pdf"
copy /Y "..\logo\pdf\fudan-name-black.pdf"         ".\fudan-name.pdf"

xetex "fduthesis.dtx" > NUL

del "*.cfg"
del "*.dtx"
del "*.ins"
del "*.log"
del "*.md"

del "fdudoc.cls"
del "fdulogo-example.tex"
del "fduthesis-cover.tex"

cd ..
