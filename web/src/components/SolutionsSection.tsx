export default function SolutionsSection() {
  const products = [
    {
      name: 'TipMe',
      tagline: 'Your personal tipping link, ready in seconds.',
      description:
        'TipMe gives every individual a simple, shareable way to receive tips. Generate your unique QR code, share your link, and get paid — with no cash, no awkwardness, and zero fees for recipients.',
      highlights: [
        'Instant payouts to your bank',
        'Share via QR code or link',
        'Zero fees for recipients',
      ],
      accent: '#0DAF5C',
      gradientFrom: '#0DAF5C',
      gradientTo: '#00E676',
      icon: (
        <svg className="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
        </svg>
      ),
    },
    {
      name: 'TipBiz',
      tagline: 'Automated tip pooling for modern businesses.',
      description:
        'TipBiz gives businesses full control over how tips are collected and distributed. Set your pooling rules once, and let TipBiz handle the rest — transparently, fairly, and with a complete audit trail.',
      highlights: [
        'Automated pool distribution',
        'Multi-location support',
        'Transparent reporting',
      ],
      accent: '#8B5CF6',
      gradientFrom: '#8B5CF6',
      gradientTo: '#A78BFA',
      icon: (
        <svg className="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4" />
        </svg>
      ),
    },
  ]

  return (
    <section id="solutions" className="bg-white py-24 px-6 md:px-20">
      <div className="max-w-6xl mx-auto">
        {/* Header */}
        <div className="text-center mb-16">
          <p className="text-xs font-bold tracking-widest text-brand-green uppercase font-sans mb-3">
            Our Products
          </p>
          <h2 className="font-display font-extrabold text-4xl md:text-5xl text-foreground mb-4">
            Two Apps, One Mission
          </h2>
          <p className="text-muted-light text-lg max-w-xl mx-auto">
            Whether you&apos;re an individual looking to earn more or a business wanting to reward
            your team fairly — we&apos;ve built the right tool for you.
          </p>
        </div>

        {/* Product Cards */}
        <div className="grid md:grid-cols-2 gap-6">
          {products.map((product) => (
            <div
              key={product.name}
              className="rounded-2xl border border-border-color overflow-hidden shadow-sm hover:shadow-md transition-shadow"
            >
              {/* Top accent bar */}
              <div
                className="h-1"
                style={{ background: `linear-gradient(to right, ${product.gradientFrom}, ${product.gradientTo}33)` }}
              />
              <div className="p-7">
                {/* Icon */}
                <div
                  className="w-14 h-14 rounded-xl flex items-center justify-center mb-5"
                  style={{ background: `linear-gradient(135deg, ${product.gradientFrom}, ${product.gradientTo})` }}
                >
                  {product.icon}
                </div>

                <h3 className="font-display font-extrabold text-2xl text-foreground mb-2">
                  {product.name}
                </h3>
                <p className="font-semibold text-sm mb-4" style={{ color: product.accent }}>
                  {product.tagline}
                </p>
                <p className="text-muted-light leading-relaxed mb-6">{product.description}</p>

                {/* Highlights */}
                <ul className="space-y-2.5 mb-7">
                  {product.highlights.map((h) => (
                    <li key={h} className="flex items-center gap-3">
                      <span
                        className="w-5 h-5 rounded-full flex items-center justify-center flex-shrink-0"
                        style={{ background: `${product.accent}22` }}
                      >
                        <svg className="w-3 h-3" fill="none" stroke={product.accent} viewBox="0 0 24 24">
                          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={3} d="M5 13l4 4L19 7" />
                        </svg>
                      </span>
                      <span className="text-sm text-foreground">{h}</span>
                    </li>
                  ))}
                </ul>

                {/* Store Badges */}
                <div className="flex flex-wrap gap-3">
                  <a
                    href="#download"
                    className="inline-flex items-center gap-2 px-4 py-2 rounded-xl border text-sm font-medium transition-colors hover:opacity-80"
                    style={{ borderColor: product.accent, color: product.accent }}
                  >
                    <svg className="w-4 h-4" viewBox="0 0 24 24" fill="currentColor">
                      <path d="M18.71 19.5c-.83 1.24-1.71 2.45-3.05 2.47-1.34.03-1.77-.79-3.29-.79-1.53 0-2 .77-3.27.82-1.31.05-2.3-1.32-3.14-2.53C4.25 17 2.94 12.45 4.7 9.39c.87-1.52 2.43-2.48 4.12-2.51 1.28-.02 2.5.87 3.29.87.78 0 2.26-1.07 3.8-.91.65.03 2.47.26 3.64 1.98-.09.06-2.17 1.28-2.15 3.81.03 3.02 2.65 4.03 2.68 4.04-.03.07-.42 1.44-1.38 2.83M13 3.5c.73-.83 1.94-1.46 2.94-1.5.13 1.17-.34 2.35-1.04 3.19-.69.85-1.83 1.51-2.95 1.42-.15-1.15.41-2.35 1.05-3.11z"/>
                    </svg>
                    App Store
                  </a>
                  <a
                    href="#download"
                    className="inline-flex items-center gap-2 px-4 py-2 rounded-xl border text-sm font-medium transition-colors hover:opacity-80"
                    style={{ borderColor: product.accent, color: product.accent }}
                  >
                    <svg className="w-4 h-4" viewBox="0 0 24 24" fill="currentColor">
                      <path d="M3.18 23.76c.3.17.65.18.96.03l12.5-7.17-2.79-2.79-10.67 9.93zM.27 1.7C.1 2.02.01 2.4.01 2.82v18.36c0 .43.09.8.26 1.12l.06.06 10.28-10.28v-.24L.33 1.64l-.06.06zM20.43 10.26l-2.6-1.49-3.13 3.13 3.13 3.13 2.62-1.5c.75-.43.75-1.13-.02-1.56v-.71zM3.18.24L15.68 7.4l-2.79 2.79L2.22.26c.31-.15.66-.14.96-.02z"/>
                    </svg>
                    Google Play
                  </a>
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  )
}
