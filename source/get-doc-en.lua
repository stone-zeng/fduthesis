local input_file_name  = "fduthesis.dtx"
local output_file_name = "fduthesis-en.tex"

local label_str = "%^^A!"
local label_str_len = string.len(label_str)

local latex_ex_str = "\\begin{latexexample}["
local shell_ex_str = "\\begin{shellexample}["
local syntax_str   = "  \\begin{fdusyntax}["

local latex_ex_str_len = string.len(latex_ex_str)
local shell_ex_str_len = string.len(shell_ex_str)
local syntax_str_len   = string.len(syntax_str)

input_file  = io.open(input_file_name,  "r")
output_file = io.open(output_file_name, "w")

local function add_lst_gobble(str)
    if string.sub(str, 1, latex_ex_str_len) == latex_ex_str then
        return latex_ex_str .. "gobble=1," ..
            string.sub(str, latex_ex_str_len + 1)
    end
    if string.sub(str, 1, shell_ex_str_len) == shell_ex_str then
        return shell_ex_str .. "gobble=1," ..
            string.sub(str, shell_ex_str_len + 1)
    end
    if string.sub(str, 1, syntax_str_len) == syntax_str then
        return syntax_str .. "gobble=4," ..
            string.sub(str, syntax_str_len + 1)
    end
    return str
end

for line in input_file:lines() do
    if string.sub(line, 1, label_str_len) == label_str then
        new_line = " " .. string.sub(line, label_str_len + 1)
        if new_line == " " then
            -- 移除空行中的多余空格
            new_line = ""
        else
            -- 移除其他行的行首空格
            -- `3` 是第一个非空白字符的位置
            new_line = string.sub(new_line, 3)
            -- 添加 gobble 信息
            new_line = add_lst_gobble(new_line)
        end
        output_file:write(new_line, "\n")
    end
end

input_file:close()
output_file:close()

-- TODO: use `dos2unix` to convert line breaks into LF.
-- Example:
--     dos2unix.exe fduthesis-en.tex
