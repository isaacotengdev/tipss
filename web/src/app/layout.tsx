import type { Metadata } from 'next'
import { Inter, Nunito } from 'next/font/google'
import './globals.css'

const inter = Inter({
  subsets: ['latin'],
  variable: '--font-inter',
})

const nunito = Nunito({
  subsets: ['latin'],
  weight: ['400', '600', '700', '800'],
  variable: '--font-nunito',
})

export const metadata: Metadata = {
  title: 'Tipss — Empowering the Service Economy',
  description:
    'Tipss is a digital tipping platform with two apps: TipMe for individuals to receive tips cashlessly, and TipBiz for businesses to manage tip pooling automatically.',
  keywords: ['tipping', 'digital tips', 'TipMe', 'TipBiz', 'service economy', 'cashless tipping'],
  openGraph: {
    title: 'Tipss — Empowering the Service Economy',
    description: 'Two apps. One platform. Tipping for the modern economy.',
    url: 'https://tipss.io',
    siteName: 'Tipss',
    type: 'website',
  },
  themeColor: '#0DAF5C',
}

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en" className={`${inter.variable} ${nunito.variable}`}>
      <body>{children}</body>
    </html>
  )
}
