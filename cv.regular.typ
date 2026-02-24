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

== \u{ef23} 教育背景
#style.chiline()
=== 曲阜师范大学 软件工程 *硕士*学位（在读） #h(1fr) 2024/09 -- 2027/06
- #p_underline()[*Official Reviewer*]，国际神经网络联合会议（IJCNN 2026，WCCI，IEEE 计算智能学会）
// - Official Reviewer, IJCNN 2026 (WCCI, IEEE CIS flagship conference)
- 参与一项#p_underline()[*国家自然科学基金*]项目的申请书撰写
- 课程：软件体系结构、软件建模与需求工程、分布式系统、深度学习
=== 曲阜师范大学 软件工程 *学士*学位 #h(1fr) 2020/09 -- 2024/06
- 课程：C/C++、数据结构、计算机组成原理、操作系统、计算机网络
- 曾担任学院团委学生会#p_underline()[*副主席*]兼组织部部长
== \u{f0b1} 实习经历
#style.chiline()
=== 山东日照顺德机械配件有限公司 #h(1fr) 2022/02 -- 2023/06

后端开发工程师 #h(1fr) 山东省日照市

参与公司内部业务系统开发与长期维护，负责库存、订单与产品数据相关模块，处理真实生产数据与线上运行问题。

- 核心模块重构（Rust FFI）： 针对高频物料库存计算导致的 Django 接口超时，使用 Rust 重新实现核心算法并封装为动态库，通过 FFI 调用，将单次计算耗时从 800ms 降至 50ms。
- 线上故障排查与数据修复：处理接口异常与数据不一致问题，结合应用日志与数据库记录定位错误来源，修复历史脏数据并恢复业务可用性。
- 运维部署： 基于 Nginx 实现静态资源加速与反向代理，配合 Systemd 管理 Django 服务进程，保障了公司内部系统 99.9% 的可用性。

=== 江苏传智播客教育科技股份有限公司 (济南) #h(1fr) 2023/12 -- 2024/02

后端开发实践 #h(1fr) 山东省济南市

- 在 SpringMVC + MyBatis 架构下参与业务模块开发与接口联调，熟悉分层结构、接口协作流程与代码评审规范，并参与测试与缺陷修复流程。

== \u{f121} 专业技能
#style.chiline()

// #lang_title("\u{e7a8}")[Rust & Actix Web & Axum & Rocket]
=== \u{e7a8} Rust & Actix Web & Axum & Rocket
- 基于 Rust 构建高并发微服务，利用 async/await 与 Actor 模型优化吞吐与延迟表现。
- 深入理解 Ownership 与生命周期机制，结合 Serde 实现类型安全的序列化与并发安全保障。
- 使用 SQLx / Diesel 实现类型安全的数据访问，配合 Validator 构建健壮的 RESTful API。
- 熟悉 Axum 与 Rocket 中间件与 Extractor 机制，优化请求流水线与模块复用性。

=== \u{e71d} Python & Django & Django REST framework
- 基于 Django/DRF 构建 RESTful API，处理复杂序列化与资源路由。
- 熟悉 MTV 架构与 ORM 机制，具备复杂关联查询与事务管理经验。
- 实现基于权限系统与 JWT/OAuth2 的认证与访问控制。
- 集成 Celery + Redis 处理异步任务，利用 Signals 实现模块解耦。

=== \u{f07d3} Go & Gin
- 基于 gRPC/Protobuf 构建微服务通信，结合 Consul/Etcd 实现服务发现与治理。
- 使用 Gin 开发高并发 Web 服务，定制中间件优化请求链路。
- 熟练运用 Goroutines/Channels 与 context 管理并发与生命周期。
- 基于 Gorm 实现数据库访问，结合 Testify/Mock 构建可测试服务。

=== \u{f0acf} Ruby & Ruby on Rails

- 使用 Rails 完成数据库建模到业务交付的全栈开发。
- 熟悉 ActiveRecord 查询优化、索引与缓存，解决 N+1 等性能问题。
- 采用 RSpec 实践 TDD/BDD，保障 CI 环境下的代码稳定性。

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

