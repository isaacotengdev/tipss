export default function DownloadsSection() {
  const apps = [
    {
      name: 'TipMe',
      tagline: 'For individuals, freelancers & creators',
      accent: '#0DAF5C',
    },
    {
      name: 'TipBiz',
      tagline: 'For businesses managing tip pools',
      accent: '#8B5CF6',
    },
  ]

  const stats = [
    { value: '10k+', label: 'Downloads', accent: '#0DAF5C' },
    { value: '4.8★', label: 'App Rating', accent: '#F59E0B' },
    { value: '50+', label: 'Countries', accent: '#8B5CF6' },
  ]

  return (
    <section id="download" className="py-24 px-6 md:px-20 bg-gradient-to-r from-brand-green/5 via-white to-brand-purple/5">
      <div className="max-w-6xl mx-auto">
        {/* Header */}
        <div className="text-center mb-16">
          <p className="text-xs font-bold tracking-widest text-brand-green uppercase font-sans mb-3">
            Download
          </p>
          <h2 className="font-display font-extrabold text-4xl md:text-5xl text-foreground mb-4">
            Available on iOS & Android
          </h2>
          <p className="text-muted-light text-lg">
            Download the app that&apos;s right for you — free on both platforms.
          </p>
        </div>

        {/* App Download Columns */}
        <div className="flex flex-col md:flex-row gap-8 mb-16 items-start">
          {apps.map((app, i) => (
            <div key={app.name} className="flex-1 flex flex-col items-center md:items-start text-center md:text-left">
              <div className="flex items-center gap-3 mb-3">
                <span
                  className="w-3 h-3 rounded-full"
                  style={{ background: app.accent }}
                />
                <h3 className="font-display font-extrabold text-2xl text-foreground">
                  {app.name}
                </h3>
              </div>
              <p className="text-muted-light mb-7">{app.tagline}</p>
              <div className="flex flex-wrap gap-3 justify-center md:justify-start">
                {/* App Store */}
                <a
                  href="#"
                  className="flex items-center gap-2.5 px-5 py-3 rounded-xl border-2 font-medium text-sm transition-all hover:shadow-md"
                  style={{ borderColor: app.accent, color: app.accent }}
                >
                  <svg className="w-5 h-5" viewBox="0 0 24 24" fill="currentColor">
                    <path d="M18.71 19.5c-.83 1.24-1.71 2.45-3.05 2.47-1.34.03-1.77-.79-3.29-.79-1.53 0-2 .77-3.27.82-1.31.05-2.3-1.32-3.14-2.53C4.25 17 2.94 12.45 4.7 9.39c.87-1.52 2.43-2.48 4.12-2.51 1.28-.02 2.5.87 3.29.87.78 0 2.26-1.07 3.8-.91.65.03 2.47.26 3.64 1.98-.09.06-2.17 1.28-2.15 3.81.03 3.02 2.65 4.03 2.68 4.04-.03.07-.42 1.44-1.38 2.83M13 3.5c.73-.83 1.94-1.46 2.94-1.5.13 1.17-.34 2.35-1.04 3.19-.69.85-1.83 1.51-2.95 1.42-.15-1.15.41-2.35 1.05-3.11z"/>
                  </svg>
                  App Store
                </a>
                {/* Google Play */}
                <a
                  href="#"
                  className="flex items-center gap-2.5 px-5 py-3 rounded-xl border-2 font-medium text-sm transition-all hover:shadow-md"
                  style={{ borderColor: app.accent, color: app.accent }}
                >
                  <svg className="w-5 h-5" viewBox="0 0 24 24" fill="currentColor">
                    <path d="M3.18 23.76c.3.17.65.18.96.03l12.5-7.17-2.79-2.79-10.67 9.93zM.27 1.7C.1 2.02.01 2.4.01 2.82v18.36c0 .43.09.8.26 1.12l.06.06 10.28-10.28v-.24L.33 1.64l-.06.06zM20.43 10.26l-2.6-1.49-3.13 3.13 3.13 3.13 2.62-1.5c.75-.43.75-1.13-.02-1.56v-.71zM3.18.24L15.68 7.4l-2.79 2.79L2.22.26c.31-.15.66-.14.96-.02z"/>
                  </svg>
                  Google Play
                </a>
              </div>
              {i === 0 && (
                <div className="hidden md:block w-px h-full bg-border-color mx-8 self-stretch" />
              )}
            </div>
          ))}
        </div>

        {/* Stats */}
        <div className="bg-surface rounded-2xl border border-border-color p-8">
          <div className="flex flex-col sm:flex-row gap-8 sm:gap-0 items-center justify-around">
            {stats.map((stat, i) => (
              <div key={stat.label} className="flex flex-col items-center gap-1 text-center">
                <span
                  className="font-display font-extrabold text-4xl"
                  style={{ color: stat.accent }}
                >
                  {stat.value}
                </span>
                <span className="text-muted-light text-sm font-medium">{stat.label}</span>
                {i < stats.length - 1 && (
                  <div className="hidden sm:block absolute w-px h-12 bg-border-color" style={{ transform: 'translateX(120px)' }} />
                )}
              </div>
            ))}
          </div>
        </div>
      </div>
    </section>
  )
}
