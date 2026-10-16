# 简历仓库协作约定

本仓库是林德松（Tesung Lin）的 Typst 简历。改简历前先读完本文件。

## 1. 文件与定位

| 文件 | 定位 | 页数上限 |
|---|---|---|
| `cv.regular.typ` | 中文主版，**内容的单一真相源** | 3 |
| `cv-en.typ` | 英文版，与主版逐节、逐条一一对应 | 3 |
| `cv.gnu.typ` | GNU 风格中文精简版（Texinfo 手册版式） | 2 |

- `style.typ`：regular / en 共用的版式模板 `resume()`，以及配色、间距和辅助函数（`icon()`、`contact()`、`repo()`、`role()`、`location()`）。字号、行距、间距只在这里定义，改它会同时影响这两版，必须一起验证。GNU 版的样式全部内联在自己文件里。
- `assets/`：照片（Rust / Go 吉祥物素材已不再使用）；`fonts/` 与 `typst-fonts/`（submodule）：字体。
- PDF 入库。改了 `.typ` 就重新编译对应 PDF，和源文件一起提交。
- `resume.tex` 是旧产物，不维护；`tmp/` 只放本地预览图，不入库。

## 2. 构建与自查

```sh
just build        # 编译三版
just build-zh     # 只编中文主版（build-en / build-gnu 同理）
```

`justfile` 已设置 `TYPST_FONT_PATHS=fonts:typst-fonts`。直接调 typst 时要手动带上：

```sh
TYPST_FONT_PATHS=fonts:typst-fonts typst compile cv.regular.typ tmp/preview/reg-{p}.png --ppi 80
```

预览图统一放在 `tmp/preview/`（已被 `.gitignore` 忽略）。

改完必须渲染 PNG 逐页看，确认：

- 页数不超过上表上限；
- 没有条目被拆到两页（三版都由样式自动整块换页，**不要手写 `#pagebreak()`**）；页尾不留大片空白；
- 中文没有回退到奇怪字体，日期右对齐、缩进一致。

## 3. 三版同步规则

1. 改内容先改 `cv.regular.typ`，再同步到 `cv-en.typ` 和 `cv.gnu.typ`。
2. **事实三版必须一致**：公司、职位、起止时间、数字指标、链接、论文状态。
3. 英文版与主版结构一一对应，逐条翻译，不增不减。
4. GNU 版是精简版，**允许**：每个项目压成一条，放在「代表项目」；用「GNU / 自由软件工具栈」代替「专业技能」；只保留重点奖项；个人信息和工具栈用 GNU / 自由软件取向的表述。**不允许**：写出主版没有的事实。
5. 结构核对命令（每节的条目数一目了然）。regular 和 en 的输出应完全对应；GNU 版标题层级不同（`=` / `==`），只核对事实：

```sh
for f in cv.regular.typ cv-en.typ cv.gnu.typ; do echo "## $f"; awk '/^==/{h=$0; sub(/#h\(1fr\).*/,"",h); printf "\n%s :", substr(h,1,60); next} /^ *- /{printf " •"}' $f; echo; done
```

## 4. 内容风格

**总基调：克制，但要有水平。** 让读者在几秒内看到「做成了什么、难在哪、怎么做到的」。

- 每段经历 2–3 条，每条一句话：*做了什么 + 用什么技术 + 结果或价值*。
- 不写细枝末节：接口名、字段名、迁移编号、具体类名、零碎 bug 修复都不进简历。
- 条目格式：`- *关键词*：正文`。中英文之间留空格，中文用全角标点，技术名保留英文原名。
- **突出「人 + AI」开发能力**：Claude Code / Codex 是主力工作流；强调用项目规范、契约、测试和开发日志约束 AI 产出，交付快且代码可维护。用**一个**可信的量化指标佐证（提交数、交付周期、一天上线等），不要堆数字。
- 措辞按真实贡献分级，从高到低：**主导**（大部分提交 / 核心设计）＞ **核心开发者** ＞ **参与开发**。别人搭建的东西不写成自己的，例如 Apollo 配置中心、sync-k8s 主体都是同事搭建的。
- 禁用：Vibe Coding、精通、赋能、极致、颠覆、「一个人负责全部」这类无法核实或夸大的说法。
- 职位、头衔以用户给定为准。顺德：技术架构顾问 / 技术支持（长期兼职）；维度之门：FDE（Forward Deployed Engineer）。
- 论文：DFA-SAGE，Computer Networks，CCF B 类期刊，已录用。

### 版块顺序（regular / en）

个人信息 → 专业技能（技术栈与技能已合并为一节）→ 教育背景 → 工作经历 → 项目经历 → 学术与社会服务 → 竞赛荣誉。

- 工作经历按时间倒序：维度之门 → 硅基流动 → 顺德 → 百晨（顺德是长期兼职，放在百晨上面）。
- 项目经历：先公司项目（MinuteX → LLM Gateway → 平台基建 → 顺德业务平台），再个人项目（Echo Gate → 锈羽 Ax）。
- 标题旁不放吉祥物，只保留照片。
- 链接：个人 GitHub `github.com/shinoda4`；顺德业务平台 `github.com/ShundeMachinery`（链接只挂在项目上，公司名不加链接）；Echo Gate `github.com/desonglll/chat_room`；锈羽 Ax `github.com/desonglll/ax`。

### 不写进简历的内容

以下内容已经评估过、决定不写，除非用户主动要求：

- 课程列表、学生会经历；IJCNN 审稿人只在「学术与社会服务」写一次，教育背景里不重复。
- 小型或贡献占比低的个人项目：FocusBoard、HandleMBTI（本人约 20% 提交）、Rigel / rigel-sender、templates、skye、qr_workshop、pentos、translate.el、Emacs 配置。
- 维度之门里不是本人主导的部分：Apollo 配置中心（同事部署和接入）、Image Hub（本人 1 次提交）、macOS 客户端（工程里只有 iOS）。
- 省软件设计大赛的 3 个省二等奖合并成一行，不逐个列项目名。

## 5. 事实核验

写或改经历前先看代码仓库，不凭印象。

1. 读 README、AGENTS.md、docs，弄清系统是什么、用了什么技术栈。
2. 用 git 统计本人贡献。本人的提交身份有：`desonglll`、`Mike Shinoda`、`林德松`、`LIN DESONG`。

   ```sh
   git -C <repo> log --all --no-merges --author='desong\|Shinoda\|林德松' -i --oneline | wc -l
   git -C <repo> log --all --format='%an' | sort | uniq -c | sort -rn | head   # 看谁是主要作者
   git -C <repo> log --all --reverse --format='%ad %an %s' --date=short | head # 看是不是从 0 到 1
   ```

3. 资料来源：
   - 维度之门：`/Volumes/Tuo-APFS/workspace/minutex/`（ios、backend、web、signboard、buf、kg_agent、multimodal_agent、summary_agent）、`/Volumes/Tuo-APFS/workspace/platform/`（llm-gateway、console、sync-k8s、k8sapps）、`/Volumes/Tuo-APFS/workspace/deploy_cli`（platformctl）。
   - 顺德：`/Volumes/Tuo-APFS/shunde-dev/platform/`（api、web-react、api-mcp、api-ai、index、db）。
   - 个人项目：`/Volumes/Tuo-APFS/workspace/chat_room`（Echo Gate）、`/Volumes/Tuo-APFS/workspace/ax`（锈羽）。
   - 硅基流动：`/Volumes/Tuo-APFS/workspace/cce`、`BizyDeploy`、`bizyengine`；`comfyagent` 本地没有本人提交，所以措辞为「参与」。
4. 现有指标的口径，更新时按同一口径重算：
   - 维度之门「近 4 个月 12 个仓库 1,400+ 次提交」：上面 minutex 8 个仓库加 platform 4 个仓库，本人非 merge 提交合计。截至 2026-10-16 为 1,469 次。
   - 顺德「一人约 3 个月」：platform 下各仓库 2026-07 至 2026-10 的提交全部来自本人。
   - Echo Gate「两个月独立提交 400 次」：chat_room 本人非 merge 提交，首次提交 2026-08-14，截至 2026-10-16 为 400 次。

## 6. Typst 注意事项

- 邮箱里的 `@` 要写成 `\@`；右对齐日期用 `#h(1fr)`；强调用 `*粗体*`。
- 两版共用的版式只改 `style.typ`；只有某一版用到的小样式（如中文版强调用的 `p_underline`）才内联在该版文件里。

### regular / en 的版式与写法

- 文件开头固定为 `#import "style.typ"` 和 `#show: style.resume.with(lang: "zh")`（英文版用 `"en"`），不要在单个文件里重新设置页面、字号、标题样式。
- 正文 11pt；中文行距 0.72em，英文 0.6em。节标题下的细线由模板绘制，不要再加分隔线。
- 条目写法：

  ```typst
  === 公司或项目名 #h(1fr) 2026/07 -- 至今
  #style.role[职位][地点 / 所属单位]

  - *关键词*：正文
  ```

- 左侧窄列放条目标题的竖条和列表圆点；标题文字、职位行、条目正文共用同一条左边线；日期、地点、正文共用同一条右边线。
- 垂直节奏：标题 → 职位行最紧（0.45em），职位行 → 条目稍松（0.9em），条目之间等于行距，条目结束 → 下一个标题 1em，节与节之间 1.25em。要调整就改 `style.typ` 里的数值，不要在正文里插 `#v()`。
- 条目标题、职位行都粘连到后面的内容，列表不可拆分，所以条目会自动整块换页。

### regular / en 的链接与图标

- 链接不加下划线，统一用 `style.accent`（低饱和蓝）：`#show link: set text(fill: style.accent)`。
- 图标只用 Symbols Nerd Font 里的 Font Awesome 一套，统一灰色，一律通过 `#style.icon("\u{...}")` 引用，不要直接写码位。
- 节标题图标：个人信息 `f007`、专业技能 `f121`、教育背景 `f19d`、工作经历 `f0b1`、项目经历 `f07c`、学术 `f02d`、荣誉 `f091`；所在地 `f041`。新增节时从同一套里挑语义贴切的图标。
- 三级小标题不放图标。
- 联系方式用 `#style.contact(图标, link(...))`：电话 `f095`、邮箱 `f0e0`、GitHub `f09b`、网站 `f0ac`。
- 项目仓库写在三级标题里，放在标题后、日期前：`=== 项目名 —— 副标题 #style.repo("https://github.com/x/y", "x/y") #h(1fr) 日期`。

### GNU 版样式规范（`cv.gnu.typ`）

参照 GNU Texinfo 手册的印刷版式，克制、朴素：

- 字体：拉丁字符用 New Computer Modern（TeX / Texinfo 默认），汉字用宋体；等宽字体只用于命令、标识符、地址。
- 标题：自动编号（`1` / `1.1`），粗体衬线；一级标题前一条细线；编号与列表圆点悬挂在左边距，正文共用同一条左边线。
- 不用色块、圆角、图标、吉祥物；照片保留，与「个人信息」一节等高。
- 写法：一级用 `=`、二级用 `==`（不要用 `===`）；日期用 `#h(1fr) #when[...]`；职位行用 `#role[职位][地点]`；命令和标识符用 `` #tt[...] `` 或反引号。
- 链接按 Texinfo `@url` 的惯例：等宽字体，不着色、不加下划线；项目仓库写成 `*项目名*（#tt(link(url)[github.com/x/y])）：`。
- 列表整体不跨页，标题与职位行和后面的条目粘连；改完仍要看图确认没有大片空白。

## 7. Git

- 用户说「commit」才提交，**永远不要 push**。
- 提交内容包括 `.typ` 和对应的 PDF。commit message 简短说明改了哪段经历。

## 8. 常用提示词

复制后把 `<>` 换成实际内容。

**新增一段经历 / 项目**

```text
新增经历：<公司>，<职位>，<起止时间>，<城市>。代码在 <路径>，我负责 <一句话>。
按 AGENTS.md 先核对 git 贡献再写，放在 <位置>，三版同步，编译后看图自查。
```

**更新已有项目**

```text
更新 <项目> 的条目：最近做了 <新内容>，代码在 <路径>。保持 2–3 条，替换最弱的一条，三版同步。
```

**删除或调整顺序**

```text
去掉 <条目>；把 <A> 移到 <B> 上面。三版同步，检查分页。
```

**更新状态或头衔**

```text
<论文 / 项目 / 职位> 改为 <新状态>，三版同步。
```

**针对岗位定制**

```text
按这个 JD 出一版定制简历：<JD>。只调整个人简介、技术栈顺序和条目侧重，不新增事实；
另存为 cv.<公司>.typ，不改三版主简历。
```

**一致性检查**

```text
检查三版简历是否同步：列出事实不一致和条目缺失（GNU 版按规则精简的不算问题）。
```

**样式调整**

```text
<版本> 的 <元素> 改成 <效果>。只改样式不改文字，编译后看图确认页数和对齐。
```
