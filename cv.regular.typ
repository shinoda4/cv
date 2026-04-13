#import "style.typ"
#import emoji: face

#import "@preview/tiaoma:0.3.0"
#set page(
    margin: (x: 0.9cm, y: 1.3cm),
    numbering: "1/1"
)
#set text(
    font: ("Linux Biolinum", "Libertinus Serif", "Kaiti SC", "Adobe Kaiti Std R", "Noto Serif CJK SC", "Symbols Nerd Font"),
    size: 12pt,          
    lang: "zh",          
    region: "cn"
)
#show heading.where(level: 1): set text(size: 22pt, font: ("Linux Biolinum", "Libertinus Serif", "Kaiti SC", "Adobe Kaiti Std R", "Noto Serif CJK SC", "Symbols Nerd Font"))
#show heading.where(level: 2): set text(font: ("Linux Biolinum", "Libertinus Serif", "Heiti SC", "Adobe Heiti Std","Noto Sans CJK SC", "Symbols Nerd Font"))
#show heading.where(level: 3): set text(font: ("Linux Biolinum", "Libertinus Serif", "Kaiti SC", "Adobe Kaiti Std R", "Noto Serif CJK SC", "Symbols Nerd Font"))
// #show heading.where(level: 3): set block(above: 0.5em, below: 0.8em)

#let lang_title(icon, it) = {
    show heading.where(level: 3): set block(above: 0.5em, below: 0.8em)
    heading(level: 3)[
        #box(
            height: 1.5em,
            baseline: 0.25em,
        )[#text(size: 2em)[#icon]] #it]
}

#set par(justify: true)
// #show raw: set text(font: ("CaskaydiaCove NF","Linux Libertine Mono O"))
#show raw: set text(font: ("TX-02", "DejaVu Sans Mono"))
#show link: underline
#let p_underline(it) = {
    //  set text(top-edge: "bounds", bottom-edge: "bounds")
    box(stroke: (bottom: 0.8pt + black), outset: (bottom: 3pt), it)
}
#let lastupdated(date) = {
    h(1fr)
    text("Last Updated in " + date, fill: color.gray)
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
// }
// #grid(
//     columns: (1fr, auto, auto),
//     gutter: 1em,
//     align: (left + horizon, right + horizon, right + horizon),
//     [
//         = #box(
//             height: 2em,
//             baseline: 0.5em,
//         )[
//             #text(size: 2em)[\u{e7a8} \u{e724}]
//         ] #box(baseline: 25%, image("rustacean-flat-happy.svg", height: 2em)) 林德松
//     ],
//     [
//         #box(height: 3em)[#tiaoma.qrcode("https://desonglll.lindesong666.deno.net/")]    
//     ]
// )
#grid(
    columns: (1fr, auto, auto),
    gutter: 1em,
    align: (left + horizon, right + horizon, right + horizon),
    [
        = #box(baseline: 0.7em, image("rustacean-flat-happy.svg", height: 2em)) 林德松 Tesung Lin #box(baseline: 0.7em, image("Go.svg", height: 2em))
    ],
    [
        #box(height: 4em)[#tiaoma.qrcode("https://desonglll.lindesong666.deno.net/")English Version]
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
        - Rust Web 服务开发，具备生产环境部署与长期维护经验
        - 将 Django 计算模块重写为 Rust FFI 模块，万级数据处理优化至毫秒级
        - 负责接口设计、PostgreSQL 数据建模、并发一致性处理与性能优化，系统已真实上线运行
    ]

)

== \u{efcc} 技术栈
#style.chiline()
- 编程语言：Python, Rust, Java, C/C++, Go, Ruby, PHP
- Web 技术：React, Vue, Svelte | Django, SpringBoot, Larval, Ruby on Rails, Phoenix
- 数据库：PostgreSQL, Redis
- 工程工具：Docker, Tmux, Git, Shell
- 开发环境：macOS, Linux

== \u{ef23} 教育背景
#style.chiline()
=== 曲阜师范大学 软件工程 *硕士*学位（在读） #h(1fr) 2024/09 -- 2027/06
- #p_underline()[*Official Reviewer 审稿人*]，国际神经网络联合会议（IJCNN 2026，WCCI，IEEE 计算智能学会）
// - Official Reviewer, IJCNN 2026 (WCCI, IEEE CIS flagship conference)
- 参与一项#p_underline()[*国家自然科学基金*]项目的申请书撰写
- 课程：软件体系结构、软件建模与需求工程、分布式系统、深度学习
=== 曲阜师范大学 软件工程 *学士*学位 #h(1fr) 2020/09 -- 2024/06
- 课程：C/C++、数据结构、计算机组成原理、操作系统、计算机网络
- 曾担任学院团委学生会#p_underline()[*副主席*]兼组织部部长


== \u{f0b1} 实习经历
#style.chiline()

=== 北京硅基流动科技有限公司 #h(1fr) 2026/04 -- 至今

研发实习生 #h(1fr) 北京市海淀区

- *cce*: 开发 ComfyUI 环境管理与镜像打包系统，实现插件仓库批量克隆（setupVendor）
  与多源依赖自动合并解析（gen_full_reqs），构建多阶段 GPU Docker 镜像（PyTorch 2.5/2.9 + CUDA 12.4），
  使构建时间缩减约 40%；开发模型下载工具（downloadModels），支持 HuggingFace/ModelScope 双源与完整性校验。
- *ComfyAgent*: 基于 FastAPI 开发 ComfyUI FAAS 网关，设计 Workflow 编排层
  （请求重写/Jinja2 模板/输出后处理），构建模型权重多源下载与磁盘缓存系统，
  实现对象存储抽象层（OSS/OneStore/S3）与三级健康探针（含队列深度感知），集成 SSE 流式推送与 Prometheus 监控。
- *BizyDeploy*: 基于 Hydra/OmegaConf 开发 FaaS 云函数声明式部署 CLI，
  设计 Pipeline 工作流引擎（链式编排+步骤间结果传递），实现跨环境配置合并与部署自动化，
  开发支持请求缓存与动态 Action 分发的 FaaS API 客户端。
- *BizyEngine*: 扩展 ComfyUI 服务端，开发社区模型/数据集管理 API 与 API Key 双来源认证，
  集成第三方 AI 服务节点（GPT/Gemini/Kling/Sora 等），基于 MCP 实现 AI 对话协调器
  串联 LLM 与图像生成工具，支持 SSE 流式对话与模型同步状态自动推送。

=== 北京百晨科技有限公司 #h(1fr) 2025/12 -- 2026/03

后端交付工程师 / 技术支持 #h(1fr) 北京市海淀区

- *技术方案与招投标支撑*：深度参与政务/部队项目技术标书撰写，负责系统架构设计说明与技术可行性论证，确保技术方案满足高可靠、高安全性的业务需求。
- *私有化部署与运维*：负责系统在涉密网络/隔离环境下的私有化部署工作，涉及物理服务器环境配置、容器化（Docker）镜像迁移及数据库初始化。
- *需求分析与业务建模*：作为技术对接人，负责收集并抽象业务单位的特定需求，参与报名信息管理系统等内部工具的功能逻辑设计与数据模型梳理。
- *系统稳定性保障*：负责交付后的线上故障排查与应急处理，通过编写 Shell 脚本自动化处理日志巡检与数据备份，提升现场部署效率 30% 以上。

=== 山东日照顺德机械配件有限公司 #h(1fr) 2023/02 -- 2024/06

后端开发工程师 #h(1fr) 山东省日照市

参与公司内部业务系统开发与长期维护，负责库存、订单与产品数据相关模块，处理真实生产数据与线上运行问题。

- *核心模块重构（Rust FFI）*： 针对高频物料库存计算导致的 Django 接口超时，使用 Rust 重新实现核心算法并封装为动态库，通过 FFI 调用，将单次计算耗时从 800ms 降至 50ms。
- *线上故障排查与数据修复*：处理接口异常与数据不一致问题，结合应用日志与数据库记录定位错误来源，修复历史脏数据并恢复业务可用性。
- *运维部署*： 基于 Nginx 实现静态资源加速与反向代理，配合 Systemd 管理 Django 服务进程，保障了公司内部系统 99.9% 的可用性。

// === 江苏传智播客教育科技股份有限公司 (济南) #h(1fr) 2023/12 -- 2024/02

// 后端开发实践 #h(1fr) 山东省济南市

// - 在 SpringMVC + MyBatis 架构下参与业务模块开发与接口联调，熟悉分层结构、接口协作流程与代码评审规范，并参与测试与缺陷修复流程。


== \u{efbe} 项目经历
#style.chiline()

=== ComfyUI 云端推理网关与编排系统 (ComfyAgent / BizyEngine) #h(1fr) 2026/04 -- 至今
*研发实习生* #h(1fr) 北京硅基流动科技

- 基于 **aiohttp** 扩展 ComfyUI 服务端，开发社区模型/数据集管理 API 与 API Key 双来源认证，
  集成 GPT/Gemini/Kling/Sora 等第三方 AI 服务节点。
- 基于 **FastAPI** 构建 FAAS 网关，设计 Workflow 编排层（请求重写 / Jinja2 模板 / 输出后处理），
  构建模型权重多源下载与磁盘缓存系统，实现对象存储抽象层（OSS / OneStore / S3）。
- 基于 **MCP 协议** 开发 AI 对话协调器，串联 LLM 与图像生成工具，支持 SSE 流式对话与模型同步状态自动推送；
  设计三级健康探针（含队列深度感知），集成 **Prometheus** 监控。

=== ComfyUI 云环境管理与部署引擎 (CCE / BizyDeploy) #h(1fr) 2026/04 -- 至今
*研发实习生* #h(1fr) 北京硅基流动科技

- 设计多阶段 GPU Docker 镜像构建流程（PyTorch 2.5/2.9 + CUDA 12.4），开发插件仓库批量克隆
  与依赖自动合并解析，构建时间缩减约 40%；实现 HuggingFace / ModelScope 双源模型下载与完整性校验。
- 基于 **Hydra + OmegaConf** 开发 FaaS 声明式部署 CLI，设计 Pipeline 工作流引擎支持链式编排
  与步骤间结果传递，实现跨环境配置合并与部署自动化。
- 开发 FaaS API 客户端，支持请求级缓存与动态 Action 分发。
// === ComfyUI 云端推理网关与编排系统 (BizyAir / ComfyAgent / BizyEngine) #h(1fr) 2026/04 -- 至今
// *研发实习生* #h(1fr) 北京硅基流动科技

// - 基于 **aiohttp** 扩展 ComfyUI PromptServer，实现社区模型/数据集全生命周期 API、API Key RSA 解密认证与 SHA-256 去重上传；
//   设计 **SearchServiceRouter** 规则路由 + **BizyAirTrdApiBaseNode** 异步任务范式，透明接入十余种云端 AI 服务。
// - 基于 **FastAPI** 构建 FAAS 网关，开发 **WorkflowRewriter** 注册表模式实现节点透明替换，配合 **Jinja2** 模板支持
//   Workflow/Payload 双请求模式；设计三级健康探针（队列深度感知 Readiness）与 **SSE** 流式推送。
// - 开发 **BizyBot** AI 对话协调器，基于 **MCP 协议** 实现多工具发现与路由，设计 **Coordinator** 编排 LLM 流式对话
//   与工具调用循环，通过 asyncio 状态机与 Lock 保证流式连接生命周期安全。

// === ComfyUI 云环境管理与部署引擎 (CCE / BizyDeploy) #h(1fr) 2026/04 -- 至今
// *研发实习生* #h(1fr) 北京硅基流动科技

// - 设计多阶段 GPU Docker 镜像构建流程，开发 **BizyDraft** 定制层：通过 aiohttp Middleware 实现 Route Hijacking
//   （/view 远程流式代理、/upload OSS 直传、/prompt DryRun 验证）与 workflow I/O 叶子节点自动推断。
// - 基于 **Hydra + OmegaConf** 开发声明式部署 CLI，设计 Pipeline 工作流引擎支持链式编排与跨步骤结果传递
//   （`pipe.ctx` resolver）；开发 **FaasClient** API 客户端，基于 SHA-256 缓存与 `__getattr__` 动态 Action 分发。

=== AX (锈羽) —— 全栈社交媒体与内容分发系统 (Rust/React/PostgreSQL) #h(1fr) 2023/06 -- 2024/06
*独立开发者* #h(1fr) 个人项目 (软件著作权 `2026SR0178137`)

- 基于 **Rust (Actix-Web)** 构建异步后端，使用 **SQLx** 实现编译期类型检查的数据库访问，配合 **Redis** 实现分布式 Session 管理与身份认证；
  开发 **Tauri + React + TypeScript** 跨平台桌面客户端，设计 `ApiResponse<T>` 泛型响应包装与自定义错误枚举。
- 设计五类数据模型，通过 **6 个 PostgreSQL Trigger** 将聚合逻辑下沉至数据库层：自动维护推文热度指标（Engagement Rate）、
  点赞/踩计数、用户名冗余填充及统计表（`user_stats`），保证数据一致性。
- 开发多模态文件管理系统，基于 **SHA-256** 实现文件去重，支持 **HTTP Range** 分块流式传输；
  构建 ML 推荐 pipeline，从用户统计表提取特征向量，通过外部推理服务获取个性化推文排序。

=== 全栈电子商务订单管理系统 (Rails 8 Order System) #h(1fr) 2025/10 -- 2026/01
*独立开发者* #h(1fr) 个人项目

- 基于 **Ruby on Rails 8.1 + Hotwire (Turbo/Stimulus)** 构建全栈系统，使用 **Devise** 实现身份认证与角色权限（Admin/User），
  集成 **Active Storage** 多模态上传与 **Action Text** 富文本编辑。
- 采用 **Service Object** 模式封装业务逻辑（`CreateService` / `CancelService`），在事务中通过 **悲观锁**（`lock!`）
  确保库存扣减与恢复的强一致性，避免超卖。
- 实现 **到货通知机制**：通过 `after_update_commit` 回调监听库存从零恢复，触发 `ProductMailer` 异步邮件；
  基于 `generates_token_for` 实现令牌化安全退订链接。
- 使用 **Solid Queue** 处理异步邮件投递，配合 **Fragment Caching** 优化页面渲染，通过 **Kamal + Docker** 部署。

// === Themis —— 极简主义沉浸式专注计时器 (iOS/SwiftUI) #h(1fr) 2026/01 -- 2026/02
// *独立开发者* #h(1fr) 个人项目

// - 基于 **SwiftUI** 构建响应式界面，通过目标时间差计算与 `Text(timerInterval:)` 实现系统级帧同步倒计时，解决后台挂起导致的计时漂移问题。
// - 使用 **AVFoundation** 管理音频会话，实现“录音室静音”底噪与多应用音频混音；结合 **CoreHaptics** 提供沉浸式触觉反馈。
// - 设计带“宽限期”的连续专注（Streak）算法，在保证公平性的同时提升用户长期留存。
// - 采用 **UserDefaults + Codable** 构建轻量持久化层，实现任务历史与统计数据的毫秒级加载。


== \u{e20f} 专业技能
#style.chiline()

=== Python & Async Web
- 基于 aiohttp / FastAPI 构建异步 Web 服务与 API 网关，熟悉中间件、SSE 流式推送与健康探针设计。
- 熟练运用 asyncio 并发原语（Lock / Event / Semaphore），实践异步任务编排与资源生命周期管理。
- 使用 Hydra / OmegaConf 构建声明式配置系统，结合 Jinja2 模板引擎实现配置渲染与注入。

=== DevOps
- 设计多阶段 GPU Docker 镜像构建流程，熟悉 CUDA/PyTorch 环境定制与远程调试部署。
- 了解 Rust / Go / Ruby，具备多语言快速上手能力。

=== \u{e779} 日常工具
- 熟练使用 \u{e632} *Emacs* /Vim、Org-mode 进行开发与文档管理。
- 掌握 Gitflow/Trunk-based 工作流与复杂分支合并维护。
- 使用 Tmux、Zsh 与脚本提升终端开发效率。
- 基于 Docker 与 Unix/Linux 环境进行一致化开发与部署。

== \u{ed99} 学术与社会服务
#style.chiline()
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
- 2024届山东省优秀毕业生 #h(1fr) 2024/01
- 2024届曲阜师范大学优秀毕业生 #h(1fr) 2023/11
- 研究生学业奖学金 (2024) | 本科生学业奖学金 (2021, 2022, 2023) #h(1fr) 2021 -- 2024
- 校级优秀团员 #h(1fr) 2022/10

== \u{f1ab} 语言水平
#style.chiline()
- 大学英语 CET6

#v(1fr)
// Feel free to change the date below to the last time you updated your CV
#lastupdated(datetime.today().display())

