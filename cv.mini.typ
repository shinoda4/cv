// For more customizable options, please refer to official reference: https://typst.app/docs/reference/
#import emoji: face
#import "@preview/tiaoma:0.3.0"


#show heading: set text(font: "Linux Biolinum")

// #show raw: it => box(
//     fill: luma(220),
//     outset: 2pt,
//     radius: 3pt,
//     stroke: none
// )[
//     #text(font: "Iosevka")[
//         #it       
//     ]
// ]

#show raw: set text(font: "Iosevka")

#show link: underline

// Uncomment the following lines to adjust the size of text
// The recommend resume text size is from `10pt` to `12pt`
// #set text(
//   size: 12pt,
// )

// Feel free to change the margin below to best fit your own CV
#set page(
    margin: (x: 0.9cm, y: 1.3cm),
    numbering: "1/1"
)

#set par(justify: true)

#set text(font: ("Libertinus Serif", "Symbols Nerd Font"))

#let chiline() = {
  v(-3pt)
  line(length: 100%)
  v(-5pt)
}

#let continuescvpage() = {
  place(
    bottom + center,
    dx: 0pt, // Horizontal offset (positive is rightward)
    dy: -10pt, // Vertical offset (positive moves upwards)
    float: true,
    scope: "parent",
    [
      #text(fill: gray)[... continues on the next page ...]
    ],
  )
}

#let lastupdated(date) = {
  h(1fr)
  text("Last Updated in " + date, fill: color.gray)
}

#let p_underline(it) = {
//  set text(top-edge: "bounds", bottom-edge: "bounds")
  box(stroke: (bottom: 0.5pt + black), outset: (bottom: 2pt), it)
}

// Uncomment the following lines to add the optional prompt at the bottom of the first CV page
// #continuescvpage()

#grid(
  columns: (1fr, auto, auto),
  gutter: 1em,
  align: (left + horizon, right + horizon, right + horizon),
  [
    = #text(stroke: 0.02em)[林德松] | Rust 后端工程师（Web 系统 / 性能优化）
    #v(0.5em)
    \u{f0ebb} lindesong666\@163.com | #link("https://github.com/shinoda4")[\u{ea84} github.com/shinoda4] ｜ #link("https://desonglll.xyz")[desonglll.xyz]
  ],
  [
    #box(height: 3em)[#tiaoma.qrcode("https://desonglll.lindesong666.deno.net/")]
  ]
    // [
    //     // width/height: 建议 3.5cm 到 4cm 左右，或者使用 em 单位
    //   #box( height: 5em, radius: 2pt, clip: true)[
    //     #image("avatar.jpg", fit: "cover")
    //   ]
    // ]

)
`Rust Web` 服务开发，具备生产环境部署与长期维护经验。\
曾将 `Django` 计算模块重写为 `Rust FFI` 模块，万级数据处理由秒级优化至毫秒级。\
负责接口设计、`PostgreSQL` 数据建模、并发一致性处理与性能优化，系统已真实上线运行。\

== #text(font: "Symbols Nerd Font")[\u{f4cd} 教育背景]
#chiline()

#link("http://www.qfnu.edu.cn/")[*曲阜师范大学（研二在读）*] #h(1fr) 2024/09 -- 2027/06 \
软件工程 #h(1fr) 硕士学位 \
- 主修课程：机器学习、深度学习、高级软件开发
- 参与一项#p_underline()[*国家自然科学基金*]项目的申请书撰写

#link("http://www.qfnu.edu.cn/")[*曲阜师范大学*] #h(1fr) 2020/09 -- 2024/06 \
软件工程 #h(1fr) 学士学位 \
- 主修课程：数据结构与算法、`Java`程序设计、`Python`程序设计、计算机组成原理

== #text(font: "Symbols Nerd Font")[\u{f4cd} 技术能力]
#chiline()
#columns(2, gutter: 10pt)[
#text(stroke: 0.02em)[后端开发（主方向）]
- 使用 `Rust` 为主，并在 `Django / Rails` 项目中开发与维护 Web 服务
- 完成接口编写、业务逻辑实现与调试上线，参与功能迭代与缺陷修复
- 实现鉴权、数据查询、评论与文件上传等常见业务功能，并根据运行情况进行问题定位与调整
#text(stroke: 0.02em)[数据库与数据建模]
- 根据业务需求设计数据表结构并编写查询
- 调整查询方式与索引以改善接口响应速度
- 排查并修复数据不一致与异常记录
#colbreak()
#text(stroke: 0.02em)[系统部署与问题排查]
- `Linux` 服务器部署与 `Nginx` 配置
- 基于日志进行线上问题定位与慢接口排查
#text(stroke: 0.02em)[技术栈]
- `Rust · Python · PostgreSQL · Linux · Nginx · Git · Docker · TypeScript`
- 接触过：`Django · Rails · Spring · Gin · Next.js · SvelteKit · React · Vue`
#text(stroke: 0.02em)[日常工具]
- `Emacs, Vim, Git, Tmux`
]

== #text(font: "Symbols Nerd Font")[\u{f4cd} 实习经历]
#chiline()

#text(stroke: 0.02em)[*山东日照顺德机械配件有限公司*] #h(1fr) 2022/02 -- 2024/06 \
全栈开发工程师 #h(1fr) 山东省日照市 \
参与公司内部业务系统开发与长期维护，负责库存、订单与产品数据相关模块，处理真实生产数据与线上运行问题。
- 性能瓶颈定位与优化（`Rust FFI`）：库存对账接口在订单量增长后响应明显变慢，通过日志与数据分析定位为高频计算逻辑耗时，将该部分重写为 `Rust` 数据处理模块并通过 `FFI` 接入 `Django`，提高记录处理时间并稳定运行在线上环境。
- 线上故障排查与数据修复：处理接口异常与数据不一致问题，结合应用日志与数据库记录定位错误来源，修复历史脏数据并恢复业务可用性。
- 数据库建模与查询优化：为机械配件 `BOM` 关系设计数据结构与索引方案，重构多表关联查询，减少全表扫描并降低数据库负载。
- 系统维护与部署：负责服务部署与运行环境维护，使用 `Linux` 与 `Nginx` 保障系统对内稳定访问。

#text(stroke: 0.02em)[*江苏传智播客教育科技股份有限公司 (济南) *] #h(1fr) 2023/12 -- 2024/02 \
后端开发实践 #h(1fr) 山东省济南市 \
在 `SpringMVC + MyBatis` 架构下参与业务模块开发与接口联调，熟悉分层结构、接口协作流程与代码评审规范，并参与测试与缺陷修复流程。

#pagebreak()
== #text(font: "Symbols Nerd Font")[\u{f4cd} 项目经历]

#chiline()

#text(stroke: 0.02em)[*Shunde Get | 企业产品展示与检索系统（独立开发与重构）*] #h(1fr) 2023/02 -- 2024/06 \
全栈开发 / 独立重构 #h(1fr) https://sdsdsd.online \
为机械配件公司构建并长期维护的线上业务系统，负责数据处理、接口设计、数据库建模与服务器部署的完整交付，系统面向真实客户持续运行。
- 系统重构与部署：将原 `React` 单页站点重构为 `SvelteKit SSR` 架构，并完成 `Linux + Nginx` 部署，使站点可被搜索引擎索引并稳定对外提供访问。
- 数据建模与结构化处理：针对数千种型号配件存在的规格差异，设计结构化产品数据格式，并使用 `TypeScript` 脚本与 `Python` 数据处理模块生成可检索数据源。
- 数据库设计与查询优化：为复杂配件参数关系设计 `PostgreSQL` 表结构与查询方式，减少重复查询与冗余数据读取，提升检索接口响应效率。
- 检索接口设计：实现参数化搜索接口，支持按型号、规格与类别组合筛选，保证查询结果稳定与可扩展。
- 资源与访问优化：对大量产品图片进行压缩与尺寸处理，降低移动端弱网环境下加载时间，提高实际访问可用性。

#text(stroke: 0.02em)[*推校园 Tweet | (高并发校园社交平台)*] #h(1fr) 2023/12 -- 2024/06 \
核心开发者 / 架构设计 #h(1fr) https://github.com/desonglll/ax.git \
独立设计并长期维护的真实运行 Web 后端系统，提供用户、动态、评论、点赞与图片上传服务，重点解决数据增长后的查询性能与并发一致性问题。
- 后端架构设计：基于 `Actix Web` 构建异步服务，划分路由层 / 业务层 / 数据访问层，统一错误处理与中间件体系（鉴权、日志、跨域），保证接口可维护性与可扩展性。
- 数据库建模与索引设计：为帖子、评论、点赞关系设计 `PostgreSQL` 表结构与复合索引，避免多表查询产生的全表扫描，降低高频接口数据库负载。
- 并发一致性处理：在点赞与评论计数场景中处理并发写入冲突，通过事务与约束设计避免计数错误与重复写入问题。
- 分页性能优化：当数据量增长后 `OFFSET/LIMIT` 查询明显变慢，将时间线接口改为 `Keyset Pagination`（游标分页），稳定接口响应时间。
- 鉴权与安全：实现基于 `JWT` 的访问与刷新机制，并在上传接口增加类型与大小校验，防止异常请求与无效文件写入。
- 问题定位与性能分析：通过日志与压测定位慢接口，减少冗余查询与重复读取，优化后显著降低接口延迟。

== #text(font: "Symbols Nerd Font")[\u{f4cd} 竞赛荣誉]
#chiline()

*#text(font: "Symbols Nerd Font")[\u{ebe9}]  软件著作权 (独立/核心作者)*
- *锈羽——基于Rust的全栈推文系统* (`2026SR0178137`) #h(1fr) 2026/01
- *e和园校园服务管理平台* (`2023SR0235691`) #h(1fr) 2023/02
- *党团助手——校园党建平台* (`2023SR0137018`) #h(1fr) 2023/01

*#text(font: "Symbols Nerd Font")[\u{ee22}] 竞赛获奖*
#grid(
    columns: (3fr, 1fr),
    gutter: 5pt,
    align: (left, right),
    [- *第十五届全国大学生数学竞赛* #sym.dot.op 山东赛区一等奖 (国赛入围)], [2023/11],
    [- *第二十届山东省大学生软件设计大赛* #sym.dot.op 省二等奖 (党团助手项目)], [2022/11],
    [- *第十九届山东省大学生软件设计大赛* #sym.dot.op 省二等奖 (党帮帮项目)], [2021/11],
)

*#text(font: "Symbols Nerd Font")[\u{f1a82}] 综合荣誉*
#grid(
    columns: (3fr, 1fr),
    gutter: 5pt,
    align: (left, right),
    [- *2024届山东省优秀毕业生*], [2024/01],
    [- *研究生学业奖学金* (2024) | *本科生学业奖学金* (2021, 2022)], [2021 -- 2024],
    [- *校级优秀团员*], [2022/10],
)

// Feel free to change the date below to the last time you updated your CV
#lastupdated(datetime.today().display())
