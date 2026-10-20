import type { ResumeEntry, ResumeSectionData } from '../content/parseResume'
import { RichText } from './RichText'
import '../styles/sections.css'

function BulletList({ entry }: { entry: ResumeEntry }) {
  return <ul className="bullet-list">{entry.bullets.map((bullet, index) => (
    <li key={index}><span><RichText text={bullet.text} /></span>{bullet.date && <time>{bullet.date}</time>}</li>
  ))}</ul>
}

function Entry({ entry, sectionId }: { entry: ResumeEntry; sectionId: string }) {
  return <article className={`resume-entry ${sectionId === 'projects' ? 'project-entry' : ''}`}>
    <div className="entry-heading"><h3>{entry.title}</h3>{entry.date && <time>{entry.date}</time>}</div>
    {entry.role && <p className="entry-meta"><span>{entry.role}</span><span>{entry.organization}</span></p>}
    {entry.repository && <a className="repository-link" href={entry.repository.url} target="_blank" rel="noreferrer">
      {entry.repository.url.replace('https://', '')}
    </a>}
    {entry.bullets.length > 0 && <BulletList entry={entry} />}
  </article>
}

export function ResumeSection({ section }: { section: ResumeSectionData }) {
  return (
    <section id={section.id} className={`resume-section section-${section.id}`} aria-labelledby={`${section.id}-title`}>
      <h2 id={`${section.id}-title`}>{section.title}</h2>
      {section.id === 'skills' ? <dl className="skills-list">
        {section.bullets.map((bullet) => {
          const [, title, description] = bullet.match(/^\*([^*]+)\*[：:]?\s*(.*)$/) ?? []
          return <div key={bullet}>
            <dt>{title.replace(/:$/, '')}</dt>
            <dd>{description}</dd>
          </div>
        })}
      </dl> : section.bullets.length > 0 && <ul className="bullet-list">
        {section.bullets.map((bullet) => <li key={bullet}><RichText text={bullet} /></li>)}
      </ul>}
      {section.entries.map((entry) => <Entry key={entry.title} entry={entry} sectionId={section.id} />)}
    </section>
  )
}
