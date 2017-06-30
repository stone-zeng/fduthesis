# fduthesis

[![Build Status](https://travis-ci.org/Stone-Zeng/fduthesis.svg?branch=master)](https://travis-ci.org/Stone-Zeng/fduthesis)

## 欢迎使用 fduthesis - 复旦大学论文模板！

- 在您使用 `fduthesis` 之前，请务必仔细阅读模板文档 `fduthesis.pdf`。
该文档可通过如下命令生成：

  ```batch
  xelatex fduthesis.dtx
  makeindex -s gind.ist fduthesis
  xelatex fduthesis.dtx
  xelatex fduthesis.dtx
  ```

### 模板组成

- `source/`             源代码
  - `fduthesis.dtx`       模板代码、注释以及文档
  - `fduthesis.ins`       模板安装文件
  - `ctxdoc-m.cls`        模板文档样式（修改自 `ctxdoc.cls`）

- `test/`               测试文件
  - `fduthesis.cls`       fduthesis 模板类
  - `fduthesis.def`       模板定义文件
  - `fduthesis-user.def`  用户定义文件

- `support/`            Travis CI 支持文件
  - `texlive.sh`          安装最新版本 TeX Live
  - `texlive.profile`     TeX Live 环境变量配置
  - `local.sh`            字体、本地宏包安装

- `logo/`               复旦大学标识
  - `fudan-name.tex`      校名
  - `fudan-emblem.tex`    校徽
  - `fudan-motto.tex`     校训

- `.gitignore`          Git 忽略文件

- `.travis.yml`         Travis CI 配置文件

### 许可证

- 本模板的发布遵守 [LaTeX Project Public License](http://www.latex-project.org/lppl.txt)
(版本 1.3c 或更高)。

## Welcome to fduthesis - LaTeX thesis template for Fudan University!

- Before you using `fduthesis`, please read the document
`fduthesis.pdf` carefully. This file can be generated with the
following commands:

  ```batch
  xelatex fduthesis.dtx
  makeindex -s gind.ist fduthesis
  xelatex fduthesis.dtx
  xelatex fduthesis.dtx
  ```

### License

- This work may be distributed and/or modified under the conditions
of the [LaTeX Project Public License](http://www.latex-project.org/lppl.txt),
either version 1.3c of this license or (at your option) any later
version.