#import "style.typ"

#set page(
  margin: (x: 0.9cm, y: 1.3cm),
  numbering: "1/1",
)
#set text(
  font: ("Libertinus Serif", "Symbols Nerd Font"),
  size: 11pt,
  lang: "en",
)
#set par(justify: true)
#show link: underline
#show raw: set text(font: "DejaVu Sans Mono")
#show heading.where(level: 1): set text(size: 22pt)
#show heading.where(level: 3): it => {
  set block(above: 0.8em, below: 0.8em)
  block(
    fill: rgb("#f6f7f9"),
    inset: (y: 5pt, x: 5pt),
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
  columns: (1fr, auto),
  gutter: 1em,
  align: (left + horizon, right + horizon),
  [
    = #box(baseline: 0.7em, image("assets/rustacean-flat-happy.svg", height: 2em)) Tesung Lin #box(baseline: 0.7em, image("assets/Go.svg", height: 2em))
    == \u{f450} China \u{f444} Beijing
  ],
  [#image("assets/me.jpg", height: 8em)],
)

== \u{ef69} Profile
#style.chiline()
#grid(
  columns: 2,
  gutter: 1em,
  [
    - Phone #link("tel:18763386500")[(+86) 18763386500]
    - Email #link("mailto:lindesong666\@163.com")[lindesong666\@163.com]
    - GitHub #link("https://github.com/shinoda4")[github.com/shinoda4]
    - Website #link("https://desonglll.lindesong666.deno.net")[desonglll.xyz]
  ],
  [
    - FDE / full-stack engineer delivering AI products from requirements to production
    - Strong in structured AI-assisted engineering (Vibe Coding) and rapid cross-stack delivery
    - Experienced in gRPC, LLM gateways, container delivery, and incident response
  ],
)

== \u{efcc} Technology
#style.chiline()
- Languages: Rust, Python, TypeScript, Go | Swift (AI-assisted / Vibe Coding)
- Client / Web: SwiftUI, React | gRPC, REST, SSE
- Data: PostgreSQL, Redis
- AI Engineering: LLM gateways, model routing, streaming inference | structured AI collaboration
- Delivery: Docker, Kubernetes, Git, Shell | macOS, Linux
- English: CET-6

== \u{ef23} Education
#style.chiline()
=== Qufu Normal University - MEng in Software Engineering (ongoing) #h(1fr) 2024/09 -- 2027/06
- Official Reviewer, International Joint Conference on Neural Networks (IJCNN 2026, WCCI, IEEE CIS)
- Contributed to a National Natural Science Foundation of China grant proposal
- Coursework: Software Architecture, Requirements Engineering, Distributed Systems, Deep Learning

=== Qufu Normal University - BEng in Software Engineering #h(1fr) 2020/09 -- 2024/06
- Coursework: C/C++, Data Structures, Computer Architecture, Operating Systems, Computer Networks
- Served as vice president of the school student union and head of its organization department

== \u{f0b1} Experience
#style.chiline()

=== Beijing Dimension Gate Technology Co., Ltd. #h(1fr) 2026/07 -- Present
FDE (Forward Deployed Engineer) #h(1fr) Beijing, China

- *End-to-end AI delivery:* Translate meeting intelligence and AI reading requirements into client, API contract, gateway, and console capabilities; own solution design, implementation, integration, release, and production issue closure.
- *AI client products:* Primary contributor to MinuteX for iOS / macOS and Readoow for iOS, covering live transcription, meeting summaries, voiceprints, AI reading, and streaming chat while integrating shared Protobuf contracts across clients.
- *Platform and delivery tools:* Contribute across a Rust LLM gateway, React console, Go platform services, and Kubernetes operations tooling, closing gaps in model integration, access control, image management, deployment, and troubleshooting.

#pagebreak()
=== SiliconFlow Technology Co., Ltd. #h(1fr) 2026/03 -- 2026/06
R&D Intern #h(1fr) Beijing, China

- *CCE:* Built ComfyUI environment and image packaging workflows for batch plugin cloning, dependency merging, Docker image builds, and verified multi-source model downloads.
- *ComfyAgent:* Developed a FastAPI ComfyUI gateway with request processing and output caching.
- *BizyDeploy:* Developed a cloud-function deployment CLI and reusable workflow engine with configuration merging and automated deployment.
- *BizyEngine:* Extended the ComfyUI server with model/dataset APIs, API key authentication, third-party integrations, and conversation coordination.

=== Baichen Technology Co., Ltd. #h(1fr) 2025/12 -- 2026/03
Backend Delivery Engineer / Technical Support #h(1fr) Beijing, China

- Supported government and defense-sector proposals and private delivery into isolated networks, including server setup, Docker image migration, and database initialization.
- Handled on-site support and incident response, automating log inspection and backups with Shell scripts.

=== #link("https://github.com/ShundeMachinery/")[Shunde Machinery Parts Co., Ltd.] #h(1fr) 2023/02 -- Present
Technical Support (Long-term Part-time) #h(1fr) Rizhao, Shandong, China

- *Product catalog platform:* Independently delivered the product management console, showcase website, Spring Boot API, and iOS client, owning requirements, full-stack development, deployment, and long-term support.
- *Core capabilities:* Modeled products, machine models, and fitment relationships for heavy-machinery parts, with search, image management, access control, and PostgreSQL backup and recovery.
- *Core module rewrite (Rust FFI):* Reimplemented a high-frequency inventory calculation in Rust and exposed it to Django through FFI after the original endpoint began timing out.

== \u{efbe} Projects
#style.chiline()

=== MinuteX / Readoow - AI Meeting and Reading Clients #h(1fr) 2026/07 -- Present
*FDE / Client Engineer* #h(1fr) Beijing Dimension Gate Technology Co., Ltd.

- Primary developer across MinuteX for iOS / macOS and Readoow for iOS, delivering recording, multi-speaker live transcription, resumable summaries, voiceprints, AI reading, streaming chat, and learning flows.
- Used SwiftUI, AVFoundation, and gRPC to integrate shared Protobuf contracts and backend services; handled audio interruptions, background execution, data recovery, contract upgrades, and TestFlight releases.

=== LLM Gateway / Console / Image Hub - AI Platform Tools #h(1fr) 2026/07 -- Present
*FDE / Full-stack Engineer* #h(1fr) Beijing Dimension Gate Technology Co., Ltd.

- Extended a Rust LLM gateway with chat, translation, TTS, voice cloning, and ASR providers, plus channel selection, quota and usage tracking, request logs, diagnostics, and OpenAI-compatible APIs.
- Delivered React / TypeScript administration flows and Go platform APIs for models, tokens, administrators, fine-grained permissions, and image repositories, bringing configuration, release, and troubleshooting into one console.

#pagebreak()
=== sync-k8s / Deploy CLI - Kubernetes Delivery Tools #h(1fr) 2026/07 -- Present
*FDE / Engineering Tools Developer* #h(1fr) Beijing Dimension Gate Technology Co., Ltd.

- Contributed user groups, resource-level authorization, auditing, and management integration to a Go multi-cluster platform that mirrors Kubernetes resources into PostgreSQL for search, live operations, and GitOps delivery.
- Primary developer of a Rust CLI for resource queries, logs and events, health monitoring, release preflight, batch deployment, and rollback, supporting day-to-day releases and incident diagnosis from the terminal.

=== #link("https://github.com/desonglll/FocusBoard")[FocusBoard] - Smart macOS Task Manager #h(1fr) 2026/08
*Independent Developer* #h(1fr) Personal Project

- Built a native SwiftUI three-column workspace that turns natural language into scheduled, prioritized action steps; supports OpenAI-compatible services and falls back to local rules when AI is unavailable.
- Kept data local with Keychain-protected API keys, versioned backups, corruption recovery, and regression tests for parsing, state transitions, configuration migration, and persistence.

== \u{e20f} Professional Skills
#style.chiline()

- *Clients and communication:* SwiftUI, iOS audio and lifecycle resilience; cross-platform Protobuf / gRPC contracts, streaming responses, authentication, and compatibility handling.
- *Backend and data:* Asynchronous Rust / Python APIs and LLM gateways; PostgreSQL / Redis data modeling, state management, and production recovery.
- *Engineering delivery:* Docker / Kubernetes integration and Shell release automation; structured AI-assisted implementation validated through tests, code review, and device checks.

== \u{ed99} Academic Service
#style.chiline()
- DFA-SAGE: A Dual-Fusion Aggregation Graph Sampling and Embedding Model for Enhanced Intrusion Detection (major revision at Computer Networks)
- Official Reviewer, IJCNN 2026 (WCCI, IEEE CIS flagship conference)

== \u{f091} Honors and Awards
#style.chiline()

=== Software Copyrights
- AX - Rust Full-stack Social Media System (2026SR0178137) #h(1fr) 2026/01
- E-Heyuan Campus Services Platform (2023SR0235691) #h(1fr) 2023/02
- Party and Youth League Assistant (2023SR0137018) #h(1fr) 2023/01

=== Competitions
- China Mobile Wutong Cup Digital Innovation Competition, Shandong 2nd Place (national finalist) #h(1fr) 2026/02
- National College Mathematics Competition, Shandong 1st Prize (national finalist) #h(1fr) 2023/11
- Shandong Collegiate Software Design Contest, Provincial 2nd Prize (Party Assistant) #h(1fr) 2022/11
- Shandong Collegiate Software Design Contest, Provincial 2nd Prize (Jixu You Ning) #h(1fr) 2022/11
- Shandong Collegiate Software Design Contest, Provincial 2nd Prize (Dang Bang Bang) #h(1fr) 2021/11

=== Distinctions
- Outstanding Graduate of Shandong Province | Qufu Normal University #h(1fr) 2023 -- 2024
- Graduate Scholarship (2024) | Undergraduate Scholarships (2021, 2022, 2023) #h(1fr) 2021 -- 2024
