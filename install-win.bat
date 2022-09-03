@ECHO OFF

MKDIR "thesis"
CD    "thesis"

COPY /Y "..\docs\main.tex"                          .
COPY /Y "..\docs\main.bib"                          .
COPY /Y "..\docs\example-image.png"                 .
COPY /Y "..\source\fduthesis.dtx"                   .
COPY /Y "..\source\fduthesis-doc.dtx"               .
COPY /Y "..\source\fduthesis-logo.dtx"              .
COPY /Y "..\testfiles\support\fudan-emblem.pdf"     .
COPY /Y "..\testfiles\support\fudan-emblem-new.pdf" .
COPY /Y "..\testfiles\support\fudan-name.pdf"       .

xetex "fduthesis.dtx" > NUL

DEL "*.dtx"
DEL "*.ins"
DEL "*.log"
DEL "*.md"

DEL "fdudoc.cls"
DEL "fdulogo-example.tex"
DEL "fduthesis-cover.tex"

CD ..
