import { useEffect, useState } from 'react'
import type { Language } from '../content/resumes'

type Theme = 'light' | 'dark'

function readPreference(key: string): string | null {
  try { return localStorage.getItem(key) } catch { return null }
}

function savePreference(key: string, value: string) {
  try { localStorage.setItem(key, value) } catch { /* Optional in private browsers. */ }
}

export function usePreferences() {
  const [language, setLanguage] = useState<Language>(() => {
    const query = new URLSearchParams(window.location.search).get('lang')
    const saved = query ?? readPreference('cv-language')
    return saved === 'en' ? 'en' : 'zh'
  })
  const [theme, setTheme] = useState<Theme>(() => {
    const saved = readPreference('cv-terminal-theme')
    if (saved === 'light' || saved === 'dark') return saved
    return 'dark'
  })
  useEffect(() => {
    savePreference('cv-language', language)
    const url = new URL(window.location.href)
    url.searchParams.set('lang', language)
    window.history.replaceState(null, '', url)
  }, [language])
  useEffect(() => {
    document.documentElement.dataset.theme = theme
    savePreference('cv-terminal-theme', theme)
  }, [theme])
  return { language, setLanguage, theme, toggleTheme: () => setTheme((value) => value === 'light' ? 'dark' : 'light') }
}
