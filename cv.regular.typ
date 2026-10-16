#import "style.typ"
#show: style.resume.with(lang: "zh")

#let p_underline(it) = {
    box(stroke: (bottom: 0.8pt + black), outset: (bottom: 3pt), it)
}
#grid(
    columns: (1fr, auto, auto),
    gutter: 1em,
    align: (left + horizon, right + horizon, right + horizon),
    [
        = 林德松 Tesung Lin
        #style.location[中国 · 北京]
    ],
    [
        #image("assets/me.jpg", height: 8em)
    ]
)

== #style.icon("\u{f007}") 个人信息
#grid(columns: 2,
    gutter: 1em,
    [
        #style.contact("\u{f095}", link("tel:18763386500")[(+86) 18763386500]) \
        #style.contact("\u{f0e0}", link("mailto:lindesong666@163.com")[lindesong666\@163.com]) \
        #style.contact("\u{f09b}", link("https://github.com/shinoda4")[github.com/shinoda4]) \
        #style.contact("\u{f0ac}", link("https://desonglll.lindesong666.deno.net")[desonglll.xyz])
    ],
    [ 
        - FDE / 全栈工程师，在 AI Native 团队负责产品从 0 到 1 交付
        - 深度使用 Claude Code / Codex，一人覆盖客户端、后端、网关与部署
        - 注重工程规范：契约先行、文档沉淀、针对性验证、可回滚发布
    ]

)

== #style.icon("\u{f121}") 专业技能
- *AI 协作开发*：以 Claude Code / Codex 为主力工作流，把需求拆成可独立验证的小任务，用多 Agent + worktree 并行推进；以项目规范、契约和测试约束 AI 产出，交付快且代码可维护、可扩展。
- *后端与数据*：Go、Rust（axum / SQLx）、Java（Spring Boot）、Python（FastAPI）、Node.js；PostgreSQL、Redis 数据建模与故障恢复。
- *客户端与通信*：React / TypeScript、SwiftUI；以 gRPC / Protobuf 统一多端契约，熟悉 REST、SSE、WebSocket。
- *基础设施*：Docker、Kubernetes、GitLab CI、GitOps 发布与回滚，借助 OpenTelemetry 与结构化日志定位线上问题。
- *AI 工程*：LLM 网关、多模型路由与计费、流式推理与实时 ASR、MCP 服务。
- *语言*：大学英语 CET-6

== #style.icon("\u{f19d}") 教育背景
=== 曲阜师范大学 软件工程 *硕士*学位（在读） #h(1fr) 2024/09 -- 2027/06
- 参与一项#p_underline()[*国家自然科学基金*]项目的申请书撰写
=== 曲阜师范大学 软件工程 *学士*学位 #h(1fr) 2020/09 -- 2024/06

== #style.icon("\u{f0b1}") 工作经历

=== 北京维度之门科技有限公司 #h(1fr) 2026/07 -- 至今
#style.role[FDE（Forward Deployed Engineer）][北京市]

- *AI Native 研发*：以 Claude Code / Codex 为主力工作流，用项目规范、Protobuf 契约、开发日志和针对性测试约束 AI 产出；近 4 个月在 12 个仓库提交 1,400+ 次，覆盖 iOS、Web、Go / Rust 后端与 K8s 发布。
- *产品交付*：作为 MinuteX（AI 会议纪要）核心开发者，主导 iOS 客户端并承担后端主要模块，推动产品从原型走到可上线状态；另参与 Readoow（AI 阅读）iOS 开发。
- *平台基建*：主导 LLM 网关建设，参与 K8s 多集群管理与 GitOps 发布平台，为团队提供统一的模型接入、计费审计与发布能力。

=== 北京硅基流动科技有限公司 #h(1fr) 2026/03 -- 2026/06
#style.role[研发实习生][北京市海淀区]

- *CCE*：开发 ComfyUI 环境管理与镜像打包系统，实现插件仓库批量克隆与依赖自动合并解析，构建 Docker 镜像，开发模型下载工具，支持多源下载与完整性校验。
- *ComfyAgent*：参与基于 FastAPI 的 ComfyUI 网关开发，负责请求处理与输出缓存。
- *BizyDeploy*：开发云函数部署 CLI，设计可复用工作流引擎，实现配置合并与自动化部署。
- *BizyEngine*：扩展 ComfyUI 服务端，开发模型/数据集管理 API 与 API Key 认证，集成第三方服务，开发对话协调功能。

=== 山东日照顺德机械配件有限公司 #h(1fr) 2023/02 -- 至今
#style.role[技术架构顾问 / 技术支持（长期兼职）][山东省日照市]

- *数字化系统*：作为技术架构顾问独立负责公司软件系统的架构与交付，先后完成产品管理后台、展示网站、Spring Boot API 与 iOS 客户端，负责需求沟通、技术选型、部署及长期运维。
- *核心模块重构（Rust FFI）*：针对高频物料库存计算导致的 Django 接口超时，使用 Rust 重写核心算法并封装为动态库。

=== 北京百晨科技有限公司 #h(1fr) 2025/12 -- 2026/03
#style.role[后端交付工程师 / 技术支持][北京市海淀区]

- 参与政务/部队项目的技术方案编写与隔离网络私有化交付，负责服务器配置、Docker 镜像迁移、数据库初始化及现场故障响应，并用 Shell 自动化日志巡检与数据备份。

== #style.icon("\u{f07c}") 项目经历

=== MinuteX —— AI 会议纪要产品 #h(1fr) 2026/07 -- 至今
#style.role[核心开发者（iOS / 后端 / Web / 部署）][北京维度之门科技有限公司]

- *iOS 客户端（SwiftUI）*：主导开发，完成录音、实时多说话人转写、声纹、AI 纪要与对话；处理后台录音、灵动岛实时活动和中断恢复，保证长时间录音不丢数据，并完成 TestFlight 发布。
- *后端与交付（Go + PostgreSQL + Redis）*：基于 Buf / gRPC 契约编排转写、摘要、知识图谱三类 AI Agent，负责录音处理链路、持久化任务与异常录音恢复；参与 Web 端开发，经 GitLab CI 与 GitOps 发布到 K8s。
- *Signboard 运营看板*：以 AI 协作当天完成从初始化、登录与数据看板、镜像 CI 到内网部署，后续扩展为可接入多产品的模块化宿主。

=== LLM Gateway —— 统一大模型网关 #h(1fr) 2026/07 -- 至今
#style.role[主导开发][北京维度之门科技有限公司]

- 基于 Rust（axum / tokio / SQLx）对外提供 OpenAI / Anthropic / Gemini 兼容接口，对接通义、火山引擎、Azure 等上游，覆盖对话、翻译、TTS 与实时 ASR；统一处理鉴权、额度计费、请求审计和链路追踪，MinuteX 的各 AI Agent 均经由网关调用模型。
- 主导数据层由 Diesel 迁移至 SQLx，按入站协议与上游适配器重新划分模块边界，便于持续接入新模型；配套开发 React 管理台的模型、渠道、令牌、额度审批与请求审计页面。

=== 平台基建 —— K8s 多集群管理与 GitOps 发布 #h(1fr) 2026/07 -- 至今
#style.role[参与开发][北京维度之门科技有限公司]

- 为多集群管理平台 sync-k8s（集群资源同步至 PostgreSQL，基于 Git 仓库发布与回滚）补齐细粒度 RBAC、审计日志与个人访问令牌；开发 Rust 命令行工具 platformctl，在终端完成资源查询、健康检查、发布与回滚。

=== 顺德机械业务平台 —— 配件 ERP 与 AI 数据助手 #style.repo("https://github.com/ShundeMachinery", "ShundeMachinery") #h(1fr) 2026/07 -- 至今
#style.role[独立开发][山东日照顺德机械配件有限公司]

- *业务系统*：借助 AI 一人在约 3 个月内完成 Spring Boot（Java 25）+ PostgreSQL 后端与 React 管理端，从产品目录、机型适配扩展到库存、采购、销售、生产与应收，并接入飞书登录、组织同步与审批流。
- *AI 数据助手*：开发 MCP 服务，通过 OAuth 让 Codex 等 AI 工具按用户权限只读查询业务数据；在此之上构建站内 AI 问答，按"理解问题 → 经 MCP 取数 → 独立核验"执行，回答附数据来源，返回前复核权限。

=== Echo Gate —— 自托管团队通讯系统 #style.repo("https://github.com/desonglll/chat_room", "desonglll/chat_room") #h(1fr) 2026/08 -- 至今
#style.role[独立开发][个人项目]

- 基于 Rust（axum / SQLx）构建以房间为权限边界的实时通讯服务：房间与私聊、消息回复 / 编辑 / 撤回、可续传附件、收藏夹，以及带引用、按房间授权检索的 AI 对话；React 网页端与 PySide6 桌面端共用一套 API，可在 SQLite 单机与 PostgreSQL + Redis + Qdrant 部署间切换。
- 以多 Agent 并行方式开发：一任务一 worktree、各自写开发日志，由集成负责人统一合并共享模块；两个月独立提交 400 次，并配套压测工具输出吞吐与 P95 / P99 延迟报告。

=== 锈羽（Ax）—— Rust 全栈微博系统 #style.repo("https://github.com/desonglll/ax", "desonglll/ax") #h(1fr) 2024/08 -- 至今
#style.role[独立开发][个人项目]

- 使用 Rust（Actix-web / SQLx 编译期校验 SQL）+ PostgreSQL + Vue 3 构建，支持发帖、评论、点赞、关注、通知与附件；以数据库触发器保证计数与通知一致，可接入 OpenAI 兼容接口自动生成标题；已登记软件著作权。

== #style.icon("\u{f02d}") 学术与社会服务
- DFA-SAGE: A Dual-Fusion Aggregation Graph Sampling and Embedding Model for Enhanced Intrusion Detection（Computer Networks，CCF B 类期刊，已录用）
- Official Reviewer, IJCNN 2026 (WCCI, IEEE CIS flagship conference)

== #style.icon("\u{f091}") 竞赛荣誉

=== 软件著作权
- 锈羽——基于Rust的全栈推文系统 (`2026SR0178137`) #h(1fr) 2026/01
- e和园校园服务管理平台 (`2023SR0235691`) #h(1fr) 2023/02
- 党团助手——校园党建平台 (`2023SR0137018`) #h(1fr) 2023/01

=== 竞赛获奖
- 第五届中国移动“梧桐杯”数智创新大赛 #sym.dot.op 山东赛区第二名 (国赛入围) #h(1fr) 2026/02
- 第十五届全国大学生数学竞赛 #sym.dot.op 山东赛区一等奖 (国赛入围) #h(1fr) 2023/11
- 第十九、二十届山东省大学生软件设计大赛 #sym.dot.op 省二等奖 3 项 #h(1fr) 2021 -- 2022

=== 综合荣誉
- 2024届山东省优秀毕业生 | 曲阜师范大学优秀毕业生 #h(1fr) 2023 -- 2024
- 研究生学业奖学金 (2024) | 本科生学业奖学金 (2021, 2022, 2023) #h(1fr) 2021 -- 2024
