# fduthesis 修订记录

本文档格式遵守 [Keep a Changelog]。

## [[未发布]]

- 新增
  - 新增 `info/jel` 选项 - [#192]
  - 新增 `style/declaration-page` 选项用来插入扫描版的声明页 PDF 文档 - [#50]
- 修复
  - 在使用前声明提示信息 - [#239]
  - 修复超链接边框不显示的问题；不需要为 `hidelinks` 选项传递参数 - [#227]
  - 允许在 `biblatex` 下使用多个数据源 - [#186]
  - 兼容 `addbibresource` 命令 - [#229]
    - 感谢 [@atxy-blip]！
  - 正确调用引用样式 - [#183]
  - 直接调用 `\thechapter` 使得附录中的图表编号正确显示 - [#166]
  - 判断 Libertinus Sans Bold Oblique 字体是否存在 - [#156]
  - 只检查 `ctexbook` 和 `xeCJK` 的版本，不再检查 `xunicode-addon` 等其他宏包 - [#150]
  - 允许 `\emph` 对中文生效 - [#93]
  - 将句号的类别码设置应用于预定义文本中，并优化实现，防止输出到辅助文件后引发错误 - [#74]
  - 在 `\@@_setCJKmainfont:nn` 等命令中展开字体族名称，防止导言区中 `\setCJKmainfont` 等命令失效
- 变更
  - 同步 LaTeX 2020/10/01
    - 统一使用新的钩子机制 - [#77]
    - 不再显式载入 `expl3` 和 `xparse` 宏包
  - 移除 `style/hyperlink-color` 中不常用的超链接颜色
  - 同步 `siunitx` v3.0 - [#202]
  - 进一步同步 `gbt7714` v2.0 - [#127]
    - 直接调用 `gbt7714` 宏包
    - 允许在 BibTeX 下使用 `style/cite-style` 选项修改引用样式
    - 新增不带上标的文内引用命令 `\parencite` - [#163]
    - 不再将著录用符号修改为中文标点符号 - [#162]
  - 将专业学位封面信息栏中的 `专业` 修改为 `专业学位类别（领域）`，并调整宽度 - [#114]
  - `info/instructors` 为空时不再显示指导小组成员名单 - [#49]
  - `info/clc`、`info/jel` 为空时不再显示对应的分类号 - [#100]、[#226]
  - 不再使用 `\CheckSum` 和 `\CharacterTable` 检查 dtx 文件完整性
  - 将 GitHub 主分支由 `master` 重命名为 `main`
- 优化
  - 简化单页模式下页眉的实现方式 - [#233]
    - 感谢 [@atxy-blip]！
  - 添加 GitHub issue 模板与行为准则

## [v0.7e (2020-08-30)]

- 新增
  - 增加对插图、表格目录的处理 - [#72]
- 修复
  - 兼容 Libertinus 和 XITS 字体的文件名变动
  - 处理 `hyperref` 与 `unicode-math` 的兼容性问题 - [ustctug/ustcthesis#223]
  - 同步 `gbt7714` v2.0 - [#127]
- 优化
  - 同步 TeX Live 2019、2020
  - 持续集成改为使用 GitHub Actions

## [v0.7d (2019-04-03)]

- 变更
  - 在（中文）字体未提供对应粗体的情况下，允许使用伪粗，并用于封面中文标题 - [#68]
- 修复
  - 修复参考文献不能在目录中显示的问题 - [#65]、[#69]
  - 修复 Unix 下的安装脚本 - [#64]
    - 感谢 [@ShichaoSun]！
- 优化
  - 优化目录、摘要、参考文献等的标题实现
  - 优化关键字列表的显示 - [#70]

## [v0.7c (2019-03-17)]

- 新增
  - `style/font` 新增 `garamond` 和 `times*` 样式
  - `style/cjk-font` 新增 `sinotype` 和 `sourcehan` 样式
- 变更
  - 允许博士学位论文使用学位类型信息 - [#56]
  - 移除 latexmk 配置文件 `latexmkrc` 和 `latexmkrc-en`
- 修复
  - 修复 macOS 下的字体调用问题 - [#36]、[#45]
- 优化
  - 重构字体配置
  - 更换模版文档字体
  - 在项目 wiki 中介绍使用技巧 - [#52]
    - 感谢 [@jinyu121]、[@zepinglee]！

## [v0.7b (2018-05-06)]

- 修复
  - 将校名、校徽图片添加至发行版 - [#32]
  - 支持 TeX Live 2018
  - [fdudoc] 调用 `xunicode` 宏包，使得代码中的星号可以正常显示 - [#33]

## [v0.7a (2018-04-09)]

- 优化
  - 更新文档，发布至 CTAN - [#25]

## [v0.7 (2018-03-16)]

- 新增
  - 参考文献支持 biber 与 `biblatex` - [#18]
    - 新增 `style/bib-backend`、`style/cite-style` 和 `style/bib-resource` 选项
    - 统一使用 `\printbibliography` 命令生成参考文献列表
  - 允许设置论文类型和学位类型
    - 新增 `type` 选项
    - 新增 `info/degree` 选项
  - 新增空白论文模板 `fduthesis-template.tex`
  - 新增不包含代码实现的简明用户手册
- 变更
  - 移除 `fduthesis-user.def`，用户配置文件改为手动载入 - [#26]
    - 新增 `config` 选项
  - 同步 `gbt7714` v1.0，移除有关超链接的额外设置
  - 所有选项更改为用连字符隔开的形式
  - 原 `\fdunewtheorem` 命令更名为 `\newtheorem`
- 修复
  - 调整脚注命令，以兼容 `fancyvrb` 宏包 - [#28]
- 优化
  - 重构 `abstract*`、`notation` 等
  - 使用 `xtemplate` 重构封面布局
  - 使用 `l3build` 进行回归测试

## [v0.6 (2017-12-01)]

- 新增
  - 支持 BibTeX，以实现参考文献的著录与引用 - [#18]
  - 新增 `style/bib-style` 选项
  - 添加英文版用户文档 - [#19]
- 变更
  - `style/fullwidth-stop` 现在支持类别码和 TECKit 映射两种机制 - [#5]
  - 同步 `ctex` v2.4.11
  - 同步 `unicode-math` v0.8i - [#20]
- 修复
  - LuaTeX 下的脚注编号- [#12]
  - 解决 `fontsize=5` 时封面信息栏出现的 overfull hbox - [#21]
- 优化
  - 优化 URL 断行设置
  - `info/secret-level`、`style/footnote-style`：不再依赖 XITS-Math 字体 - [#22]
  - `style/font`：额外处理 XITS 字体的小型大写字母

## [v0.5 (2017-09-30)]

- 新增
  - 新增 `font=none`、`cjkfont=none` 选项
  - [fdulogo] 将视觉识别系统移入 `fdulogo` 宏包，并添加重修版校徽
- 变更
  - 移除 `nofonts` 选项
  - 同步 `fontspec` v2.6e
  - [fdudoc] 移除 `listings` 关键字定义文件
- 优化
  - 重新实现字体调用，核心内容是分离字体的声明与设定，并按照宋、黑、仿、楷划分中文字体 - [#17]
  - 使用 `expl3` 以及内部函数改写封面，减少对 LaTeX2e 的依赖

## [v0.4 (2017-08-14)]

- 新增
  - 新增 `logo` 与 `logosize` 选项
  - 新增 hyperref 相关配置，包括超链接样式（`hyperlink` 与 `hyperlinkcolor` 选项）及 PDF 元信息等
  - 提供彩色支持
  - 添加错误信息提示
  - [fdudoc] 在 `ctxdoc` 的基础上完成 `fdudoc` 文档类，用于模板手册编写
- 变更
  - `\__fdu_blank_underline:n`：改用 `\rule` 绘制下划线，不再依赖 `ulem` 宏包
  - [fdudoc] `\changes@`：调整索引排序方式
- 修复
  - `\fdu_family_if_exist:n`：修复 LuaTeX 下的展开错误
  - [fdudoc] 修复 `ctxdoc` 文档类 v2.4.10 之前版本中行距偏小的问题，⻅ [ctex-kit#303]
- 优化
  - 拆分 `.dtx` 文件

## [v0.3 (2017-07-28)]

- 新增
  - 英文模板
  - 视觉识别系统
  - 新增定理环境 - [#3]
  - 新增声明⻚
  - 新增 `info/secretlevel` 与 `info/secretyear` 选项
  - 支持浮动体
  - 支持脚注 - [#2]
  - 支持 LuaLaTeX
- 优化
  - 整理代码，编写用户文档
  - 分离文档类与参数配置文件
  - 使用 `doc`、`DocStrip` 和 `l3docstrip` 重构代码
  - 添加测试文件，使用 Travis CI 进行持续集成

## v0.2 (2017-02-19)

- 使用 Git 进行版本控制，并发布至 GitHub。

## v0.1 (2017-02-15)

- 开始编写模板。

[Keep a Changelog]: https://keepachangelog.com

[未发布]: https://github.com/stone-zeng/fduthesis/compare/v0.7e...main
[v0.7e (2020-08-30)]: https://github.com/stone-zeng/fduthesis/compare/v0.7d...v0.7e
[v0.7d (2019-04-03)]: https://github.com/stone-zeng/fduthesis/compare/v0.7c...v0.7d
[v0.7c (2019-03-17)]: https://github.com/stone-zeng/fduthesis/compare/v0.7b...v0.7c
[v0.7b (2018-05-06)]: https://github.com/stone-zeng/fduthesis/compare/v0.7a...v0.7b
[v0.7a (2018-04-09)]: https://github.com/stone-zeng/fduthesis/compare/v0.7...v0.7a
[v0.7 (2018-03-16)]: https://github.com/stone-zeng/fduthesis/compare/v0.6...v0.7
[v0.6 (2017-12-01)]: https://github.com/stone-zeng/fduthesis/compare/v0.5...v0.6
[v0.5 (2017-09-30)]: https://github.com/stone-zeng/fduthesis/compare/v0.4...v0.5
[v0.4 (2017-08-14)]: https://github.com/stone-zeng/fduthesis/compare/v0.3...v0.4
[v0.3 (2017-07-28)]: https://github.com/stone-zeng/fduthesis/compare/37dace3...v0.3

[#2]: https://github.com/stone-zeng/fduthesis/issues/2
[#3]: https://github.com/stone-zeng/fduthesis/issues/3
[#5]: https://github.com/stone-zeng/fduthesis/issues/5
[#12]: https://github.com/stone-zeng/fduthesis/issues/12
[#17]: https://github.com/stone-zeng/fduthesis/issues/17
[#18]: https://github.com/stone-zeng/fduthesis/issues/18
[#18]: https://github.com/stone-zeng/fduthesis/issues/18
[#19]: https://github.com/stone-zeng/fduthesis/issues/19
[#20]: https://github.com/stone-zeng/fduthesis/issues/20
[#21]: https://github.com/stone-zeng/fduthesis/issues/21
[#22]: https://github.com/stone-zeng/fduthesis/issues/22
[#25]: https://github.com/stone-zeng/fduthesis/issues/25
[#26]: https://github.com/stone-zeng/fduthesis/issues/26
[#28]: https://github.com/stone-zeng/fduthesis/issues/28
[#32]: https://github.com/stone-zeng/fduthesis/issues/32
[#33]: https://github.com/stone-zeng/fduthesis/issues/33
[#36]: https://github.com/stone-zeng/fduthesis/issues/36
[#45]: https://github.com/stone-zeng/fduthesis/issues/45
[#49]: https://github.com/stone-zeng/fduthesis/issues/49
[#50]: https://github.com/stone-zeng/fduthesis/issues/50
[#52]: https://github.com/stone-zeng/fduthesis/issues/52
[#56]: https://github.com/stone-zeng/fduthesis/issues/56
[#65]: https://github.com/stone-zeng/fduthesis/issues/65
[#68]: https://github.com/stone-zeng/fduthesis/issues/68
[#69]: https://github.com/stone-zeng/fduthesis/issues/69
[#70]: https://github.com/stone-zeng/fduthesis/issues/70
[#72]: https://github.com/stone-zeng/fduthesis/issues/72
[#74]: https://github.com/stone-zeng/fduthesis/issues/74
[#77]: https://github.com/stone-zeng/fduthesis/issues/77
[#93]: https://github.com/stone-zeng/fduthesis/issues/93
[#100]: https://github.com/stone-zeng/fduthesis/issues/100
[#114]: https://github.com/stone-zeng/fduthesis/issues/114
[#127]: https://github.com/stone-zeng/fduthesis/issues/127
[#127]: https://github.com/stone-zeng/fduthesis/issues/127
[#150]: https://github.com/stone-zeng/fduthesis/issues/150
[#156]: https://github.com/stone-zeng/fduthesis/issues/156
[#162]: https://github.com/stone-zeng/fduthesis/issues/162
[#163]: https://github.com/stone-zeng/fduthesis/issues/163
[#166]: https://github.com/stone-zeng/fduthesis/issues/166
[#183]: https://github.com/stone-zeng/fduthesis/issues/183
[#186]: https://github.com/stone-zeng/fduthesis/issues/186
[#192]: https://github.com/stone-zeng/fduthesis/issues/192
[#202]: https://github.com/stone-zeng/fduthesis/issues/202
[#226]: https://github.com/stone-zeng/fduthesis/issues/226
[#227]: https://github.com/stone-zeng/fduthesis/issues/227
[#229]: https://github.com/stone-zeng/fduthesis/issues/229

[#64]: https://github.com/stone-zeng/fduthesis/pull/64
[#233]: https://github.com/stone-zeng/fduthesis/pull/233

[ctex-kit#303]: https://github.com/CTeX-org/ctex-kit/issues/303
[ustctug/ustcthesis#223]: https://github.com/ustctug/ustcthesis/issues/223

[@atxy-blip]: https://github.com/atxy-blip
[@jinyu121]: https://github.com/jinyu121
[@ShichaoSun]: https://github.com/ShichaoSun
[@zepinglee]: https://github.com/zepinglee
