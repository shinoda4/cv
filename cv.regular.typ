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
        = #box(baseline: 0.7em, image("rustacean-flat-happy.svg", height: 2em)) 林德松 Tesung Lin #box(baseline: 0.7em, image("Go.svg", height: 2em))
        == \u{f450} 中国 \u{f444} 北京
    ],
    [
        #image("me.jpg", height: 8em)
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
- *MinuteX / Readoow iOS*：基于 SwiftUI 与 gRPC 交付两款 iOS 应用；实现实时多说话人转写、可恢复摘要、录音回放、逐段编辑与声纹绑定，以及 AI 阅读、流式对话和学习成长功能。
- *LLM Gateway*：维护 Rust 多模型网关，完善 OpenAI 兼容接口、模型/渠道路由、额度计费与用量统计；接入 TTS、声音复刻及 ASR 能力，并补齐管理 OpenAPI、集成测试和错误诊断。
- *Platform Console*：基于 React / TypeScript 建设统一管理控制台，打通模型、令牌、用户、配额、调用日志与请求统计，支持分组权限、服务部署及网关问题定位。
- *sync-k8s*：参与 Go 多集群 Kubernetes 管理平台交付，将集群资源持续镜像至 PostgreSQL，并提供资源检索、日志/终端/指标及 GitOps 发布与回滚能力。

#pagebreak()
=== 北京硅基流动科技有限公司 #h(1fr) 2026/03 -- 2026/06

研发实习生 #h(1fr) 北京市海淀区

- *cce*: 开发 ComfyUI 环境管理与镜像打包系统，实现插件仓库批量克隆与依赖自动合并解析，构建 Docker 镜像，开发模型下载工具，支持多源下载与完整性校验
- *ComfyAgent*: 基于 FastAPI 开发 ComfyUI 网关，设计请求处理与输出缓存系统，支持下载与缓存
- *BizyDeploy*: 开发云函数部署 CLI，设计可复用工作流引擎，实现配置合并与自动化部署
- *BizyEngine*: 扩展 ComfyUI 服务端，开发模型/数据集管理 API 与 API Key 认证，集成第三方服务，开发对话协调功能

=== 北京百晨科技有限公司 #h(1fr) 2025/12 -- 2026/03

后端交付工程师 / 技术支持 #h(1fr) 北京市海淀区

- *技术方案与招投标*：参与政务/部队项目技术标书撰写，负责系统架构设计说明与技术可行性论证，确保技术方案满足高可靠、高安全性的业务需求。
- *私有化部署与运维*：负责系统在涉密网络/隔离环境下的私有化部署工作，涉及物理服务器环境配置、容器化（Docker）镜像迁移及数据库初始化。
- *系统稳定性保障*：负责交付后的线上故障排查与应急处理，通过编写 Shell 脚本自动化处理日志巡检与数据备份，提升现场部署效率。

=== 山东日照顺德机械配件有限公司 #h(1fr) 2023/02 -- 2024/06

后端开发工程师 #h(1fr) 山东省日照市

参与公司内部业务系统开发与长期维护，负责库存、订单与产品数据相关模块，处理真实生产数据与线上运行问题。

- *核心模块重构（Rust FFI）*： 针对高频物料库存计算导致的 Django 接口超时，使用 Rust 重新实现核心算法并封装为动态库。
- *线上故障排查与数据修复*：处理接口异常与数据不一致问题，结合应用日志与数据库记录定位错误来源，修复历史脏数据并恢复业务可用性。
- *运维部署*： 基于 Nginx 实现静态资源加速与反向代理，配合 Systemd 管理 Django 服务进程，保障了公司内部系统的可用性。

== \u{efbe} 项目经历
#style.chiline()

=== MinuteX —— AI 会议记录与知识沉淀客户端 #h(1fr) 2026/07 -- 至今
*FDE / iOS 工程师* #h(1fr) 北京维度之门科技有限公司

- 基于 SwiftUI、AVFoundation 与 gRPC 构建录音、实时多说话人转写和可恢复摘要链路，处理音频中断、后台运行、磁盘空间不足及写入失败等移动端异常场景。
- 打通逐段转写编辑、摘要再生成、声纹注册与绑定、历史搜索和分享流程；集成统一 Protobuf 契约、结构化错误诊断与 TestFlight 发布脚本。

=== LLM Gateway / Platform Console / sync-k8s —— 企业 AI 基础设施 #h(1fr) 2026/07 -- 至今
*FDE / 全栈工程师* #h(1fr) 北京维度之门科技有限公司

- 使用 Rust 构建 OpenAI 兼容的多模型接入与治理能力，覆盖模型/渠道路由、令牌、额度计费、用量聚合、调用日志，以及对话、TTS、声音复刻和 ASR 接口。
- 使用 React / TypeScript 实现网关管理台与分组权限体系，提供模型与令牌配置、额度申请、用量趋势、请求诊断和服务部署入口，形成可运营、可排障的交付闭环。
- 参与 Go + PostgreSQL Kubernetes 资源镜像与操作网关，支持 CRD 动态发现、OIDC 细粒度权限、实时运维操作，以及基于 Kustomize 的 GitOps 版本化发布与回滚。

=== AX (锈羽) —— 全栈社交媒体与内容分发系统 #h(1fr) 2023/06 -- 2024/06
*独立开发者* #h(1fr) 个人项目 (软件著作权 `2026SR0178137`)

- 构建异步后端服务，开发数据库访问与分布式会话管理，设计统一响应包装与错误处理。
- 设计数据模型与统计逻辑，维护推文热度、点赞/踩计数和用户统计一致性。
- 开发多模态文件管理与推荐功能，支持文件去重、分块传输和个性化内容排序。

== \u{e20f} 专业技能
#style.chiline()

=== 客户端与实时通信
- 熟悉 SwiftUI 状态管理、iOS 音频采集与生命周期治理；能够围绕中断恢复、后台运行和本地持久化设计稳定链路。
- 使用 Protobuf / gRPC 维护跨端契约，具备流式响应、认证状态、结构化错误和接口兼容性治理经验。

=== 后端与 AI 网关
- 使用 Rust / Python 构建异步 API 与 LLM 网关，熟悉模型路由、流式推理、额度计费、用量统计和请求诊断。
- 使用 PostgreSQL / Redis 进行数据建模与状态管理，关注事务一致性、查询性能和生产故障恢复。

=== 工程交付
- 基于 Docker / Kubernetes 完成服务部署与环境联调，使用 Shell 自动化构建、测试、发布及运行巡检。
- 结构化 AI 协作：系统拆解需求、组织上下文并驱动跨栈实现，通过测试、审查与实机验证闭环交付。

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
