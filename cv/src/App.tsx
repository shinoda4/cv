import { useEffect } from 'react'
import portrait from '../../assets/me.jpg'
import { resumes, type Language } from './content/resumes'
import { labels } from './content/labels'
import { ResumeSection } from './components/ResumeSection'
import { usePreferences } from './hooks/usePreferences'
import './App.css'
import './styles/print.css'

function App() {
  const { language, setLanguage, theme, toggleTheme } = usePreferences()
  const resume = resumes[language]
  const t = labels[language]

  useEffect(() => {
    document.documentElement.lang = language === 'zh' ? 'zh-CN' : 'en'
    document.title = `${resume.name} · ${t.title}`
    document.querySelector('meta[name="description"]')?.setAttribute('content', resume.sections[0].bullets.join(' · '))
  }, [language, resume, t.title])

  return (
    <div className="resume">
      <a className="skip-link" href="#main">{t.skip}</a>
      <header className="site-header">
        <div className="language-switch" role="group" aria-label={t.language}>
          {(['zh', 'en'] as Language[]).map((locale) => (
            <button key={locale} type="button" lang={locale === 'zh' ? 'zh-CN' : 'en'}
              aria-pressed={language === locale} onClick={() => setLanguage(locale)}>
              {locale === 'zh' ? '中文' : 'English'}
            </button>
          ))}
        </div>
        <div className="header-actions">
          <button type="button" onClick={toggleTheme}
            aria-label={theme === 'light' ? t.dark : t.light}>
            {theme === 'light' ? t.darkLabel : t.lightLabel}
          </button>
          <a className="header-download" href={resume.pdf}
            download={language === 'zh' ? '林德松-简历.pdf' : 'Tesung-Lin-CV.pdf'}>{t.download}</a>
        </div>
      </header>
      <main id="main" tabIndex={-1}>
        <section id="profile" className="profile-section" aria-labelledby="profile-title">
          <div className="profile-heading">
            <div>
              <h1 id="profile-title">{language === 'zh' ? resume.name.replace(' Tesung Lin', '') : resume.name}</h1>
              <p className="name-caption">{language === 'zh' ? 'Tesung Lin' : '林德松'}</p>
              <p className="profile-location">{resume.location}</p>
            </div>
            <img className="portrait" src={portrait} alt={resume.name} width={100} height={121} fetchPriority="high" />
          </div>
          <div className="profile-description">
            {resume.sections[0].bullets.map((bullet) => <p key={bullet}>{bullet}</p>)}
          </div>
          <address className="contact-list">
            {resume.contacts.map((contact) => (
              <a href={contact.url} key={contact.url}
                {...(contact.url.startsWith('https:') ? { target: '_blank', rel: 'noreferrer' } : {})}>
                {contact.label}
              </a>
            ))}
          </address>
        </section>
        <nav className="section-navigation" aria-label={t.navigation}>
          {resume.sections.slice(1).map((section) => (
            <a key={section.id} href={`#${section.id}`}>{section.title}</a>
          ))}
        </nav>
        {resume.sections.slice(1).map((section) => (
          <ResumeSection key={`${language}-${section.id}`} section={section} />
        ))}
      </main>
      <footer className="site-footer">
        <a href="https://github.com/shinoda4/cv" target="_blank" rel="noreferrer">{t.source}</a>
        <a href="#profile">{t.top}</a>
      </footer>
    </div>
  )
}

export default App
