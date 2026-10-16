// regular / en 共用的版式。两版只需：
//   #import "style.typ"
//   #show: style.resume.with(lang: "zh")   // 或 "en"
// 字号、行距、间距、配色都只在这里定义，改一处两版同步生效。

// 配色：正文黑色；次要信息、图标用灰色；链接用低饱和蓝，不加下划线
#let muted = rgb("#6b7280")
#let accent = rgb("#2f5d8c")
#let tint = rgb("#f4f5f7") // 条目标题底色

// 图标统一取 Symbols Nerd Font 中的 Font Awesome 一套
#let icon(code) = text(font: "Symbols Nerd Font", fill: muted, weight: "regular", code)
// 联系方式：固定宽度的图标列 + 内容
#let contact(code, body) = [#box(width: 1.4em, icon(code))#body]
// 标题里的代码仓库：GitHub 图标 + 短路径
#let repo(url, label) = [#h(0.3em)#link(url, text(size: 0.85em, weight: "regular")[#icon("\u{f09b}") #label])]
// 姓名下方的所在地
#let location(body) = text(size: 1.1em)[#icon("\u{f041}") #body]

// 左侧窄列：条目标题的竖条和列表圆点都落在这一列，
// 标题文字、职位行、条目正文共用右侧同一条左边线。
#let bar-width = 2.5pt
#let gutter = 8pt
#let marker-width = 4pt

// 条目标题下的职位行：左侧职位，右侧地点 / 所属单位（灰色）
#let role(title, place) = block(above: 0.45em, below: 0.9em, sticky: true, inset: (left: gutter))[
  #title #h(1fr) #text(fill: muted, place)
]

#let resume(lang: "zh", body) = {
  let zh = lang == "zh"
  let serif = if zh {
    ("Libertinus Serif", "Kaiti SC", "Symbols Nerd Font")
  } else {
    ("Libertinus Serif", "Symbols Nerd Font")
  }
  let section-font = if zh { ("Libertinus Serif", "Heiti SC", "Symbols Nerd Font") } else { serif }
  // 中文行距略大，读起来不挤
  let leading = if zh { 0.72em } else { 0.6em }

  set page(margin: (x: 1.2cm, top: 1.2cm, bottom: 1.4cm), numbering: "1/1")
  set text(font: serif, size: 11pt, lang: lang, region: if zh { "cn" } else { none })
  set par(justify: true, leading: leading, spacing: 0.8em)
  set list(
    spacing: leading,
    indent: 0pt,
    marker: box(width: marker-width)[•],
    body-indent: gutter - marker-width,
  )
  // 列表整体不跨页；条目标题、职位行都粘连到后面的内容，保证每个条目完整落在同一页
  show list: it => block(breakable: false, above: leading, below: leading, it)
  show raw: set text(font: "DejaVu Sans Mono")
  show link: set text(fill: accent)

  // 姓名
  show heading.where(level: 1): it => block(above: 0pt, below: 0.45em, text(size: 22pt, it.body))
  // 节标题：下方一条细线
  show heading.where(level: 2): it => block(
    width: 100%,
    above: 1.25em,
    below: 0.65em,
    sticky: true,
    stroke: (bottom: 0.6pt),
    inset: (bottom: 0.3em),
    text(font: section-font, size: 13pt, it.body),
  )
  // 条目标题：浅灰底 + 左侧竖条；底色向两侧外扩，文字与正文左右边线对齐
  show heading.where(level: 3): it => block(
    width: 100%,
    above: 1em,
    below: 0.45em,
    sticky: true,
    fill: tint,
    radius: 3pt,
    outset: (x: 4pt),
    inset: (y: 4pt),
  )[
    #box(stroke: (left: bar-width + muted), inset: (left: gutter))[
      #set text(size: 11pt, weight: "semibold")
      #it.body
    ]
  ]

  body
}
