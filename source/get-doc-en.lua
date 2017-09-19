local input_file_name  = "fduthesis.dtx"
local output_file_name = "fduthesis-en.tex"

local label_str = "%^^A!"
local label_str_len = string.len(label_str)
local space_str = " "
local lf_str    = "\n"

input_file  = io.open(input_file_name,  "r")
output_file = io.open(output_file_name, "w")

for line in input_file:lines() do
    if string.sub(line, 1, label_str_len) == label_str then
        new_line = space_str .. string.sub(line, label_str_len + 1)
            .. lf_str
        -- 空行中的空格会被移除。
        -- 缩进不处理，是为了确保 `latexexample`、`shellexample`
        -- 等代码段缩进正常。
        if new_line == space_str .. lf_str then
            new_line = lf_str
        end
        output_file:write(new_line)
    end
end

input_file:close()
output_file:close()
