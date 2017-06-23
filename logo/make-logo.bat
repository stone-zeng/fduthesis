@echo off

xelatex  fudan-emblem
xelatex  fudan-motto
xelatex  fudan-name

del *.aux
del *.log
del *.synctex.gz
del *.synctex(busy)
