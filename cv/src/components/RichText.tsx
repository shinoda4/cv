export function RichText({ text }: { text: string }) {
  return text.split(/(\*[^*]+\*|`[^`]+`)/g).map((part, index) => {
    if (part.startsWith('*')) return <strong key={index}>{part.slice(1, -1)}</strong>
    if (part.startsWith('`')) return <code key={index}>{part.slice(1, -1)}</code>
    return part
  })
}
