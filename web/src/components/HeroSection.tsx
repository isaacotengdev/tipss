'use client'
import Image from 'next/image'

function scrollTo(href: string) {
  const el = document.querySelector(href)
  if (el) el.scrollIntoView({ behavior: 'smooth' })
}

export default function HeroSection() {
  return (
    <section
      id="home"
      className="bg-[#F0FAF5] pt-[68px] min-h-screen flex flex-col md:flex-row"
    >
      {/* Left — Text */}
      <div className="flex-1 flex items-center px-6 md:px-20 py-16 md:py-0">
        <div className="max-w-xl">
          {/* Eyebrow */}
          <div className="inline-flex items-center gap-2 px-4 py-1.5 rounded-full border border-brand-green/30 bg-brand-green/10 mb-6">
            <span className="text-brand-green text-xs font-semibold tracking-wide font-sans">
              ✦ Empowering the service economy
            </span>
          </div>

          {/* Headline */}
          <h1 className="font-display font-extrabold text-5xl md:text-6xl text-foreground leading-tight mb-5">
            Tipping for the{' '}
            <span className="text-brand-green">Modern Economy</span>
          </h1>

          {/* Subheadline */}
          <p className="text-muted-light text-lg leading-relaxed mb-10 max-w-md">
            Two apps. One platform. Whether you&apos;re a solo creator or a growing
            business — Tipss makes tipping seamless, fair, and instant.
          </p>

          {/* CTAs */}
          <div className="flex flex-wrap gap-4 mb-10">
            <button
              onClick={() => scrollTo('#download')}
              className="flex items-center gap-2 bg-brand-green text-white font-semibold px-6 py-3 rounded-full hover:bg-green-600 transition-colors shadow-md"
            >
              <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4" />
              </svg>
              Download TipMe
            </button>
            <button
              onClick={() => scrollTo('#download')}
              className="flex items-center gap-2 border-2 border-brand-purple text-brand-purple font-semibold px-6 py-3 rounded-full hover:bg-brand-purple/5 transition-colors"
            >
              <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4" />
              </svg>
              Try TipBiz
            </button>
          </div>

          {/* Trust Badges */}
          <div className="flex flex-wrap gap-6">
            {[
              { icon: '📱', label: 'iOS & Android' },
              { icon: '🔒', label: 'Secure Payments' },
              { icon: '⚡', label: 'Instant Payouts' },
            ].map((badge) => (
              <div key={badge.label} className="flex items-center gap-2 text-muted-light text-sm font-medium">
                <span>{badge.icon}</span>
                <span>{badge.label}</span>
              </div>
            ))}
          </div>
        </div>
      </div>

      {/* Right — Image */}
      <div className="flex-1 relative min-h-[320px] md:min-h-0">
        <Image
          src="/images/cs-psi-pay-thumbnail.jpg"
          alt="Service worker receiving a digital tip"
          fill
          style={{ objectFit: 'cover' }}
          priority
          sizes="(max-width: 768px) 100vw, 50vw"
        />
      </div>
    </section>
  )
}
