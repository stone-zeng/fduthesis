# fduthesis

[![Build Status](https://travis-ci.org/Stone-Zeng/fduthesis.svg?branch=master)](https://travis-ci.org/Stone-Zeng/fduthesis)
[![GitHub release](https://img.shields.io/github/release/Stone-Zeng/fduthesis/all.svg)](https://github.com/Stone-Zeng/fduthesis/releases/latest)

## 欢迎使用 fduthesis - 复旦大学论文模板！

在您使用 `fduthesis` 之前，请务必仔细阅读模板文档
[fduthesis.pdf](https://github.com/Stone-Zeng/fduthesis/releases/download/v0.3/fduthesis.pdf)。
该文档也可通过如下命令生成：

    latexmk fduthesis.dtx

若需要生成模板各部件，请执行如下命令：

    xetex fduthesis.dtx

### 模板组成

- `source/`             源代码
  - `fduthesis.dtx`       模板代码、注释以及文档
  - `ctxdoc-m.cls`        模板文档样式（修改自 `ctxdoc.cls`）
  - `.latexmkrc`           latexmk 配置文件

- `test/`               测试文件
  - `fduthesis.cls`       fduthesis 模板类
  - `fduthesis-en.cls`    fduthesis 模板类（英文版）
  - `fduthesis.def`       模板参数配置文件
  - `fduthesis-user.def`  用户配置文件
  - `test.tex`            测试论文
  - `test-en.tex`         测试论文（英文版）

- `support/`            Travis CI 支持文件
  - `texlive.sh`          安装最新版本 TeX Live
  - `texlive.profile`     TeX Live 环境变量配置
  - `local.sh`            安装本地宏包及相关字体
  - `run.sh`              执行测试命令

- `logo/`               复旦大学标识
  - `fudan-name.tex`      校名
  - `fudan-emblem.tex`    校徽
  - `fudan-motto.tex`     校训

- `.gitignore`          Git 忽略文件

- `.travis.yml`         Travis CI 配置文件

- `README.md`           自述文件（本文档）

### 许可证

本模板的发布遵守 [LaTeX Project Public License](http://www.latex-project.org/lppl.txt)
(版本 1.3c 或更高)。

<br></br>

## Welcome to fduthesis - LaTeX thesis template for Fudan University!

Before you using `fduthesis`, please read the document
[fduthesis.pdf](https://github.com/Stone-Zeng/fduthesis/releases/download/v0.3/fduthesis.pdf)
carefully. This file can be generated with the following commands
as well:

    latexmk fduthesis.dtx

If you want to get all components of `fduthesis`, please excute the
following commands:

    xetex fduthesis.dtx

### License

This work may be distributed and/or modified under the conditions of
the [LaTeX Project Public License](http://www.latex-project.org/lppl.txt),
either version 1.3c of this license or (at your option) any later
version.
