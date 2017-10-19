local input_file_name  = "fduthesis.dtx"
local output_file_name = "fduthesis-en.tex"

local tag_inline_str = "%^^A!"
local tag_begin_str  = "%^^A+"
local tag_end_str    = "%^^A-"
local tag_str_len    = string.len(tag_inline_str)

local latex_ex_str = "\\begin{latexexample}["
local shell_ex_str = "\\begin{shellexample}["
local syntax_str   = "  \\begin{fdusyntax}["

local latex_ex_str_len = string.len(latex_ex_str)
local shell_ex_str_len = string.len(shell_ex_str)
local syntax_str_len   = string.len(syntax_str)

local function test_tag(str, tag)
    if string.sub(str, 1, string.len(tag)) == tag then
        return true
    end
    return false
end

local function remove_normal_space(str)
    -- 普通文本开头会有 2 个空格
    -- `3` 是第一个非空白字符的位置
    return string.sub(str, 3)
end

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

local function process_verbatim_line(str)
    -- 抄录环境
    str = remove_normal_space(str)
    str = add_lst_gobble(str)
    return str
end

local function process_normal_line(str)
    -- 普通文本行
    str = string.sub(str, tag_str_len + 2)
    str = add_lst_gobble(str)
    return str
end

-----------------
-- 开始处理文件
-----------------

input_file  = io.open(input_file_name,  "r")
output_file = io.open(output_file_name, "w")

-- 判断是否处于抄录环境
tag_inside_flag = 0

for line in input_file:lines() do
    -- 如果开头是 `%^^A+` 或 `%^^A-`，则增减 flag，以确定抄录开始、结
    -- 束的位置
    if test_tag(line, tag_begin_str) then
        tag_inside_flag = tag_inside_flag + 1
    elseif test_tag(line, tag_end_str) then
        tag_inside_flag = tag_inside_flag - 1
    else
        -- 如果 flag = 1，则为抄录环境
        if tag_inside_flag == 1 then
            output_file:write(process_verbatim_line(line), "\n")
        -- 如果开头是 `%^^A!`，则为普通文本行
        elseif test_tag(line, tag_inline_str) then
            output_file:write(process_normal_line(line), "\n")
        end
    end
end

input_file:close()
output_file:close()

-- TODO: use `dos2unix` to convert line breaks into LF.
-- Example:
--     dos2unix.exe fduthesis-en.tex
