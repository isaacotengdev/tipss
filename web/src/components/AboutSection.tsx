export default function AboutSection() {
  const stats = [
    { value: '2', label: 'Apps' },
    { value: '1', label: 'Platform' },
    { value: '50+', label: 'Countries' },
  ]

  const values = ['Transparent', 'Instant', 'Fair']

  return (
    <section id="about" className="bg-surface py-24 px-6 md:px-20">
      <div className="max-w-6xl mx-auto">
        <div className="flex flex-col md:flex-row gap-16 items-center">
          {/* Left — Text */}
          <div className="flex-[5] min-w-0">
            <p className="text-xs font-bold tracking-widest text-brand-green uppercase font-sans mb-3">
              About
            </p>
            <h2 className="font-display font-extrabold text-4xl md:text-5xl text-foreground mb-6 leading-tight">
              Built for a Cashless World
            </h2>
            <p className="text-muted-light text-lg leading-relaxed mb-5">
              At Tipss, we believe tipping should be as effortless as the service itself.
              We built TipMe and TipBiz to eliminate the awkwardness of cash tips and the
              opacity of shared pools — replacing both with instant, transparent, fair
              technology that works for everyone.
            </p>
            <p className="text-muted-light leading-relaxed mb-8">
              Founded in 2024, Tipss is on a mission to modernize how appreciation is
              expressed and shared. From the solo performer on the street corner to the
              hotel with hundreds of staff — we&apos;ve built the tools to make every tip count.
            </p>

            {/* Value Pills */}
            <div className="flex flex-wrap gap-3 mb-8">
              {values.map((v) => (
                <span
                  key={v}
                  className="px-4 py-2 rounded-full border border-brand-green/30 bg-brand-green/10 text-brand-green text-sm font-semibold"
                >
                  {v}
                </span>
              ))}
            </div>

            {/* Contact */}
            <a
              href="mailto:hello@tipss.io"
              className="inline-flex items-center gap-2 text-brand-green font-medium hover:underline"
            >
              <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
              </svg>
              hello@tipss.io
            </a>
            <p className="text-muted-light text-sm mt-2">Founded 2024</p>
          </div>

          {/* Right — Stats Panel */}
          <div className="flex-[4] w-full">
            <div className="bg-white rounded-2xl border border-border-color shadow-sm p-9">
              {stats.map((stat, i) => (
                <div key={stat.label}>
                  <div className="flex items-center justify-between py-1">
                    <span className="text-muted-light font-medium">{stat.label}</span>
                    <span className="font-display font-extrabold text-4xl text-brand-green">
                      {stat.value}
                    </span>
                  </div>
                  {i < stats.length - 1 && (
                    <hr className="border-border-color my-5" />
                  )}
                </div>
              ))}
            </div>
          </div>
        </div>
      </div>
    </section>
  )
}
