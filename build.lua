-- Build script for fduthesis.

module = "fduthesis"

checkengines = {"xetex", "luatex"}
stdengine    = "xetex"
checkopts    = "-interaction=batchmode"

sourcefiles  = {"source/*.dtx"}
installfiles = {"*.cls", "*.sty", "*.def"}

-- typesetdeps = {"source/latexmkrc."}
typesetexe   = "xelatex"
typesetfiles = {"fduthesis.dtx"}

unpackfiles = {"fduthesis.dtx"}
unpackexe   = "xetex"
