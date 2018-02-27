#!/usr/bin/env texlua

-- Build script for fduthesis.

module = "fduthesis"

checkengines = {"xetex", "luatex"}
checkopts    = "-interaction=batchmode"

sourcefiles  = {"source/*.dtx"}
installfiles = {"*.cls", "*.sty", "*.def"}

-- typesetdeps = {"source/latexmkrc."}
typesetexe   = "xelatex"
typesetfiles = {"fduthesis.dtx"}

unpackfiles = {"fduthesis.dtx"}
unpackexe   = "xetex"
-- excludefiles = {"*/breqn -abbr-test.pdf",
-- "*/eqbreaks.pdf"}
-- unpackopts = "-interaction=batchmode"

-- cmdchkfiles = {"*.dtx"}

kpse.set_program_name("kpsewhich")
dofile(kpse.lookup("l3build.lua"))
