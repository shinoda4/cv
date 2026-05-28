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
        == \u{f450} 中国 \u{f444} 北京
    ],
    [
        #image("me.jpg", height: 8em)
    ]
    // [
    //     #box(height: 4em)[#tiaoma.qrcode("https://desonglll.lindesong666.deno.net/")English Version]
    // ]
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
        - Python / Rust Web 服务开发，具备生产环境部署与长期维护经验
        - 参与 Django 服务性能优化与 Rust 模块集成
        - 负责接口设计、PostgreSQL 数据建模与性能优化
    ]

)

== \u{efcc} 技术栈
#style.chiline()
- 编程语言：Python, Rust, Java, C/C++, Go
- Web 技术：React, Vue | Django, SpringBoot
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

=== 北京硅基流动科技有限公司 #h(1fr) 2026/03 -- 至今

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

=== ComfyUI 云端推理网关与编排系统 (ComfyAgent / BizyEngine) #h(1fr) 2026/04 -- 至今
*研发实习生* #h(1fr) 北京硅基流动科技有限公司

- 扩展 ComfyUI 服务端，开发模型/数据集管理 API 与 API Key 认证。
- 构建请求处理网关，设计任务编排与输出管理。
- 开发对话协调功能，支持多源服务集成与结果整合。

=== ComfyUI 云环境管理与部署引擎 (CCE / BizyDeploy) #h(1fr) 2026/04 -- 至今
*研发实习生* #h(1fr) 北京硅基流动科技有限公司

- 设计 Docker 镜像构建流程，开发插件仓库管理与依赖解析；实现多源资源管理与完整性校验。
- 开发云函数部署 CLI 和工作流引擎，支持配置合并与自动化部署。

=== AX (锈羽) —— 全栈社交媒体与内容分发系统 #h(1fr) 2023/06 -- 2024/06
*独立开发者* #h(1fr) 个人项目 (软件著作权 `2026SR0178137`)

- 构建异步后端服务，开发数据库访问与分布式会话管理，设计统一响应包装与错误处理。
- 设计数据模型与统计逻辑，维护推文热度、点赞/踩计数和用户统计一致性。
- 开发多模态文件管理与推荐功能，支持文件去重、分块传输和个性化内容排序。

// === 全栈电子商务订单管理系统 (Rails 8 Order System) #h(1fr) 2025/10 -- 2026/01
// *独立开发者* #h(1fr) 个人项目

// - 基于 *Ruby on Rails 8.1 + Hotwire (Turbo/Stimulus)* 构建全栈系统，使用 *Devise* 实现身份认证与角色权限（Admin/User），
//   集成 *Active Storage* 多模态上传与 *Action Text* 富文本编辑。
// - 采用 *Service Object* 模式封装业务逻辑（`CreateService` / `CancelService`），在事务中通过 *悲观锁*（`lock!`）
//   确保库存扣减与恢复的强一致性，避免超卖。
// - 实现 *到货通知机制*：通过 `after_update_commit` 回调监听库存从零恢复，触发 `ProductMailer` 异步邮件；
//   基于 `generates_token_for` 实现令牌化安全退订链接。

== \u{e20f} 专业技能
#style.chiline()

=== Python & Async Web
- 基于 aiohttp / FastAPI 构建异步 Web 服务与 API 网关，熟悉中间件、流式推送与健康探针设计。
- 构建配置系统与模板渲染能力，支持可维护的部署与运行时配置。

=== DevOps
- 设计多阶段 Docker 镜像构建流程，熟悉容器环境部署与调试。
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

#box(height: 4em)[#tiaoma.qrcode("https://desonglll.lindesong666.deno.net/")English Version]

#lastupdated(datetime.today().display())
