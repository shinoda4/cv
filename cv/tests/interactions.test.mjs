import { test } from 'node:test'
import assert from 'node:assert/strict'
import { Window } from 'happy-dom'
import { createServer } from 'vite'
import { act, createElement } from 'react'

// Simulated DOM verification; this does not replace visual browser checks.
test('complete resume, language, theme preferences, PDF downloads, and section links', async () => {
  const browser = new Window({ url: 'http://localhost:5173/' })
  for (const key of ['window', 'document', 'navigator', 'localStorage', 'HTMLElement', 'Element', 'Node']) {
    Object.defineProperty(globalThis, key, { configurable: true, value: key === 'window' ? browser : browser[key] })
  }
  globalThis.IS_REACT_ACT_ENVIRONMENT = true
  const server = await createServer({ server: { middlewareMode: true }, appType: 'custom' })
  let root
  try {
    const { createRoot } = await import('react-dom/client')
    const { default: App } = await server.ssrLoadModule('/src/App.tsx')
    document.body.innerHTML = '<div id="root"></div>'
    root = createRoot(document.getElementById('root'))
    await act(async () => root.render(createElement(App)))
    const button = (label) => [...document.querySelectorAll('button')].find((node) =>
      node.textContent.trim() === label || node.getAttribute('aria-label') === label)
    const click = async (element) => {
      assert.ok(element, 'Control must exist')
      await act(async () => element.click())
    }

    assert.equal(document.documentElement.lang, 'zh-CN')
    assert.equal(document.querySelectorAll('main section[id]').length, 7)
    assert.equal(document.querySelectorAll('.project-entry').length, 6)
    assert.equal(document.querySelectorAll('.project-entry li').length, 11)
    assert.match(document.querySelector('.header-download').href, /cv\.regular\.pdf/)
    for (const link of document.querySelectorAll('.section-navigation a')) {
      assert.ok(document.querySelector(link.hash), `${link.hash} must resolve to a section`)
    }
    assert.ok(document.querySelector('a[href="https://github.com/shinoda4"]'))
    assert.ok(document.querySelector('a[href="mailto:lindesong666@163.com"]'))

    await click(button('English'))
    assert.equal(document.documentElement.lang, 'en')
    assert.equal(localStorage.getItem('cv-language'), 'en')
    assert.equal(new URL(window.location.href).searchParams.get('lang'), 'en')
    assert.match(document.title, /Tesung Lin/)
    assert.match(document.querySelector('.header-download').href, /cv-en\.pdf/)
    assert.equal(document.querySelectorAll('.project-entry li').length, 11)
    assert.equal(document.documentElement.dataset.theme, 'dark')
    await click(button('Switch to light theme'))
    assert.equal(document.documentElement.dataset.theme, 'light')
    assert.equal(localStorage.getItem('cv-terminal-theme'), 'light')
    await click(button('Switch to dark theme'))
    assert.equal(document.documentElement.dataset.theme, 'dark')
  } finally {
    if (root) await act(async () => root.unmount())
    await server.close()
    await browser.happyDOM.close()
  }
})
