# 林德松 · 网页简历

React 19 + TypeScript 6 + Vite 8，使用 Bun 管理依赖、Oxlint 检查代码。可部署到任意静态托管服务，无需服务器或数据库。

界面参考 [Tsoding](https://tsoding.github.io/) 的 `#181818` 深色背景与绿色链接，采用单栏等宽正文与普通链接；全部经历、项目直接展开，不使用卡片、模拟终端、侧栏或装饰性编号。Iosevka 的 400 / 700 字重从 `@fontsource/iosevka` 生成 WOFF2 子集随网站打包，不请求第三方字体服务。中文优先回退到更纱等宽字体，其次使用系统中文字体。默认深色，支持手动切换浅色。

## 本地开发

在简历仓库根目录执行：

```sh
cd cv
bun install --frozen-lockfile
bun run dev
```

需要 Node.js 22.18+（内容测试直接执行 TypeScript）和 Bun 1.3.14。开发地址以 Vite 输出为准。

```sh
bun run verify  # 内容一致性测试、Oxlint、TypeScript 和生产构建
bun run preview # 预览 dist/ 生产构建
```

## 内容维护

- 中文内容直接导入上级目录的 `cv.regular.typ`，英文导入 `cv-en.typ`；照片及 PDF 直接引用仓库已有文件。
- 修改简历仍遵守根目录 `AGENTS.md`，先改中文主版，再同步英文和 GNU 版，并编译 PDF。Web 工程无需重复录入经历。
- `src/content/parseResume.ts` 只支持本仓库约定的 Typst 结构。新增内联语法时须扩展解析器与测试，不支持的指令会报错。
- `src/content/labels.ts` 仅维护界面文案；经历、日期、数字和链接均来自 Typst。
- 中英切换使用 `?lang=zh` / `?lang=en`，语言和主题偏好保存在当前浏览器。

## 目录

```text
src/content/       Typst 解析、简历入口和界面翻译
src/components/    简历章节与富文本呈现
src/hooks/         语言及主题偏好
src/styles/        章节和打印样式
src/assets/fonts/  已生成的 Iosevka WOFF2 字体子集
tests/             内容完整性、中英结构一致性与模拟 DOM 交互测试
```

字体子集保留拉丁、希腊、西里尔字母、常见标点、箭头和终端框线，正常开发与构建无需 Python。仅升级字体时，安装 Bun 依赖后执行 `uv run --with fonttools --with brotli python scripts/subset-fonts.py`；原始 OFL 许可随发布产物保留在 `fonts/OFL.txt`。

## 静态发布

执行 `bun run build` 后，上传 `dist/` 的全部文件即可。Vite 使用相对资源路径，支持域名根目录以及 `/cv/` 等子目录，PDF 会随构建一起打包。

网站包含响应式布局、深浅色、中英切换、原生章节锚点、直接联系链接及键盘焦点。全部简历内容在页面中直接显示；正式投递推荐下载保留 Typst 排版的 PDF。交互测试使用 Happy DOM，不能替代真实浏览器的视觉验收。

本仓库不自动提交、不自动 push；部署由用户控制。

## GitHub Pages CI

根目录 `.github/workflows/pages.yml`：

- 面向 `main` 的 PR：安装锁定依赖，运行内容和交互测试、Oxlint、TypeScript 检查及 Vite 构建，不部署。
- `main` 有 Web 相关变更：上述检查通过后，将 `cv/dist/` 通过官方 Pages artifact 发布。
- 支持 `workflow_dispatch` 手动触发；只有 `main` 可以部署，其他分支仅检查构建。
- Node.js 24；Bun 版本读取本目录 `package.json` 的 `packageManager`；使用仓库现有 PDF 和已生成字体，不需要编译 Typst、初始化字体子模块或安装 Python。

首次启用时，在仓库 **Settings → Pages → Build and deployment → Source** 选择 **GitHub Actions**（[GitHub 官方说明](https://docs.github.com/en/pages/getting-started-with-github-pages/using-custom-workflows-with-github-pages)）。默认发布地址为 `https://shinoda4.github.io/cv/`；实际地址以成功部署任务的输出为准。
