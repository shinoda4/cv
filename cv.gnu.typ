#set document(
  title: "林德松 - GNU 风格简历",
  author: "林德松 Tesung Lin",
  keywords: ("FDE", "自由软件", "Rust", "GNU/Linux", "AI"),
)

// ---------------------------------------------------------------------------
// 版式：参照 GNU Texinfo 手册的印刷样式。
// 衬线正文、编号章节、等宽字体只用于标识符与地址；不用色块、圆角和图标。
// ---------------------------------------------------------------------------

// 拉丁字符用 Computer Modern（TeX / Texinfo 的默认字体），汉字用宋体；
// 中文弯引号按国标取全角字形（Adobe Song Std，仓库 typst-fonts 自带）
#let serif = (
  (name: "New Computer Modern", covers: regex("[^“”‘’]")),
  (name: "Adobe Song Std", covers: regex("[“”‘’]")),
  "Songti SC",
)
#let mono = ("Iosevka Curly Slab", "TX-02", "Songti SC")
#let rule-thin = 0.4pt
#let hang = 30pt // 左边距中的悬挂区宽度（章节编号、列表圆点）
#let gap = 7pt // 悬挂记号右缘到正文左边线的距离

#set page(
  paper: "a4",
  margin: (x: 1.6cm, top: 1.3cm, bottom: 1.5cm),
  numbering: "1/1",
  footer: context {
    set align(center)
    set text(size: 9pt)
    counter(page).display("1/1", both: true)
  },
)
#let body-size = 11pt
#set text(font: serif, size: body-size, lang: "zh", region: "cn")
#set par(justify: true, leading: 0.62em, spacing: 0.62em)
// 列表圆点悬挂：CM 圆点字宽 0.77em、右侧留白 0.25em；再多退 0.8pt 抵消数字
// 自身的右侧留白，使圆点墨迹右缘与章节编号右缘对齐，条目文字落在左边线上
#let bullet-out = gap + 0.8pt - 0.25em
#set list(
  marker: [•],
  indent: -(0.77em + bullet-out),
  body-indent: bullet-out,
  spacing: 0.62em,
)
// 列表整体不跨页；与粘连的标题、职位行一起，保证每个条目完整地落在同一页
#show list: it => block(breakable: false, above: 0.62em, below: 0.62em, it)


// 标识符、命令名、地址（对应 Texinfo 的 @code / @command / @url / @email）
#let tt(it) = text(font: mono, size: 0.95 * body-size, it)
#show raw.where(block: false): it => tt(it.text)

// 章节：1 / 1.1，粗体衬线，章前一条细线（对应 Texinfo HTML 的节点分隔线）。
// 编号与列表圆点都悬挂在左边距里，右缘对齐到同一条竖线；
// 标题、职位行和条目文字共用同一条左边线。
#let hang-num(num) = {
  h(-hang)
  box(width: hang - gap, align(right, num))
  h(gap)
}
#set heading(numbering: "1.1")
#show heading: it => context {
  show strong: s => s.body
  set text(weight: "bold")
  let num = if it.numbering != none { counter(heading).display(it.numbering) }
  if it.level == 1 {
    // 第 1 章紧接标题粗线，不再加分隔线
    let first = counter(heading).get().first() == 1
    block(above: 1.2em, below: 0.7em, sticky: true, width: 100%)[
      #if not first {
        line(length: 100%, stroke: rule-thin)
        v(0.15em)
      }
      #set text(size: 13pt)
      #hang-num(num)#it.body
    ]
  } else {
    block(above: 0.95em, below: 0.5em, sticky: true, width: 100%)[
      #set text(size: 11pt)
      #hang-num(num)#it.body
    ]
  }
}

// 标题右侧的日期 / 地点：常规字重
#let when(it) = text(weight: "regular", it)
// 职位行：@emph 斜体（中文无斜体，保持宋体直立）
#let role(title, place) = block(above: 0.5em, below: 0.55em, sticky: true, emph[#title #h(1fr) #place])

// ---------------------------------------------------------------------------
// 标题页（Texinfo @titlepage：书名、粗线、右对齐副标题）
// ---------------------------------------------------------------------------

#block(below: 0.9em)[
  #text(size: 22pt, weight: "bold")[林德松 Tesung Lin]
  #v(-0.35em)
  #line(length: 100%, stroke: 2pt)
  #v(-0.4em)
  #align(right, text(size: 12pt)[中国 #h(0.5em) 北京])
]

// 照片与第 1 章等高：顶端对齐章标题，底端对齐最后一行基线
#let info = [
    = 个人信息
    #grid(
      columns: (auto, auto, auto, 1fr),
      column-gutter: (0.8em, 2em, 0.8em),
      row-gutter: 0.62em,
      [手机], tt(link("tel:18763386500")[(+86) 18763386500]),
      [邮箱], tt(link("mailto:lindesong666@163.com")[lindesong666\@163.com]),
      [GitHub], tt(link("https://github.com/shinoda4")[github.com/shinoda4]),
      [个人网站], tt(link("https://desonglll.lindesong666.deno.net")[desonglll.xyz]),
    )
    #v(0.2em)
    - 认同软件自由，重视用户对程序的运行、研究、修改与分享权利
    - 偏好开放协议、可移植实现、可复现构建与文本化工程流程
    - FDE / 全栈工程师，以 AI 协作开发跨栈交付，代码保持透明、可控、可维护
]
#context {
  let gutter = 1.2em
  let guess = 2.6cm
  let body-w = page.width - 3.2cm - guess - gutter.to-absolute()
  let h = measure(block(width: body-w, info)).height
  grid(
    columns: (1fr, auto),
    column-gutter: gutter,
    info, image("assets/me.jpg", height: h),
  )
}

= GNU / 自由软件工具栈
- 系统与工具：GNU/Linux, Bash, Coreutils, Make, Git, GDB | Emacs / Vim
- 编程语言：Rust, Go, Python, TypeScript, Java | C/C++, Swift
- 开放接口：Protobuf, gRPC, REST, SSE, OpenAPI | OpenAI-compatible API
- 数据与服务：PostgreSQL, Redis | Docker, Kubernetes
- AI 协作：Claude Code, Codex, 多 Agent + Git worktree 并行开发
- 工程原则：开放标准、可移植性、可复现构建、自动化测试、最小权限
- 语言水平：大学英语 CET-6

= 教育背景
== 曲阜师范大学 软件工程 *硕士*学位（在读） #h(1fr) #when[2024/09 -- 2027/06]
- 参与一项*国家自然科学基金*项目的申请书撰写

== 曲阜师范大学 软件工程 *学士*学位 #h(1fr) #when[2020/09 -- 2024/06]

= 工作经历

== 北京维度之门科技有限公司 #h(1fr) #when[2026/07 -- 至今]
#role[FDE（Forward Deployed Engineer）][北京市]

- *AI Native 研发*：以 Claude Code / Codex 为主力工作流，用文本化的项目规范、Protobuf 契约、开发日志和针对性测试约束 AI 产出；近 4 个月在 12 个仓库提交 1,400+ 次，覆盖 iOS、Web、Go / Rust 后端与 K8s 发布。
- *产品交付*：作为 MinuteX（AI 会议纪要）核心开发者，主导 iOS 客户端并承担后端主要模块，推动产品从原型走到可上线状态；另参与 Readoow（AI 阅读）iOS 开发。
- *平台基建*：主导 LLM 网关建设，参与 K8s 多集群管理与 GitOps 发布平台；坚持配置入 Git、发布可回滚、请求可审计。

== 北京硅基流动科技有限公司 #h(1fr) #when[2026/03 -- 2026/06]
#role[研发实习生][北京市海淀区]

- *CCE*：开发 ComfyUI 环境管理与镜像打包系统，自动克隆插件仓库、合并解析依赖并构建 Docker 镜像；开发支持多源下载与完整性校验的模型获取工具，提高环境的可重建性。
- *ComfyAgent*：参与基于 FastAPI 的 ComfyUI 网关开发，负责请求处理与输出缓存，以稳定 API 隔离工作流实现细节。
- *BizyDeploy*：开发云函数部署 CLI 和可复用工作流引擎，通过文本配置合并实现可审查、可自动化的部署流程。
- *BizyEngine*：扩展 ComfyUI 服务端，开发模型/数据集管理 API 与 API Key 认证，集成第三方服务与对话协调功能。


== 山东日照顺德机械配件有限公司 #h(1fr) #when[2023/02 -- 至今]
#role[技术架构顾问 / 技术支持（长期兼职）][山东省日照市]

- *数字化系统*：作为技术架构顾问独立负责公司软件系统的架构与交付，先后完成管理后台、展示网站、Spring Boot API 与 iOS 客户端；负责需求沟通、技术选型、部署和长期运维，避免业务依赖单一封闭服务。
- *Rust FFI 重构*：针对高频库存计算导致的 Django 接口超时，使用 Rust 重写核心算法并封装为动态库，在保留现有接口的前提下改善性能。

== 北京百晨科技有限公司 #h(1fr) #when[2025/12 -- 2026/03]
#role[后端交付工程师 / 技术支持][北京市海淀区]

- 参与政务及隔离网络项目的技术方案和私有化交付，负责服务器配置、Docker 镜像迁移、数据库初始化与现场故障响应，并用 Shell 将日志巡检和数据备份做成可重复执行、可审查的自动化流程。

= 代表项目

- *MinuteX*：主导 SwiftUI iOS 客户端，完成实时多说话人转写、声纹、AI 纪要与对话，保证后台长时间录音可中断恢复；在 Go 后端基于 Buf / gRPC 契约编排转写、摘要、知识图谱三类 AI Agent，并经 GitLab CI 与 GitOps 发布到 K8s。
- *LLM Gateway*：主导 Rust（axum / SQLx）统一大模型网关，以 OpenAI / Anthropic / Gemini 兼容接口对接多家上游，统一鉴权、额度计费、请求审计与链路追踪，保留模型替换空间；配套 React 管理台。
- *平台基建*：为 #tt[sync-k8s] 多集群平台补齐细粒度 RBAC、审计日志与个人访问令牌；开发遵循 GNU 命令行约定的 Rust 工具 #tt[platformctl]，覆盖资源查询、健康检查、发布与回滚。
- *顺德机械业务平台*（#tt(link("https://github.com/ShundeMachinery")[github.com/ShundeMachinery])）：借助 AI 一人约 3 个月完成 Spring Boot（Java 25）+ PostgreSQL 后端与 React 管理端，覆盖产品目录、机型适配、库存、采购、销售与生产；开发 MCP 服务以 OAuth 让 AI 工具按权限只读查询业务数据，并构建回答附数据来源、可核验的站内 AI 问答。
- *Echo Gate*（#tt(link("https://github.com/desonglll/chat_room")[github.com/desonglll/chat_room])）：独立开发自托管团队通讯系统，Rust（axum / SQLx）服务端以房间为权限边界，支持实时消息、可续传附件和按房间授权检索的 AI 对话，可在 SQLite 与 PostgreSQL 间切换；以多 Agent + Git worktree 并行开发，两个月独立提交 400 次。
- *锈羽（Ax）*（#tt(link("https://github.com/desonglll/ax")[github.com/desonglll/ax])）：独立开发 Rust（Actix-web / SQLx）+ PostgreSQL + Vue 3 微博系统，SQL 在编译期校验，以数据库触发器保证计数与通知一致；已登记软件著作权。

= 学术与社会服务
- #text(lang: "en")[DFA-SAGE: A Dual-Fusion Aggregation Graph Sampling and Embedding Model for Enhanced Intrusion Detection]（_Computer Networks_，CCF B 类期刊，已录用）
- Official Reviewer, IJCNN 2026（WCCI，IEEE CIS flagship conference）

= 荣誉与作品

== 软件著作权
- 锈羽 - 基于 Rust 的全栈推文系统（`2026SR0178137`） #h(1fr) 2026/01
- e 和园校园服务管理平台（`2023SR0235691`） #h(1fr) 2023/02
- 党团助手 - 校园党建平台（`2023SR0137018`） #h(1fr) 2023/01

== 竞赛与综合荣誉
- 第五届中国移动“梧桐杯”数智创新大赛 - 山东赛区第二名、国赛入围 #h(1fr) 2026/02
- 第十五届全国大学生数学竞赛 - 山东赛区一等奖、国赛入围 #h(1fr) 2023/11
- 山东省优秀毕业生 | 曲阜师范大学优秀毕业生 #h(1fr) 2023 -- 2024
- 研究生学业奖学金 | 三次本科生学业奖学金 #h(1fr) 2021 -- 2024
