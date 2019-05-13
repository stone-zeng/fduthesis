#!/usr/bin/env texlua

-- Generate the documentation with implementation.

local input_file_name  = arg[1]
local output_file_name = arg[2]

local code_doc_str = "%<!--CODEDOC-->"
local code_doc_len = string.len(code_doc_str)

input_file  = io.open(input_file_name,  "r")
output_file = io.open(output_file_name, "w")

for line in input_file:lines() do
    if string.sub(line, 1, code_doc_len) == code_doc_str then
        output_file:write(string.sub(line, code_doc_len + 1), "\n")
    else
        output_file:write(line, "\n")
    end
end

input_file:close()
output_file:close()
