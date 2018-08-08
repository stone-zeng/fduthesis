---
layout: post
title:  "在 Ubuntu 中安装 TeX Live 2018"
date:   2018-05-13 18:06:00 +0800
categories: TeX Live
---

不建议安装源里面的 TeX Live，即避免通过 `apt-get` 安装。原因见&nbsp;[[1](#1)]。

## 下载安装包

如果身在国内，推荐改用国内的镜像，比如清华大学的 [tuna](https://mirrors.tuna.tsinghua.edu.cn/)。以下都以这个镜像为例。

在 <https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/tlnet/> 下载 `install-tl-unx.tar.gz`，解压并进入文件夹 `install-tl-2018*`。这里的 `*` 是一个日期。

命令行中的操作如下：

```sh
wget https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/tlnet/install-tl-unx.tar.gz
tar -xzf install-tl-unx.tar.gz
cd install-tl-2018*
```

## 安装 TeX Live

命令行中执行

```sh
sudo ./install-tl -repository https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/tlnet/
```

注意需要管理员权限。如有必要，可能还需安装 `perl-tl` 和 `perl-doc`：

```sh
sudo apt-get install perl-tk perl-doc
```

等待片刻后会进入选项菜单，根据需要酌情选取。也可以事先写好配置文件 `texlive.profile`。示例可以见&nbsp;[[2](#2)]。

没有特殊需要的话，collection 可以不必全部安装，尤其是很多小语种。不过后果是之后可能会缺包。不愿意之后手动安装，并且空间足够、网速足够，也可以全部安装。注意 TeX Live 完全安装后大约要占 6 GB 空间，安装前请务必做好准备。中途断网很可能导致安装失败。

其他选项没有必要保持默认即可。

### GUI 模式

开启 `-gui` 选项后可以在图形界面安装（当然前提是要有 GUI 支持）：

```sh
sudo ./install-tl -gui -repository https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/tlnet/
```

如下图所示：

![install-texlive-ubuntu-gui](../images/install-texlive-ubuntu-gui.png)

注意此时终端不可以关闭。

### 使用 ISO 安装

TODO

## 环境变量设置

此时 TeX Live 虽已安装，但其路径对于 Linux 来说仍是不可识别的。所以需要更改环境变量。

打开 `~/.bashrc`，在最后添加

```sh
export PATH=/usr/local/texlive/2018/bin/x86_64-linux:$PATH
export MANPATH=/usr/local/texlive/2018/texmf-dist/doc/man:$MANPATH
export INFOPATH=/usr/local/texlive/2018/texmf-dist/doc/info:$INFOPATH
```

还需保证开启 sudo 模式后路径仍然可用。命令行中执行

```sh
sudo visudo
```

找到如下一段代码

```sh
Defaults        env_reset
Defaults        mail_badpass
Defaults        secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"
```

将第三行更改为

```sh
Defaults        secure_path="/usr/local/texlive/2018/bin/x86_64-linux:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"
```

也就是加入 TeX Live 的执行路径。如果在安装时作了修改，这里的路径也都要与安装时的保持一致。

## 字体设置

要在整个系统中使用 TeX 字体，还需要将 TeX 自带的配置文件复制到系统目录下。命令行中执行

```sh
sudo cp /usr/local/texlive/2018/texmf-var/fonts/conf/texlive-fontconfig.conf /etc/fonts/conf.d/09-texlive.conf
```

之后再执行

```sh
sudo fc-cache -fv
```

刷新字体数据库。

## 安装「dummy package」

TODO

## 检查

到此整个 TeX Live 2018 就已经安装完毕。可以做下面的一些检查：

### 基本命令：

```sh
tlmgr --version
pdftex --version
xetex --version
luatex --version
```

### 包管理器

```sh
sudo tlmgr update --list
```

这一步是检查更新，如果有就顺手更了吧：

```sh
sudo tlmgr update --self --all
```

`--self` 用来更新 tlmgr 自身，如果上一步没有提示可以不加这个选项。

### Hello world

可以编译一个简短的测试文件：

```latex
% hello.tex
\documentclass[UTF8]{ctexart}
\begin{document}
欢迎来到 \TeX{} 世界！
\end{document}
```

用 `xelatex` 或 `lualatex` 编译：

```sh
xelatex hello
lualatex hello
```

编译得到的 PDF 文件如果显示正常，则说明 TeX Live 基本工作正常。

## 注释

1. <a name="1"></a> 李阿玲. [*还是不要装源里面的 TeX Live！*](https://zhuanlan.zhihu.com/p/19699561)

1. <a name="2"></a> <https://github.com/latex3/latex3/blob/master/support/texlive.profile>

## 参考

1. Karl Berry. 江疆 译. [*TeX Live 指南 —— 2018*](http://tug.org/texlive/doc/texlive-zh-cn/texlive-zh-cn.pdf)

1. @Dima. [*How to install "vanilla" TeXLive on Debian or Ubuntu?*](https://tex.stackexchange.com/q/1092)

1. Enrico Gregorio. [*Installing TeX Live 2010 on Ubuntu*](http://www.tug.org/TUGboat/tb32-1/tb100gregorio.pdf)
