import { readFileSync } from 'node:fs'
import assert from 'node:assert/strict'
import { test } from 'node:test'
import { parseResume } from '../src/content/parseResume.ts'

const read = (name) => readFileSync(new URL(`../../${name}`, import.meta.url), 'utf8')
const chinese = read('cv.regular.typ')
const english = read('cv-en.typ')

for (const [language, source] of [['zh', chinese], ['en', english]]) {
  test(`${language}: all source entries and bullets survive parsing`, () => {
    const resume = parseResume(source)
    const bulletCount = resume.sections.reduce((count, section) =>
      count + section.bullets.length + section.entries.reduce((total, entry) => total + entry.bullets.length, 0), 0)
    const entryCount = resume.sections.reduce((count, section) => count + section.entries.length, 0)
    assert.equal(bulletCount, source.match(/^\s*- /gm).length)
    assert.equal(entryCount, source.match(/^=== /gm).length)
    assert.equal(resume.sections.length, 7)
    assert.equal(resume.contacts[1].url, 'mailto:lindesong666@163.com')
    assert.equal(resume.contacts[1].label, 'lindesong666@163.com')
    assert.equal(resume.sections.find((section) => section.id === 'projects').entries.length, 6)
    assert.doesNotMatch(JSON.stringify(resume), /#(?:style|h|p_underline|sym)/)
  })
}

test('translations preserve section structure, dates, contacts, and repository links', () => {
  const zh = parseResume(chinese)
  const en = parseResume(english)
  assert.deepEqual(zh.contacts, en.contacts)
  assert.deepEqual(zh.sections.map((section) => [section.id, section.bullets.length, section.entries.map((entry) => entry.bullets.length)]),
    en.sections.map((section) => [section.id, section.bullets.length, section.entries.map((entry) => entry.bullets.length)]))
  assert.deepEqual(zh.sections.flatMap((section) => section.entries.map((entry) => entry.repository)),
    en.sections.flatMap((section) => section.entries.map((entry) => entry.repository)))
  assert.deepEqual(zh.sections.flatMap((section) => section.entries.map((entry) => entry.date.replace('至今', 'Present'))),
    en.sections.flatMap((section) => section.entries.map((entry) => entry.date)))
  const education = zh.sections.find((section) => section.id === 'education')
  assert.match(education.entries[0].bullets[0].text, /\*国家自然科学基金\*/)
})

test('unsupported Typst inline directives and missing sections fail instead of dropping facts', () => {
  assert.throws(() => parseResume(chinese.replace('大学英语 CET-6', '#unexpected[CET-6]')), /Unsupported inline/)
  assert.throws(() => parseResume(chinese.replace(/^== #style\.icon\("\\u\{f091\}"\).*$/m, '')), /Expected seven/)
})
