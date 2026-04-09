import Image from 'next/image'

export default function AboutSection() {
  return (
    <section id="about" className="bg-surface py-24 px-6 md:px-20">
      <div className="max-w-6xl mx-auto">
        <div className="flex flex-col md:flex-row gap-12 items-center">

          {/* Left — Image */}
          <div className="flex-1 w-full rounded-2xl overflow-hidden shadow-md min-h-[400px] relative">
            <Image
              src="/images/tips-gratuities-happy-african.jpg"
              alt="Happy service workers"
              fill
              style={{ objectFit: 'cover' }}
              sizes="(max-width: 768px) 100vw, 50vw"
            />
          </div>

          {/* Right — Text */}
          <div className="flex-1 min-w-0">
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
              Founded in 2025, Tipss is on a mission to modernize how appreciation is
              expressed and shared. From the solo performer on the street corner to the
              hotel with hundreds of staff — we&apos;ve built the tools to make every tip count.
            </p>
            <a
              href="mailto:hello@tipss.tech"
              className="inline-flex items-center gap-2 text-brand-green font-medium hover:underline"
            >
              <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
              </svg>
              hello@tipss.tech
            </a>
            <p className="text-muted-light text-sm mt-2">Founded 2025</p>
          </div>

        </div>
      </div>
    </section>
  )
}
