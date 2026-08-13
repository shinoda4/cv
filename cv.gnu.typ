#import "style.typ"

#set document(
  title: "林德松 - GNU 风格简历",
  author: "林德松 Tesung Lin",
  keywords: ("FDE", "自由软件", "Rust", "GNU/Linux", "AI"),
)

#set page(
  margin: (x: 0.9cm, y: 1.3cm),
  numbering: "1/1",
)
#set text(
  font: ("Libertinus Serif", "Kaiti SC", "Symbols Nerd Font"),
  size: 11pt,
  lang: "zh",
  region: "cn",
)
#show heading.where(level: 1): set text(
  size: 22pt,
  font: ("Libertinus Serif", "Kaiti SC", "Symbols Nerd Font"),
)
#show heading.where(level: 2): set text(
  font: ("Libertinus Serif", "Heiti SC", "Symbols Nerd Font"),
)
#show heading.where(level: 3): set text(
  font: ("Libertinus Serif", "Kaiti SC", "Symbols Nerd Font"),
)

#set par(justify: true)
#show raw: set text(font: "DejaVu Sans Mono")
#show link: underline

#let p-underline(it) = {
  box(stroke: (bottom: 0.8pt + black), outset: (bottom: 3pt), it)
}

#show heading.where(level: 3): it => {
  set block(above: 0.6em, below: 0.6em)
  block(
    fill: rgb("#f6f7f9"),
    inset: (y: 4pt, x: 5pt),
    radius: 4pt,
  )[
    #box(
      stroke: (left: 3pt + rgb("#6b7280")),
      inset: (left: 4pt),
    )[
      #set text(weight: "semibold")
      #it.body
    ]
  ]
}

#grid(
  columns: (1fr, auto, auto),
  gutter: 1em,
  align: (left + horizon, right + horizon, right + horizon),
  [
    = #box(baseline: 0.7em, image("assets/rustacean-flat-happy.svg", height: 2em)) 林德松 Tesung Lin #box(baseline: 0.7em, image("assets/Go.svg", height: 2em))
    ==  中国  北京
  ],
  [#image("assets/me.jpg", height: 8em)],
)

==  个人信息
#style.chiline()
#grid(
  columns: 2,
  gutter: 1em,
  [
    - 手机 #link("tel:18763386500")[(+86) 18763386500]
    - 邮箱 #link("mailto:lindesong666@163.com")[lindesong666\@163.com]
    - GitHub #link("https://github.com/shinoda4")[github.com/shinoda4]
    - 个人网站 #link("https://desonglll.lindesong666.deno.net")[desonglll.xyz]
  ],
  [
    - 认同软件自由，重视用户对程序的运行、研究、修改与分享权利
    - 偏好开放协议、可移植实现、可复现构建与文本化工程流程
    - FDE / 全栈工程师，让 AI 产品既能交付，也保持透明、可控、可维护
  ],
)

==  GNU / 自由软件工具栈
#style.chiline()
- 系统与工具：GNU/Linux, Bash, Coreutils, Make, Git, GDB | Emacs / Vim
- 编程语言：Rust, Python, TypeScript, Go | C/C++, Swift
- 开放接口：Protobuf, gRPC, REST, SSE, OpenAPI | OpenAI-compatible API
- 数据与服务：PostgreSQL, Redis | Docker, Kubernetes
- 工程原则：开放标准、可移植性、可复现构建、自动化测试、最小权限
- 语言水平：大学英语 CET-6

==  教育背景
#style.chiline()
=== 曲阜师范大学 软件工程 *硕士*学位（在读） #h(1fr) 2024/09 -- 2027/06
- #p-underline()[*Official Reviewer 审稿人*]，国际神经网络联合会议（IJCNN 2026，WCCI，IEEE 计算智能学会）
- 参与一项#p-underline()[*国家自然科学基金*]项目的申请书撰写
- 课程：软件体系结构、软件建模与需求工程、分布式系统、深度学习

=== 曲阜师范大学 软件工程 *学士*学位 #h(1fr) 2020/09 -- 2024/06
- 课程：C/C++、数据结构、计算机组成原理、操作系统、计算机网络
- 曾任学院团委学生会#p-underline()[*副主席*]兼组织部部长

==  工作经历
#style.chiline()

=== 北京维度之门科技有限公司 #h(1fr) 2026/07 -- 至今
FDE（Forward Deployed Engineer） #h(1fr) 北京市

- *可控的 AI 产品交付*：面向会议记录与智能阅读场景，将需求拆解为客户端、开放 API 契约、网关和管理后台；坚持数据可导出、状态可恢复、错误可诊断，负责设计、开发、测试、发布与线上闭环。
- *AI 客户端产品*：主力交付 MinuteX iOS / macOS 与 Readoow iOS，覆盖实时转写、可恢复摘要、声纹、AI 阅读和流式对话，并推动共享 Protobuf 契约在多端落地。
- *平台与交付工具*：参与 Rust LLM 网关、React 管理台、Go 平台服务和 Kubernetes 工具建设，补齐模型接入、权限、镜像管理、部署及故障排查链路。

#pagebreak()

=== 北京硅基流动科技有限公司 #h(1fr) 2026/03 -- 2026/06
研发实习生 #h(1fr) 北京市海淀区

- *CCE*：开发 ComfyUI 环境管理与镜像打包系统，自动克隆插件仓库、合并解析依赖并构建 Docker 镜像；开发支持多源下载与完整性校验的模型获取工具，提高环境的可重建性。
- *ComfyAgent*：基于 FastAPI 开发 ComfyUI 网关，以稳定 API 隔离工作流实现细节，并设计请求处理与输出缓存。
- *BizyDeploy*：开发云函数部署 CLI 和可复用工作流引擎，通过文本配置合并实现可审查、可自动化的部署流程。
- *BizyEngine*：扩展 ComfyUI 服务端，开发模型/数据集管理 API 与 API Key 认证，集成第三方服务与对话协调功能。

=== 北京百晨科技有限公司 #h(1fr) 2025/12 -- 2026/03
后端交付工程师 / 技术支持 #h(1fr) 北京市海淀区

- 参与政务及隔离网络项目的技术方案和私有化交付，完成服务器配置、Docker 镜像迁移与数据库初始化，保证系统可在受限网络中独立运行。
- 承担现场支持与故障响应，使用 Shell 将日志巡检和数据备份转化为可重复执行、可审查的自动化流程。

=== #link("https://github.com/ShundeMachinery/")[山东日照顺德机械配件有限公司] #h(1fr) 2023/02 -- 至今
技术支持（长期兼职） #h(1fr) 山东省日照市

- *产品目录平台*：独立交付管理后台、展示网站、Spring Boot API 与 iOS 客户端；负责需求沟通、全栈开发、部署、数据备份和长期技术支持，避免业务依赖单一封闭服务。
- *开放的数据模型*：围绕工程机械配件建立产品、机型与适配关系，以 PostgreSQL 保存核心业务数据，并提供搜索、图片管理、权限控制及备份恢复。
- *Rust FFI 重构*：针对高频库存计算导致的 Django 接口超时，使用 Rust 重写核心算法并封装为动态库，在保留现有接口的前提下改善性能。

==  代表项目
#style.chiline()

- *MinuteX / Readoow*：使用 SwiftUI、AVFoundation 与 gRPC 交付 iOS / macOS 客户端，完成录音转写、可恢复摘要、声纹、AI 阅读和流式对话，并处理后台运行、数据恢复与契约升级。
- *LLM Gateway / Console / Image Hub*：扩展 Rust 多模型网关，并使用 React / TypeScript 与 Go 完成模型、令牌、权限和镜像管理，采用 OpenAI 兼容接口保留模型替换空间。
- *sync-k8s / Deploy CLI*：参与 Go 多集群资源平台，主力开发 Rust CLI，覆盖细粒度权限、资源检索、日志与健康监控、发布预检、GitOps 部署和回滚。
- *#link("https://github.com/desonglll/FocusBoard")[FocusBoard]*：独立开发本地优先的 macOS 任务工具，以本地规则和可选 AI 整理自然语言输入；API Key 存入钥匙串，数据支持备份恢复并配有回归测试。

==  学术与社会服务
#style.chiline()
- DFA-SAGE: A Dual-Fusion Aggregation Graph Sampling and Embedding Model for Enhanced Intrusion Detection（Computer Networks 大修中）
- Official Reviewer, IJCNN 2026（WCCI，IEEE CIS flagship conference）

==  荣誉与作品
#style.chiline()

===  软件著作权
- 锈羽 - 基于 Rust 的全栈推文系统（`2026SR0178137`） #h(1fr) 2026/01
- e 和园校园服务管理平台（`2023SR0235691`） #h(1fr) 2023/02
- 党团助手 - 校园党建平台（`2023SR0137018`） #h(1fr) 2023/01

===  竞赛与综合荣誉
- 第五届中国移动“梧桐杯”数智创新大赛 - 山东赛区第二名、国赛入围 #h(1fr) 2026/02
- 第十五届全国大学生数学竞赛 - 山东赛区一等奖、国赛入围 #h(1fr) 2023/11
- 山东省优秀毕业生 | 曲阜师范大学优秀毕业生 #h(1fr) 2023 -- 2024
- 研究生学业奖学金 | 三次本科生学业奖学金 #h(1fr) 2021 -- 2024
