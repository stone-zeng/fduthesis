@echo off
xetex fduthesis.ins
move /Y "fduthesis.cls"  "..\test\fduthesis.cls"
move /Y "fduthesis.def"  "..\test\fduthesis.def"
