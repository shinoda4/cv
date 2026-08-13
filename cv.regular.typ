#import "style.typ"
#set page(
    margin: (x: 0.9cm, y: 1.3cm),
    numbering: "1/1"
)
#set text(
    font: ("Libertinus Serif", "Kaiti SC", "Symbols Nerd Font"),
    size: 12pt,          
    lang: "zh",          
    region: "cn"
)
#show heading.where(level: 1): set text(size: 22pt, font: ("Libertinus Serif", "Kaiti SC", "Symbols Nerd Font"))
#show heading.where(level: 2): set text(font: ("Libertinus Serif", "Heiti SC", "Symbols Nerd Font"))
#show heading.where(level: 3): set text(font: ("Libertinus Serif", "Kaiti SC", "Symbols Nerd Font"))

#set par(justify: true)
#show raw: set text(font: "DejaVu Sans Mono")
#show link: underline
#let p_underline(it) = {
    box(stroke: (bottom: 0.8pt + black), outset: (bottom: 3pt), it)
}
#show heading.where(level: 3): it => {
    set block(above: 0.8em, below: 0.8em)
  block(
      fill: rgb("#f6f7f9"),
      inset: (y: 5pt, x: 5pt),
      radius: 4pt,
  )[
    #box(
      stroke: (left: 3pt + rgb("#6b7280")),
      inset: (left: 4pt)
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
        == \u{f450} 中国 \u{f444} 北京
    ],
    [
        #image("assets/me.jpg", height: 8em)
    ]
)

== \u{ef69} 个人信息
#style.chiline()
#grid(columns: 2,
    gutter: 1em,
    [
        - 手机 #link("tel:18763386500")[(+86) 18763386500]
        - 邮箱 #link("mailto:lindesong666\@163.com")[lindesong666\@163.com]
        - Github #link("https://github.com/shinoda4")[github.com/shinoda4]
        - 个人网站 #link("https://desonglll.lindesong666.deno.net")[desonglll.xyz]
    ],
    [ 
        - FDE / 全栈工程师，负责 AI 产品从需求澄清到生产交付
        - 擅长结构化 AI 协作开发（Vibe Coding），具备跨技术栈快速交付能力
        - 熟悉 gRPC、LLM 网关、容器化部署与生产问题诊断
    ]

)

== \u{efcc} 技术栈
#style.chiline()
- 编程语言：Rust, Python, TypeScript, Go | Swift（AI 辅助 / Vibe Coding）
- 客户端 / Web：SwiftUI, React | gRPC, REST, SSE
- 数据库：PostgreSQL, Redis
- AI 工程：LLM 网关、模型路由、流式推理 | 结构化 AI 协作
- 工程工具：Docker, Kubernetes, Git, Shell | macOS, Linux
- 语言水平：大学英语 CET-6

== \u{ef23} 教育背景
#style.chiline()
=== 曲阜师范大学 软件工程 *硕士*学位（在读） #h(1fr) 2024/09 -- 2027/06
- #p_underline()[*Official Reviewer 审稿人*]，国际神经网络联合会议（IJCNN 2026，WCCI，IEEE 计算智能学会）
- 参与一项#p_underline()[*国家自然科学基金*]项目的申请书撰写
- 课程：软件体系结构、软件建模与需求工程、分布式系统、深度学习
=== 曲阜师范大学 软件工程 *学士*学位 #h(1fr) 2020/09 -- 2024/06
- 课程：C/C++、数据结构、计算机组成原理、操作系统、计算机网络
- 曾担任学院团委学生会#p_underline()[*副主席*]兼组织部部长

== \u{f0b1} 工作经历
#style.chiline()

=== 北京维度之门科技有限公司 #h(1fr) 2026/07 -- 至今

FDE（Forward Deployed Engineer） #h(1fr) 北京市

- *AI 产品端到端交付*：面向会议记录与智能阅读场景，将业务需求拆解为客户端、API 契约、网关和管理后台能力，负责方案设计、开发联调、测试发布与线上问题闭环。
- *AI 客户端产品*：主力交付 MinuteX iOS / macOS 与 Readoow iOS，覆盖实时转写、会议纪要、声纹、AI 阅读和流式对话，并推动共享 Protobuf 契约在多端落地。
- *平台与交付工具*：参与 Rust LLM 网关、React 管理台、Go 平台服务和 Kubernetes 运维系统建设，补齐模型接入、权限、镜像管理、部署及故障排查链路。

#pagebreak()
=== 北京硅基流动科技有限公司 #h(1fr) 2026/03 -- 2026/06

研发实习生 #h(1fr) 北京市海淀区

- *cce*: 开发 ComfyUI 环境管理与镜像打包系统，实现插件仓库批量克隆与依赖自动合并解析，构建 Docker 镜像，开发模型下载工具，支持多源下载与完整性校验
- *ComfyAgent*: 基于 FastAPI 开发 ComfyUI 网关，设计请求处理与输出缓存系统，支持下载与缓存
- *BizyDeploy*: 开发云函数部署 CLI，设计可复用工作流引擎，实现配置合并与自动化部署
- *BizyEngine*: 扩展 ComfyUI 服务端，开发模型/数据集管理 API 与 API Key 认证，集成第三方服务，开发对话协调功能

=== 北京百晨科技有限公司 #h(1fr) 2025/12 -- 2026/03

后端交付工程师 / 技术支持 #h(1fr) 北京市海淀区

- 参与政务/部队项目技术方案编写与隔离环境私有化交付，完成服务器配置、Docker 镜像迁移及数据库初始化。
- 承担现场技术支持与故障响应，使用 Shell 自动化日志巡检和数据备份。

=== #link("https://github.com/ShundeMachinery/")[山东日照顺德机械配件有限公司] #h(1fr) 2023/02 -- 至今

技术支持（长期兼职） #h(1fr) 山东省日照市

- *产品目录平台*：独立完成产品管理后台、产品展示网站、Spring Boot API 与 iOS 客户端，负责需求沟通、全栈开发、部署及长期技术支持。
- *核心业务能力*：围绕工程机械配件建立产品、机型与适配关系数据模型，实现搜索筛选、图片管理、权限控制及 PostgreSQL 数据备份恢复。
- *核心模块重构（Rust FFI）*：针对高频物料库存计算导致的 Django 接口超时，使用 Rust 重写核心算法并封装为动态库。

== \u{efbe} 项目经历
#style.chiline()

=== MinuteX / Readoow —— AI 会议与阅读客户端 #h(1fr) 2026/07 -- 至今
*FDE / 客户端工程师* #h(1fr) 北京维度之门科技有限公司

- 主力开发 MinuteX iOS / macOS 与 Readoow iOS：完成录音、实时多说话人转写、可恢复摘要、声纹，以及 AI 阅读、流式对话和学习成长等核心流程。
- 使用 SwiftUI、AVFoundation 与 gRPC 打通共享 Protobuf 契约和后端联调；重点处理音频中断、后台运行、数据恢复、接口升级及 TestFlight 发布等工程问题。

=== LLM Gateway / Console / Image Hub —— AI 平台工具 #h(1fr) 2026/07 -- 至今
*FDE / 全栈工程师* #h(1fr) 北京维度之门科技有限公司

- 扩展 Rust LLM 网关，接入多家模型的对话、翻译、TTS、声音复刻和 ASR 能力，并完善渠道选择、额度统计、调用日志、错误诊断及 OpenAI 兼容接口。
- 使用 React / TypeScript 与 Go 交付管理台和平台接口，完成模型、令牌、管理员、细粒度权限及镜像仓库管理，让配置、发布和问题定位能在同一入口完成。

#pagebreak()
=== sync-k8s / Deploy CLI —— Kubernetes 交付工具 #h(1fr) 2026/07 -- 至今
*FDE / 工程工具开发* #h(1fr) 北京维度之门科技有限公司

- 参与 Go 多集群资源平台，完善用户组及资源级权限、审计和管理端接入；系统将集群资源同步至 PostgreSQL，并提供检索、日志、指标与 GitOps 发布能力。
- 主力开发 Rust 命令行工具，覆盖资源查询、日志与事件查看、健康监控、发布预检、批量部署和回滚，便于在终端完成日常发布与故障排查。

=== #link("https://github.com/desonglll/FocusBoard")[FocusBoard] —— macOS 智能任务管理工具 #h(1fr) 2026/08
*独立开发者* #h(1fr) 个人项目

- 使用原生 SwiftUI 构建三栏任务工作区，可从自然语言提取时间、优先级和执行步骤；支持 OpenAI 兼容服务，并在 AI 不可用时自动回退到本地规则。
- 坚持本地优先：API Key 存入钥匙串，任务数据具备版本备份和损坏恢复，并为解析、状态流转、配置迁移及持久化补充回归测试。

== \u{e20f} 专业技能
#style.chiline()

- *客户端与通信*：SwiftUI、iOS 音频与生命周期治理；Protobuf / gRPC 跨端契约、流式响应、认证与兼容性处理。
- *后端与数据*：Rust / Python 异步 API 与 LLM 网关；PostgreSQL / Redis 数据建模、状态管理和故障恢复。
- *工程交付*：Docker / Kubernetes 环境联调，Shell 自动化构建与发布；使用结构化 AI 协作加快跨栈实现，并通过测试、审查和实机验证结果。

== \u{ed99} 学术与社会服务
#style.chiline()
- DFA-SAGE: A Dual-Fusion Aggregation Graph Sampling and Embedding Model for Enhanced Intrusion Detection, (Computer Networks 大修中...)
- Official Reviewer, IJCNN 2026 (WCCI, IEEE CIS flagship conference)

== \u{f091} 竞赛荣誉
#style.chiline()

=== \u{ebe9} 软件著作权
- 锈羽——基于Rust的全栈推文系统 (`2026SR0178137`) #h(1fr) 2026/01
- e和园校园服务管理平台 (`2023SR0235691`) #h(1fr) 2023/02
- 党团助手——校园党建平台 (`2023SR0137018`) #h(1fr) 2023/01

=== \u{ee22} 竞赛获奖
- 第五届中国移动“梧桐杯”数智创新大赛 #sym.dot.op 山东赛区第二名 (国赛入围) #h(1fr) 2026/02
- 第十五届全国大学生数学竞赛 #sym.dot.op 山东赛区一等奖 (国赛入围) #h(1fr) 2023/11
- 第二十届山东省大学生软件设计大赛 #sym.dot.op 省二等奖 (党团助手项目) #h(1fr) 2022/11
- 第二十届山东省大学生软件设计大赛 #sym.dot.op 省二等奖 (济续游宁项目) #h(1fr) 2022/11
- 第十九届山东省大学生软件设计大赛 #sym.dot.op 省二等奖 (党帮帮项目) #h(1fr) 2021/11

=== \u{f1a82} 综合荣誉
- 2024届山东省优秀毕业生 | 曲阜师范大学优秀毕业生 #h(1fr) 2023 -- 2024
- 研究生学业奖学金 (2024) | 本科生学业奖学金 (2021, 2022, 2023) #h(1fr) 2021 -- 2024
