import chineseSource from '../../../cv.regular.typ?raw'
import englishSource from '../../../cv-en.typ?raw'
import chinesePdf from '../../../cv.regular.pdf?url'
import englishPdf from '../../../cv-en.pdf?url'
import { parseResume } from './parseResume'

export type Language = 'zh' | 'en'

export const resumes = {
  zh: { ...parseResume(chineseSource), pdf: chinesePdf },
  en: { ...parseResume(englishSource), pdf: englishPdf },
}
