# fduthesis

[![build](https://github.com/stone-zeng/fduthesis/workflows/build/badge.svg)](https://github.com/stone-zeng/fduthesis/actions)
[![Overleaf](https://img.shields.io/badge/overleaf-fduthesis-blue.svg)](https://www.overleaf.com/latex/templates/fduthesis-latex-thesis-template-for-fudan-university/svtdhhstkmkt)
[![CTAN](https://img.shields.io/ctan/v/fduthesis.svg)](https://www.ctan.org/pkg/fduthesis)
[![GitHub release](https://img.shields.io/github/release/stone-zeng/fduthesis/all.svg)](https://github.com/stone-zeng/fduthesis/releases/latest)

## 欢迎使用 fduthesis（复旦大学论文模板）

本模板支持中英文的博士、硕士学位论文以及本科毕业论文撰写。借助现代 LaTeX 技术，希望达到用户接口简明、内容格式规范和模板样式可定制的统一。

本模板目前支持 XeTeX 和 LuaTeX 引擎，对其他引擎（包括 pdfTeX 和 [ApTeX](https://github.com/clerkma/ptex-ng)）的支持仍在实验阶段。本模板仅支持 UTF-8 编码。

在您使用 `fduthesis` 之前，请务必仔细阅读模板文档 [fduthesis.pdf](http://mirrors.ctan.org/macros/latex/contrib/fduthesis/fduthesis.pdf)。

### 模板组成

- 核心文档类
  - `fduthesis.cls`
  - `fduthesis-en.cls`
- 配置文件
  - `fduthesis.def`
- 附属宏包
  - `fdulogo.sty`
  - `fdudoc.cls`
- 使用示例
  - `fduthesis-template.tex`

### 使用示例

```latex
% !TeX program  = XeLaTeX
% !TeX encoding = UTF-8

\documentclass{fduthesis}

\fdusetup{
  style = {
    font-size = 5,
    fullwidth-stop = catcode,
  },
  info = {
    title = {论文标题},
    title* = {Thesis Title},
    author = {你的名字},
    supervisor = {某某某\quad 教授},
    major = {物理学},
    degree = academic,
    department = {物理系},
    student-id = {12300000000},
    keywords = {不确定关系, 量子力学, 理论物理},
    keywords* = {Uncertainty principle, quantum mechanics, theoretical physics},
    clc = {O413.1}
  }
}

\begin{document}

\tableofcontents

\begin{abstract}
  中文摘要
\end{abstract}

\begin{abstract*}
  English abstract
\end{abstract*}

\mainmatter

<论文主体>

\backmatter

\end{document}
```

### 重要提醒

1. 本模板未经学校相关部门审核及授权，使用前请务必斟酌。
1. 本模板仍处于开发中，不保证接口的稳定性。在撰写论文的过程中，请慎重考虑是否要同步进行更新。
1. 任何由于使⽤本模板⽽引起的论⽂格式审查问题均与本模板作者⽆关。

### 贡献

如果您有任何改进意见或者功能需求，欢迎提交 [issue](https://github.com/stone-zeng/fduthesis/issues) 或 [pull request](https://github.com/stone-zeng/fduthesis/pulls)。

### 许可证

本模板的发布遵守 [LaTeX Project Public License](http://www.latex-project.org/lppl.txt)（版本 1.3c 或更高）。

<br>

## Welcome to fduthesis (LaTeX thesis template for Fudan University)

This template supports doctoral or master dissertion and undergraduate thesis, both in Chinese or English. With the help of modern LaTeX technology, `fduthesis` aims to create a simple interface, a normative format, as well as a hackable class for the users.

At present, `fduthesis` only supports XeTeX and LuaTeX engines. Support for pdfTeX and [ApTeX](https://github.com/clerkma/ptex-ng) is still under development. `fduthesis` only allows UTF-8 encoding.

Before you using `fduthesis`, please read the document [fduthesis-en.pdf](http://mirrors.ctan.org/macros/latex/contrib/fduthesis/fduthesis-en.pdf) carefully.

**WARNING:** `fduthesis` has NOT reviewed or authorized by any department of Fudan University. Any problem of format censorship caused by the use of `fduthesis` will NOT be concerned by the template author.

### Components

- Main template classes:
  - `fduthesis.cls`
  - `fduthesis-en.cls`
- Configuration file:
  - `fduthesis.def`
- Affiliated packages:
  - `fdulogo.sty`
  - `fdudoc.cls`
- Demo:
  - `fduthesis-template.tex`

### Sample

```latex
\documentclass{fduthesis-en}

\fdusetup{
  style/font-size = 5,
  info = {
    title = {论文标题},
    title* = {Thesis Title},
    author = {你的名字},
    supervisor = {某某某\quad 教授},
    major = {物理学},
    degree = academic,
    department = {物理系},
    student-id = {12300000000},
    keywords = {不确定关系, 量子力学, 理论物理},
    keywords* = {Uncertainty principle, quantum mechanics, theoretical physics},
    clc = {O413.1}
  }
}

\begin{document}

\tableofcontents

\begin{abstract}
  Abstract
\end{abstract}

\mainmatter

<Main body of your thesis>

\backmatter

\end{document}
```

### Contributing

[Issues](https://github.com/stone-zeng/fduthesis/issues) and [pull requests](https://github.com/stone-zeng/fduthesis/pulls) are always welcome.

### License

This work may be distributed and/or modified under the conditions of the [LaTeX Project Public License](http://www.latex-project.org/lppl.txt), either version 1.3c of this license or (at your option) any later version.

-----

Copyright (C) 2017&ndash;2022 by Xiangdong Zeng.
