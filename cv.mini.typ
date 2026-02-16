// For more customizable options, please refer to official reference: https://typst.app/docs/reference/
#import emoji: face
#import "@preview/tiaoma:0.3.0"


#show heading: set text(font: "Linux Biolinum")

#show link: underline

// Uncomment the following lines to adjust the size of text
// The recommend resume text size is from `10pt` to `12pt`
// #set text(
//   size: 12pt,
// )

// Feel free to change the margin below to best fit your own CV
#set page(
  margin: (x: 0.9cm, y: 1.3cm),
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
    = #text(stroke: 0.02em)[林德松] | 后端工程师（Rust / Web 系统）
    #v(0.5em)
    lindesong666\@163.com | #link("https://github.com/shinoda4")[github.com/shinoda4] \
    #link("https://desonglll.xyz")[desonglll.xyz]
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

硕士在读（软件工程）｜2 年企业级 Web 系统开发经验\
主攻 Rust 后端、Web 服务架构与 PostgreSQL 数据建模\
可独立完成：接口设计 → 数据库建模 → 部署上线 → 性能优化\

== 教育背景
#chiline()

#link("http://www.qfnu.edu.cn/")[*曲阜师范大学（研二在读）*] #h(1fr) 2024/09 -- 2027/06 \
软件工程 #h(1fr) 硕士学位 \
// - 参与一项#p_underline()[*国家自然科学基金*]项目的申请书撰写

#link("http://www.qfnu.edu.cn/")[*曲阜师范大学*] #h(1fr) 2020/09 -- 2024/06 \
软件工程 #h(1fr) 学士学位 \
- 主修课程：数据结构与算法、Java程序设计、Python程序设计、计算机组成原理

== 技术能力
#chiline()
后端开发（主方向）
- Rust：基于 Actix 构建异步 Web 服务，熟悉 async/await、任务调度、共享状态管理（Arc/Mutex/RwLock）、中间件设计与错误处理
- Web API：RESTful 与 GraphQL 接口设计、认证鉴权（JWT）、分页与过滤策略（cursor/keyset pagination）
数据库与数据建模
- PostgreSQL：关系模型设计、索引设计（B-Tree/复合索引）、事务与并发一致性理解
- 熟悉常见反模式（N+1 查询、过度 JOIN）及其优化
工程与部署
- Linux 环境部署、Nginx 反向代理、Docker 容器化部署
- Git 协作开发流程（feature branch / PR / code review）
- 基础日志与错误排查，具备线上问题定位经验
其他语言与框架（辅助能力）
- Python（脚本与工具）、TypeScript（前端交互开发）
- 使用过 Django / Spring Boot / SvelteKit / React / Vue

== 工作经历
#chiline()

*山东顺德机械配件有限公司* #h(1fr) 2022/02 -- 2024/06 \
全栈开发工程师 #h(1fr) 山东省日照市 \
- 库存对账性能优化：针对原 Django 实现的库存对账在大量订单下响应缓慢的问题，将高频计算逻辑拆分为 *Rust* 编写的数据处理模块，通过 FFI 调用集成，使万级记录处理时间由秒级降至毫秒级。
- 线上系统维护与问题排查：负责接口异常、数据错误等线上问题定位，结合日志与数据库排查数据不一致问题，并修复历史脏数据，有效保障了业务系统的连续稳定运行。
- 数据库建模与查询优化：设计机械配件 *BOM* 数据结构，重构多表关联查询与索引，减少了全表扫描，显著降低了接口响应时间与数据库负载。
- 网站架构迁移：将公司展示站点由 React 单页应用迁移至 *SvelteKit SSR* 架构，优化搜索引擎收录（SEO）与首屏加载速度，并独立完成 *Nginx + Linux* 环境的部署上线。

*江苏传智播客教育科技股份有限公司 (济南)* #h(1fr) 2023/12 -- 2024/02 \
后端开发实践 #h(1fr) 山东省济南市 \
- 企业级架构开发：在 *SpringMVC + MyBatis* 架构下参与业务模块实现，按照接口文档完成功能开发与联调，深入理解分层架构与业务代码组织方式。
- 前后端协作与调试：配合前端完成接口联调与问题定位，参与接口文档编写、系统测试与缺陷修复流程，保障模块交付质量。
- 敏捷开发实践：深度参与需求评审、代码 Review 与每日站会，熟悉 *Git* 协作开发、分支管理与团队规范化交付流程。
== 项目经历

#chiline()

*Shunde Get 企业产品展示与检索网站* #h(1fr) 2023/02 -- 2024/06 \
全栈开发 / 独立重构 #h(1fr) https://sdsdsd.online \
为机械配件公司构建面向客户的产品展示与检索网站，负责从后端数据处理到前端交互及部署的完整交付。
- 架构重构：将原 React 单页应用迁移至 SvelteKit SSR 架构，改善搜索引擎收录与首屏加载体验，并完成 Linux 服务器部署。
- 配件数据处理：针对数千种型号配件，编写 TypeScript 数据处理脚本与 Rust 数据处理模块，生成结构化产品数据以支持前端检索与筛选。
- 查询与筛选设计：设计参数化搜索接口与筛选逻辑，支持按型号、规格与类别快速定位产品。
- 数据库与接口优化：为复杂配件参数关系设计 PostgreSQL 查询结构，减少重复查询与冗余数据传输。
- 资源加载优化：对大量产品图片进行压缩与尺寸处理，降低移动端弱网环境下页面加载时间。

*推校园 Tweet (高并发校园社交平台)* #h(1fr) 2023/12 -- 2024/06 \
核心开发者 / 架构设计 #h(1fr) https://github.com/desonglll/ax.git \
独立设计并实现完整 Web 后端服务，包含用户、动态、评论、点赞与图片上传等功能模块，作为真实可运行系统长期维护。
- 后端架构设计：使用 Rust（Actix Web）构建异步 Web 服务，拆分路由层、业务层与数据访问层，设计统一错误处理与中间件体系（认证、日志、跨域）。
- 认证与安全：实现基于 JWT 的鉴权机制与刷新策略，避免未授权访问与重复登录状态问题，并在上传接口中增加类型与大小校验以防止恶意请求。
- 数据库与一致性：为帖子、评论与点赞设计关系模型与索引结构，处理并发点赞写入冲突，避免计数不一致问题。
- 分页与查询性能优化：将基于 OFFSET/LIMIT 的分页改为游标分页（keyset pagination），在数据量增长后保持稳定响应时间。
- 图片上传与资源管理：实现文件上传与访问路径管理，避免重复上传与异常文件导致的存储浪费。
- 接口调试与性能分析：通过日志与压测工具定位慢接口与不必要查询，优化后显著降低接口响应延迟。

== 荣誉与科研成果
#chiline()

*#text(font: "Symbols Nerd Font")[\u{ebe9}]  软件著作权 (独立/核心作者)*
- *锈羽——基于Rust的全栈推文系统* (2026SR0178137) #h(1fr) 2026/01
- *e和园校园服务管理平台* (2023SR0235691) #h(1fr) 2023/02
- *党团助手——校园党建平台* (2023SR0137018) #h(1fr) 2023/01

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
