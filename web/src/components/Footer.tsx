import Image from 'next/image'

export default function Footer() {
  const year = new Date().getFullYear()

  const productLinks = ['TipMe', 'TipBiz']
  const companyLinks = [
    { label: 'About', href: '#about' },
    { label: 'Privacy Policy', href: '#' },
    { label: 'Terms of Service', href: '#' },
    { label: 'Contact', href: 'mailto:hello@tipss.io' },
  ]

  return (
    <footer className="bg-surface border-t border-border-color">
      <div className="max-w-6xl mx-auto px-6 md:px-20 py-14">
        <div className="flex flex-col md:flex-row gap-10">
          {/* Brand */}
          <div className="flex-[3]">
            <Image
              src="/images/logo.png"
              alt="Tipss"
              height={40}
              width={110}
              style={{ objectFit: 'contain', height: '40px', width: 'auto' }}
            />
            <p className="text-muted-light text-sm mt-3 max-w-[220px] leading-relaxed">
              Empowering the service economy.
            </p>
            {/* Social */}
            <div className="flex gap-3 mt-5">
              {[
                { label: 'Twitter', href: '#', icon: (
                  <svg className="w-4 h-4" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z"/>
                  </svg>
                )},
                { label: 'LinkedIn', href: '#', icon: (
                  <svg className="w-4 h-4" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z"/>
                  </svg>
                )},
                { label: 'Email', href: 'mailto:hello@tipss.io', icon: (
                  <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
                  </svg>
                )},
              ].map((s) => (
                <a
                  key={s.label}
                  href={s.href}
                  aria-label={s.label}
                  className="w-9 h-9 rounded-lg border border-border-color bg-white flex items-center justify-center text-muted-light hover:text-brand-green hover:border-brand-green/40 transition-colors"
                >
                  {s.icon}
                </a>
              ))}
            </div>
          </div>

          {/* Products */}
          <div className="flex-1">
            <h4 className="font-semibold text-foreground mb-4">Products</h4>
            <ul className="space-y-2.5">
              {productLinks.map((label) => (
                <li key={label}>
                  <a href="#solutions" className="text-muted-light text-sm hover:text-brand-green transition-colors">
                    {label}
                  </a>
                </li>
              ))}
            </ul>
          </div>

          {/* Company */}
          <div className="flex-1">
            <h4 className="font-semibold text-foreground mb-4">Company</h4>
            <ul className="space-y-2.5">
              {companyLinks.map((link) => (
                <li key={link.label}>
                  <a href={link.href} className="text-muted-light text-sm hover:text-brand-green transition-colors">
                    {link.label}
                  </a>
                </li>
              ))}
            </ul>
          </div>
        </div>
      </div>

      {/* Bottom bar */}
      <div className="border-t border-border-color py-5 px-6 text-center">
        <p className="text-muted-light text-xs">
          © {year} Tipss Inc. All rights reserved.
        </p>
      </div>
    </footer>
  )
}
