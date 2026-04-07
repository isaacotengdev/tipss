'use client'
import { useState, useEffect } from 'react'
import Image from 'next/image'

const NAV_ITEMS = [
  { label: 'Home', href: '#home' },
  { label: 'About Us', href: '#about' },
  { label: 'Solutions', href: '#solutions' },
  { label: 'FAQ', href: '#faq' },
]

function scrollTo(href: string) {
  if (href === '#home') {
    window.scrollTo({ top: 0, behavior: 'smooth' })
    return
  }
  const el = document.querySelector(href)
  if (el) el.scrollIntoView({ behavior: 'smooth' })
}

export default function Navbar() {
  const [scrolled, setScrolled] = useState(false)
  const [menuOpen, setMenuOpen] = useState(false)

  useEffect(() => {
    const onScroll = () => setScrolled(window.scrollY > 20)
    window.addEventListener('scroll', onScroll, { passive: true })
    return () => window.removeEventListener('scroll', onScroll)
  }, [])

  const handleNav = (href: string) => {
    setMenuOpen(false)
    scrollTo(href)
  }

  return (
    <header
      className={`fixed top-0 left-0 right-0 z-50 transition-all duration-200 ${
        scrolled
          ? 'bg-white/95 backdrop-blur-md shadow-sm border-b border-border-color'
          : 'bg-white/90 backdrop-blur-sm'
      }`}
    >
      <div className="flex items-center justify-between pl-6 pr-8 h-[72px]">
        {/* Logo */}
        <button onClick={() => handleNav('#home')} className="flex-shrink-0 leading-none flex items-center">
          <Image
            src="/images/logo.png"
            alt="Tipss"
            height={68}
            width={320}
            style={{ objectFit: 'contain', height: '68px', width: 'auto', display: 'block' }}
            priority
          />
        </button>

        {/* Desktop Nav */}
        <nav className="hidden md:flex items-center gap-8">
          {NAV_ITEMS.map((item) => (
            <button
              key={item.label}
              onClick={() => handleNav(item.href)}
              className="relative text-sm font-medium text-muted hover:text-brand-green transition-colors group"
            >
              {item.label}
              <span className="absolute -bottom-1 left-0 w-0 h-0.5 bg-brand-green transition-all duration-200 group-hover:w-full rounded-full" />
            </button>
          ))}
          <button
            onClick={() => handleNav('#download')}
            className="bg-brand-green text-white text-sm font-semibold px-5 py-2.5 rounded-full hover:bg-green-600 transition-colors shadow-sm"
          >
            Download Apps
          </button>
        </nav>

        {/* Mobile Hamburger */}
        <button
          className="md:hidden flex flex-col justify-center w-8 h-8 gap-1.5"
          onClick={() => setMenuOpen(!menuOpen)}
          aria-label="Toggle menu"
        >
          <span
            className={`block w-5 h-0.5 bg-foreground transition-all duration-200 origin-center ${
              menuOpen ? 'rotate-45 translate-y-2' : ''
            }`}
          />
          <span
            className={`block w-5 h-0.5 bg-foreground transition-all duration-200 ${
              menuOpen ? 'opacity-0' : ''
            }`}
          />
          <span
            className={`block w-5 h-0.5 bg-foreground transition-all duration-200 origin-center ${
              menuOpen ? '-rotate-45 -translate-y-2' : ''
            }`}
          />
        </button>
      </div>

      {/* Mobile Menu */}
      <div
        className={`md:hidden bg-white border-t border-border-color overflow-hidden transition-all duration-200 ${
          menuOpen ? 'max-h-80 opacity-100' : 'max-h-0 opacity-0'
        }`}
      >
        <div className="px-8 py-4 flex flex-col gap-4">
          {NAV_ITEMS.map((item) => (
            <button
              key={item.label}
              onClick={() => handleNav(item.href)}
              className="text-left text-sm font-medium text-foreground hover:text-brand-green transition-colors"
            >
              {item.label}
            </button>
          ))}
          <button
            onClick={() => handleNav('#download')}
            className="bg-brand-green text-white text-sm font-semibold px-5 py-2.5 rounded-full w-fit hover:bg-green-600 transition-colors"
          >
            Download Apps
          </button>
        </div>
      </div>
    </header>
  )
}
