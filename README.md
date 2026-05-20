# `ucasthesis2026` 国科大学位论文 LaTeX 模板

基于 [mohuangrui/ucasthesis](https://github.com/mohuangrui/ucasthesis) 二次开发的独立分支，严格按照《中国科学院大学研究生学位论文撰写规范指导意见》（2022年修订，2023年冬季批次起实施）进行格式更新。本分支与原始仓库无任何关联。

维护者：皮卡丘 (Kaqiu Pi) <wwwdream521@163.com>

## 与原始模板的主要区别

- 正文行距：`1.6` → `1.25`（1.25 倍行距）
- 页面设置：使用 `geometry` 包，上/下 2.54cm，左/右 3.17cm
- 页眉页脚：宋体小五号，奇数页章名，偶数页论文题目；正文页码左页左下角/右页右下角
- 章标题：段前 24 磅，段后 18 磅
- 封面格式：标题黑体小三号单倍行距，字段宋体四号 2 倍行距
- 声明文本：更新为 2022 版措辞
- 图表目录：图目录 / 表目录分列
- 参考文献 / 附录 / 致谢格式按新规范调整

## 已知限制与后续计划

- **参考文献标准更新**：GB/T 7714—2025 已于 2025 年 12 月 2 日发布，将于 2026 年 7 月 1 日正式实施，全面替代 GB/T 7714—2015。本模板目前仍使用 2015 版标准，待新版 biblatex-gb7714 宏包发布后将跟进更新。
- **双语图表标题间距**：中英文标题之间的段前段后间距尚需微调。
- 其他细节持续完善中。

## 快速开始

### 1. 填写个人信息

编辑 `Tex/Frontinfo.tex`，修改中文和英文封面信息：

```latex
\title{论文中文题目}
\author{姓名}
\advisor{导师姓名~职称~工作单位\\}
\degree{硕士}         % 学士、硕士、博士
\degreetype{工学}     % 理学、工学等
\major{学科专业名称}
\institute{培养单位名称}
\date{2026~年~6~月}   % 夏季6月、冬季12月
```

英文封面同理。注意英文姓名须按规范格式填写：**姓在前、名在后，姓全大写、名首字母大写**（例如中文名"皮卡丘"→ `PI Kaqiu`，而非英文习惯的 `Kaqiu Pi`）。参考《中国人名汉语拼音字母拼写规则》（GB/T 28039—2011）。

### 2. 编译

```bash
# Linux / Mac
bash artratex.sh

# 或手动编译
xelatex Thesis.tex
bibtex Thesis
xelatex Thesis.tex
xelatex Thesis.tex
```

### 3. 编写内容

- 正文章节在 `Tex/Mainmatter.tex` 中添加
- 参考文献放入 `Biblio/ref.bib`
- 图片放入 `Img/` 目录

## 编译环境

| 组件 | 说明 |
|------|------|
| LaTeX 引擎 | xelatex（推荐）、pdflatex、lualatex |
| 文献编译 | bibtex（gbt7714）或 biber（biblatex-gb7714-2015） |
| 文档类 | ctexbook |
| 中文字体 | SimSun（宋体）、SimHei（黑体）、FangSong（仿宋）或 Fandol 替代 |
| 英文字体 | Times New Roman 或等效字体（XITS 等） |

## 项目结构

```
Thesis.tex           # 主入口文件
Style/
  ucasthesis.cls     # 文档类（页面布局、封面、章节格式、目录）
  ucasthesis.cfg     # 类配置（标签、声明文本）
  artratex.sty       # 宏包加载和文献配置
  artracom.sty       # 用户自定义命令
Tex/
  Frontinfo.tex      # 封面信息（用户编辑）
  Frontmatter.tex    # 封面生成、声明、摘要
  Prematter.tex      # 符号列表
  Mainmatter.tex     # 正文章节入口
  Appendix.tex       # 附录
  Backmatter.tex     # 致谢、作者简历、发表成果
Biblio/
  ref.bib            # 参考文献数据库
Img/
  ucas_logo.pdf      # 国科大校徽
```

## 致谢

- 原始模板 [mohuangrui/ucasthesis](https://github.com/mohuangrui/ucasthesis) 作者莫晃锐
- CASthesis 模板作者吴凌云研究员
- [CTeX](https://github.com/CTeX-org/ctex-kit) 开发团队
- 国科大学位办公室老师们的指导

## 许可证

本项目基于 GPL v3（或更高版本）开源，是 mohuangrui/ucasthesis 的衍生作品。原始版权归莫晃锐所有，修改部分版权归本仓库维护者所有。详见 [LICENSE](./LICENSE) 文件。
