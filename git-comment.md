# Git 提交信息格式

```
<type>: (<scope>) <subject> ([ci skip])
// 空一行
<body>
// 空一行
<footer>
```

## Header

- `type`：说明提交的类别

  - **build**：构建系统或外部依赖关系
  - **ci**：持续集成（continuous integration）
  - **feature**：新功能（feature）
  - **fix**：修补 bug
  - **docs**：文档（documentation）
  - **perf**: 改进性能的代码更改（performance）
  - **refactor**：重构（即非新增功能，也非修补 bug）
  - **style**： 格式（不影响代码运行的变动）
  - **test**：测试
  - **other**：其他

- `scope`：说明影响范围

- `subject`：目的简述，不超过 70 个字符

  - 以动词开头，使用第一人称现在时
  - 第一个字母小写
  - 结尾不加句号（.）

- `[ci skip]`：临时禁止 ci 的自动测试

## Body

说明代码变动的动机，以及与以前行为的对比

示例：

```markdown
More detailed explanatory text, if necessary. Wrap it to
about 72 characters or so. 

Further paragraphs come after blank lines.

- Bullet points are okay, too
- Use a hanging indent
```

## Footer

- 不兼容变动（breaking change）

  - 以 `BREAKING CHANGE` 开头
  - 需指出对变动的描述、变动理由和迁移方法。

- 关闭 issue

  - 如 `Close #1`

## 撤销提交（Revert）

- 以 `revert:` 开头，后跟被撤销 commit 的 header

- Body 部分写成 `This reverts commit <hash>`，其中的 `<hash>`
  是被撤销 commit 的 SHA 标识符

- GitHub 会自动处理
