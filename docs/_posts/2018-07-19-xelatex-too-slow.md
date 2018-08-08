---
layout: post
title:  "解决 XeLaTeX 编译卡住不动的问题"
date:   2018-07-19 15:33:00 +0800
categories: XeTeX
---

## 问题概述

Windows 平台使用 XeLaTeX 编译时，偶尔会出现卡住不动的情况。特点是会卡在读入字体文件的时候，比如 `size10.clo`、`eu1lmr.fd` 等，并且往往出现在新安装字体之后。

正常情况下，`xetex` 在发现字体变动时，会自动调用 `fontconfig` 库刷新字体缓存，因此在后续编译过程中速度便可恢复正常。

不过，在 Windows 下 TeX Live 2016、2017 似乎实现有问题（fontconfig [Bug 99360](https://bugs.freedesktop.org/show_bug.cgi?id=99360)），导致 `xetex` 再刷新缓存时无法正确覆盖旧的文件，因此每次编译都需花费大量时间&nbsp;<sup>[1](#1)</sup>。

## 解决方法

正常的解决方法是手工刷新字体缓存。命令行中执行：

```batch
fc-cache
```

这一命令可以带如下选项：

- `-f`、`--force`：强制刷新
- `-r`、`--really-force`：清除缓存再重新扫描
- `-v`、`--verbose`：显示详细信息

注意刷新字体缓存可能需要花费十多分钟甚至更长时间。每次安装或卸载字体之后，可能都需要运行一次。

如果 `fc-cache` 不能解决问题，可以依次尝试以下方法：

- 加上选项 `-f` 或 `-r` 来执行 `fc-cache`
- 开启管理员权限，即在「命令提示符（管理员）」中执行上述命令
- 删除字体缓存目录（`texlive/<年份>/texmf-var/fonts/cache/`）下的所有文件，并检查目录权限
- 在 `xelatex.exe`（位于 `texlive/<年份>/bin/win32/` 下）的属性中设置「以兼容性模式运行这个程序：Windows 7」&nbsp;<sup>[2](#2)</sup>
- 设置兼容性模式后再取消&nbsp;<sup>[2](#2)</sup>
- 卸载并重新安装 TeX Live

## 注释

1. <a name="1"></a> 该问题在 TeX Live 2018 中应该已经得到修复。

1. <a name="2"></a> 原因不明，见 xueruini/thuthesis [#278](https://github.com/xueruini/thuthesis/issues/278) 中的讨论。

## 参考

1. 刘海洋. [*XeLaTeX 编译时间太长是什么原因？*](https://www.zhihu.com/question/53981204/answer/189872891)

1. @GregH. [*XeLaTeX runs slow on Windows machine*](https://tex.stackexchange.com/q/325278)

1. @jdhao. [*compiling tex files with xelatex is insanely slow on my Windows machine*](https://tex.stackexchange.com/q/357098)

1. Ulrike Fischer. [*[tex-live] xe(la)ex and font searching delay*](https://tug.org/pipermail/tex-live/2017-March/039768.html)
