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

function modified_check(names)
  local errorlevel = 0
  if testfiledir ~= "" and direxists(testfiledir) then
    if not options["rerun"] then
      checkinit()
    end
    local hide = true
    --[[
    -- To suppress TeX output.
    if names and next(names) then
      hide = false
    end
    ]]--
    names = names or { }
    -- No names passed: find all test files
    if not next(names) then
      for _,i in pairs(filelist(testfiledir, "*" .. lvtext)) do
        insert(names, jobname(i))
      end
      for _,i in ipairs(filelist(unpackdir, "*" .. lvtext)) do
        if fileexists(testfiledir .. "/" .. i) then
          print("Duplicate test file: " .. i)
          return 1
        else
          insert(names, jobname(i))
        end
      end
      sort(names)
      -- Deal limiting range of names
      if options["first"] then
        local allnames = names
        local active = false
        local firstname = options["first"]
        names = { }
        for _,name in ipairs(allnames) do
          if name == firstname then
            active = true
          end
          if active then
            insert(names,name)
          end
        end
      end
      if options["last"] then
        local allnames = names
        local lastname = options["last"]
        names = { }
        for _,name in ipairs(allnames) do
          insert(names,name)
          if name == lastname then
            break
          end
        end
      end
    end
    -- https://stackoverflow.com/a/32167188
    local function shuffle(tbl)
      local len, random = #tbl, rnd
      for i = len, 2, -1 do
          local j = random(1, i)
          tbl[i], tbl[j] = tbl[j], tbl[i]
      end
      return tbl
    end
    if options["shuffle"] then
      names = shuffle(names)
    end
    -- Actually run the tests
    print("Running checks on")
    local i = 0
    for _,name in ipairs(names) do
      i = i + 1
      print("  " .. name .. " (" ..  i.. "/" .. #names ..")")
      local errlevel = runcheck(name, hide)
      -- Return value must be 1 not errlevel
      if errlevel ~= 0 then
        if options["halt-on-error"] then
          return 1
        else
          errorlevel = 1
          -- visually show that something has failed
          print("          --> failed\n")
        end
      end
    end
    if errorlevel ~= 0 then
      checkdiff()
    else
      print("\n  All checks passed\n")
    end
  end
  return errorlevel
end

function main(target, names)
  check = modified_check
  stdmain(target, names)
end

kpse.set_program_name("kpsewhich")
dofile(kpse.lookup("l3build.lua"))
