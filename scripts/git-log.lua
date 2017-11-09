#!/usr/bin/env texlua

-- Parse git log into JSON.

local input_file_name  = "git-log.log"
local output_file_name = "git-log.json"

local begin_tag = "BEGIN"

local pattern_file = "(%d+) file[s]? changed"
local pattern_ins  = "(%d+) insertion[s]?"
local pattern_del  = "(%d+) deletion[s]?"

local key_file = "  \"file-changed\": "
local key_ins  = "  \"insertions\": "
local key_del  = "  \"deletions\": "

local no_changed_str = key_file .. "0,\n"
  .. key_ins .. "0,\n" .. key_del .. "0\n"

function parse_changed(str)
  result = key_file .. string.match(str, pattern_file) .. ",\n"  
  ins_str = string.match(str, pattern_ins)
  del_str = string.match(str, pattern_del)
  if ins_str ~= nil then
    result = result .. key_ins .. ins_str .. ",\n"
  else
    result = result .. key_ins .. "0,\n"
  end
  if del_str ~= nil then
    result = result .. key_del .. del_str .. "\n"
  else
    result = result .. key_del .. "0\n"
  end
  return result
end

----------------------
-- Begin processing --
----------------------

input_file  = io.open(input_file_name,  "r")
output_file = io.open(output_file_name, "w")

local main_str = ""
local changed_flag = 0

for line in input_file:lines() do
  if changed_flag == 1 then
    if string.find(line, pattern_file) then
      main_str = main_str .. parse_changed(line) .. "},"
    else
      main_str = main_str .. no_changed_str .. "},\n"
    end
    if line == begin_tag then
      main_str = main_str .. "{" .. "\n"
    end
    changed_flag = 0
  else
    if line == begin_tag then
      main_str = main_str .. "{" .. "\n"
    else
      main_str = main_str .. line .. "\n"
      if string.find(line, "\"date\":") then
        changed_flag = 1
      end
    end
  end
end

output_file:write("[\n" .. string.sub(main_str, 1, -2) .. "\n]\n")

input_file:close()
output_file:close()
