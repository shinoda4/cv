#import "style.typ"
#show: style.resume.with(lang: "en")

#grid(
  columns: (1fr, auto),
  gutter: 1em,
  align: (left + horizon, right + horizon),
  [
    = Tesung Lin
    #style.location[Beijing, China]
  ],
  [#image("assets/me.jpg", height: 8em)],
)

== #style.icon("\u{f007}") Profile
#grid(
  columns: 2,
  gutter: 1em,
  [
    #style.contact("\u{f095}", link("tel:18763386500")[(+86) 18763386500]) \
    #style.contact("\u{f0e0}", link("mailto:lindesong666@163.com")[lindesong666\@163.com]) \
    #style.contact("\u{f09b}", link("https://github.com/shinoda4")[github.com/shinoda4]) \
    #style.contact("\u{f0ac}", link("https://desonglll.lindesong666.deno.net")[desonglll.xyz])
  ],
  [
    - FDE / full-stack engineer shipping AI products from zero to one in an AI-native team
    - Daily Claude Code / Codex user covering clients, backend, gateway, and deployment
    - Contract-first, documented, verified changes with rollback-ready releases
  ],
)

== #style.icon("\u{f121}") Professional Skills
- *AI-assisted development:* Claude Code / Codex as the primary workflow; split work into small, verifiable tasks run in parallel across agents and worktrees, with conventions, contracts, and tests keeping AI output fast to ship and maintainable.
- *Backend and data:* Go, Rust (axum / SQLx), Java (Spring Boot), Python (FastAPI), Node.js; PostgreSQL / Redis data modeling and failure recovery.
- *Clients and communication:* React / TypeScript, SwiftUI; Protobuf / gRPC contracts, REST, SSE, WebSocket.
- *Infrastructure:* Docker, Kubernetes, GitLab CI, GitOps releases and rollbacks; OpenTelemetry and structured logs.
- *AI engineering:* LLM gateways, multi-model routing and billing, streaming inference and realtime ASR, MCP servers.
- *English:* CET-6

== #style.icon("\u{f19d}") Education
=== Qufu Normal University - MEng in Software Engineering (ongoing) #h(1fr) 2024/09 -- 2027/06
- Contributed to a National Natural Science Foundation of China grant proposal

=== Qufu Normal University - BEng in Software Engineering #h(1fr) 2020/09 -- 2024/06

== #style.icon("\u{f0b1}") Experience

=== Beijing Dimension Gate Technology Co., Ltd. #h(1fr) 2026/07 -- Present
#style.role[FDE (Forward Deployed Engineer)][Beijing, China]

- *AI-native engineering:* Work with Claude Code / Codex as the primary workflow, keeping AI output in check with project conventions, Protobuf contracts, dev logs, and targeted tests; 1,400+ commits across 12 repositories in about four months, spanning iOS, web, Go / Rust services, and Kubernetes releases.
- *Product delivery:* Core developer of MinuteX (AI meeting notes), leading the iOS client and owning major backend modules to bring the product from prototype to launch-ready; also contributed to the Readoow (AI reading) iOS app.
- *Platform infrastructure:* Lead developer of the LLM gateway and contributor to the multi-cluster Kubernetes and GitOps release platform, giving the team unified model access, billing, auditing, and releases.

=== SiliconFlow Technology Co., Ltd. #h(1fr) 2026/03 -- 2026/06
#style.role[R&D Intern][Beijing, China]

- *CCE:* Built ComfyUI environment and image packaging workflows for batch plugin cloning, dependency merging, Docker image builds, and verified multi-source model downloads.
- *ComfyAgent:* Contributed to a FastAPI ComfyUI gateway, working on request processing and output caching.
- *BizyDeploy:* Developed a cloud-function deployment CLI and reusable workflow engine with configuration merging and automated deployment.
- *BizyEngine:* Extended the ComfyUI server with model/dataset APIs, API key authentication, third-party integrations, and conversation coordination.

=== Shunde Machinery Parts Co., Ltd. #h(1fr) 2023/02 -- Present
#style.role[Technical Architecture Consultant / Technical Support (Long-term Part-time)][Rizhao, Shandong, China]

- *Digital systems:* As the company's technical architecture consultant, independently own the architecture and delivery of its software: product management console, showcase website, Spring Boot API, and iOS client, covering requirements, technology choices, deployment, and long-term operations.
- *Core module rewrite (Rust FFI):* Reimplemented a high-frequency inventory calculation in Rust and exposed it to Django through FFI after the original endpoint began timing out.

=== Baichen Technology Co., Ltd. #h(1fr) 2025/12 -- 2026/03
#style.role[Backend Delivery Engineer / Technical Support][Beijing, China]

- Supported government and defense-sector proposals and private delivery into isolated networks, covering server setup, Docker image migration, database initialization, and on-site incident response, with log inspection and backups automated in Shell.

== #style.icon("\u{f07c}") Projects

=== MinuteX - AI Meeting Notes #h(1fr) 2026/07 -- Present
#style.role[Core Developer (iOS / Backend / Web / Deployment)][Beijing Dimension Gate Technology Co., Ltd.]

- *iOS client (SwiftUI):* Led development of recording, multi-speaker live transcription, voiceprints, AI notes, and chat; handled background recording, Live Activities, and interruption recovery so long sessions never lose audio, and shipped through TestFlight.
- *Backend and delivery (Go + PostgreSQL + Redis):* Orchestrated transcription, summary, and knowledge-graph AI agents over Buf / gRPC contracts, owning the recording pipeline, durable jobs, and recovery of abnormal recordings; contributed to the web app and released to Kubernetes via GitLab CI and GitOps.
- *Signboard operations dashboard:* Went from empty repository to login, dashboards, image CI, and internal deployment in a single day with AI pair programming, then grew it into a modular host for multiple products.

=== LLM Gateway - Unified Model Gateway #h(1fr) 2026/07 -- Present
#style.role[Lead Developer][Beijing Dimension Gate Technology Co., Ltd.]

- Built in Rust (axum / tokio / SQLx), exposing OpenAI-, Anthropic-, and Gemini-compatible APIs over DashScope, Volcengine, Azure, and other upstreams for chat, translation, TTS, and realtime ASR; centralizes authentication, quota billing, request auditing, and tracing, and serves every MinuteX AI agent.
- Led the data-layer migration from Diesel to SQLx and redrew module boundaries between inbound protocols and upstream adapters so new models plug in cleanly; built the matching React console pages for models, channels, tokens, quota approvals, and request audits.

=== Platform Infrastructure - Multi-cluster Kubernetes and GitOps #h(1fr) 2026/07 -- Present
#style.role[Contributor][Beijing Dimension Gate Technology Co., Ltd.]

- Added fine-grained RBAC, audit logging, and personal access tokens to sync-k8s, a multi-cluster platform that mirrors resources into PostgreSQL and releases and rolls back from a Git repository; developed platformctl, a Rust CLI for resource queries, health checks, releases, and rollbacks from the terminal.

=== Shunde Business Platform - Parts ERP and AI Data Assistant #style.repo("https://github.com/ShundeMachinery", "ShundeMachinery") #h(1fr) 2026/07 -- Present
#style.role[Sole Developer][Shunde Machinery Parts Co., Ltd.]

- *Business system:* Built single-handedly with AI in about three months: a Spring Boot (Java 25) + PostgreSQL backend and React console that grew from the product catalog and machine fitment into inventory, purchasing, sales, manufacturing, and receivables, with Feishu sign-in, org sync, and approval flows.
- *AI data assistant:* Developed an MCP server that lets AI tools such as Codex query business data read-only under each user's permissions via OAuth; on top of it, built an in-app AI assistant that interprets the question, fetches data through MCP, and verifies the answer independently, citing sources and re-checking permissions before replying.

=== Echo Gate - Self-hosted Team Messaging #style.repo("https://github.com/desonglll/chat_room", "desonglll/chat_room") #h(1fr) 2026/08 -- Present
#style.role[Sole Developer][Personal Project]

- Built a real-time messaging service in Rust (axum / SQLx) with rooms as the authorization boundary: rooms and direct messages, replies, edits, recalls, resumable attachments, favorites, and AI threads with citations and room-authorized retrieval; React web and PySide6 desktop clients share one API, and deployments range from single-node SQLite to PostgreSQL + Redis + Qdrant.
- Developed with parallel AI agents: one task per worktree, each with its own dev log, and an integration lead merging shared modules; 400 commits in two months, plus a stress-test tool that reports throughput and P95 / P99 latency.

=== Ax - Rust Full-stack Micro-blogging System #style.repo("https://github.com/desonglll/ax", "desonglll/ax") #h(1fr) 2024/08 -- Present
#style.role[Sole Developer][Personal Project]

- Built with Rust (Actix-web / SQLx with compile-time checked SQL), PostgreSQL, and Vue 3: posts, comments, likes, follows, notifications, and attachments, with database triggers keeping counters and notifications consistent and optional OpenAI-compatible auto-titling; registered as a software copyright.

== #style.icon("\u{f02d}") Academic Service
- DFA-SAGE: A Dual-Fusion Aggregation Graph Sampling and Embedding Model for Enhanced Intrusion Detection (accepted, Computer Networks, CCF-B journal)
- Official Reviewer, IJCNN 2026 (WCCI, IEEE CIS flagship conference)

== #style.icon("\u{f091}") Honors and Awards

=== Software Copyrights
- AX - Rust Full-stack Social Media System (2026SR0178137) #h(1fr) 2026/01
- E-Heyuan Campus Services Platform (2023SR0235691) #h(1fr) 2023/02
- Party and Youth League Assistant (2023SR0137018) #h(1fr) 2023/01

=== Competitions
- China Mobile Wutong Cup Digital Innovation Competition, Shandong 2nd Place (national finalist) #h(1fr) 2026/02
- National College Mathematics Competition, Shandong 1st Prize (national finalist) #h(1fr) 2023/11
- Shandong Collegiate Software Design Contest, Provincial 2nd Prize ×3 #h(1fr) 2021 -- 2022

=== Distinctions
- Outstanding Graduate of Shandong Province | Qufu Normal University #h(1fr) 2023 -- 2024
- Graduate Scholarship (2024) | Undergraduate Scholarships (2021, 2022, 2023) #h(1fr) 2021 -- 2024
