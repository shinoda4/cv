export interface ResumeBullet {
  text: string
  date?: string
}

export interface ResumeEntry {
  title: string
  date: string
  role?: string
  organization?: string
  repository?: { url: string; label: string }
  bullets: ResumeBullet[]
}

export interface ResumeSectionData {
  id: string
  title: string
  bullets: string[]
  entries: ResumeEntry[]
}

export interface ResumeData {
  name: string
  location: string
  contacts: { url: string; label: string }[]
  sections: ResumeSectionData[]
}

const sectionIds = ['profile', 'skills', 'education', 'experience', 'projects', 'academic', 'awards']

// Supports the repository's documented resume format, not arbitrary Typst.
// New inline directives fail loudly instead of leaking into the website.
function cleanInline(value: string): string {
  const cleaned = value
    .replace(/#p_underline\(\)\[([^\]]+)\]/g, '$1')
    .replace(/#sym\.dot\.op/g, '·')
    .replace(/\\@/g, '@')
    .replace(/ -- /g, ' — ')
    .trim()
  if (/#(?:[a-zA-Z]|\{)/.test(cleaned)) {
    throw new Error(`Unsupported inline Typst syntax: ${cleaned}`)
  }
  return cleaned
}

function plain(value: string): string {
  return cleanInline(value).replace(/[*`]/g, '')
}

function splitDate(value: string): ResumeBullet {
  const [text, date] = value.split('#h(1fr)')
  return { text: cleanInline(text), ...(date ? { date: plain(date) } : {}) }
}

export function parseResume(source: string): ResumeData {
  const name = source.match(/^\s*=\s+(.+)$/m)?.[1]
  const location = source.match(/#style\.location\[([^\]]+)\]/)?.[1]
  if (!name || !location) throw new Error('Resume name or location is missing')

  const contacts = Array.from(source.matchAll(
    /#style\.contact\([^,]+,\s*link\("([^"]+)"\)\[([^\]]+)\]\)/g,
  ), ([, url, label]) => ({ url, label: plain(label) }))
  if (contacts.length !== 4) throw new Error('Expected four resume contacts')

  const sections: ResumeSectionData[] = []
  let section: ResumeSectionData | undefined
  let entry: ResumeEntry | undefined

  for (const line of source.split('\n')) {
    const heading = line.match(/^== #style\.icon\("[^"]+"\) (.+)$/)
    if (heading) {
      const id = sectionIds[sections.length]
      if (!id) throw new Error('Unexpected resume section')
      section = { id, title: plain(heading[1]), bullets: [], entries: [] }
      sections.push(section)
      entry = undefined
      continue
    }
    if (!section) continue
    if (line.startsWith('=== ')) {
      const repository = line.match(/#style\.repo\("([^"]+)", "([^"]+)"\)/)
      const heading = splitDate(line.slice(4).replace(/#style\.repo\("[^"]+", "[^"]+"\)/, ''))
      entry = {
        title: plain(heading.text), date: heading.date ?? '', bullets: [],
        ...(repository ? { repository: { url: repository[1], label: repository[2] } } : {}),
      }
      section.entries.push(entry)
      continue
    }
    const role = line.match(/^#style\.role\[([^\]]+)\]\[([^\]]+)\]/)
    if (role && entry) {
      entry.role = plain(role[1])
      entry.organization = plain(role[2])
      continue
    }
    const bullet = line.match(/^\s*- (.+)$/)
    if (bullet) {
      if (entry) entry.bullets.push(splitDate(bullet[1]))
      else section.bullets.push(cleanInline(bullet[1]))
    }
  }
  if (sections.length !== sectionIds.length) throw new Error('Expected seven resume sections')
  return { name: plain(name), location: plain(location), contacts, sections }
}
