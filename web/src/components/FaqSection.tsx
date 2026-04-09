'use client'
import { useState } from 'react'

const FAQS = [
  {
    q: 'What is Tipss?',
    a: 'Tipss is a digital tipping platform with two products: TipMe for individuals who want to receive tips cashlessly, and TipBiz for businesses that need automated, transparent tip pool management for their teams.',
  },
  {
    q: 'How does TipMe work?',
    a: 'Download TipMe, set up your profile in under 5 minutes, and share your personal QR code or link with customers. Tips go directly to your connected bank account or mobile money — instantly and with zero fees for recipients.',
  },
  {
    q: 'Who is TipBiz for?',
    a: "TipBiz is built for any business with a tipped team — restaurants, hotels, salons, event venues, and more. It automates tip collection, pooling, and distribution so owners and managers don't have to do it manually.",
  },
  {
    q: 'Are there fees for receiving tips?',
    a: 'With TipMe, you receive almost the full value of every tip for a small fee, while tippers enjoy only small, transparent convenience charges. TipBiz runs on a simple monthly subscription, so you never have to worry about per-transaction fees.',
  },
  {
    q: 'Is Tipss available in my country?',
    a: "Tipss is currently available across Africa and expanding globally. Check the App Store or Google Play listing for your region's availability.",
  },
  {
    q: 'How long does it take to receive a payout?',
    a: 'Payouts through TipMe are processed within minutes to your linked account. Exact timing depends on your bank or mobile money provider.',
  },
  {
    q: 'Can TipBiz handle multiple locations?',
    a: 'Yes. TipBiz supports unlimited locations on the Enterprise plan and up to 3 locations on the Growth plan. Each location can have its own staff roster and distribution rules.',
  },
  {
    q: 'How do I get started with TipBiz?',
    a: 'Download TipBiz from the App Store or Google Play, create your business account, add your staff roster, set your pool distribution rules, and you\'re live. Our onboarding wizard walks you through each step.',
  },
]

export default function FaqSection() {
  const [open, setOpen] = useState<number | null>(null)

  return (
    <section id="faq" className="bg-white py-24 px-6 md:px-20">
      <div className="max-w-3xl mx-auto">
        {/* Header */}
        <div className="text-center mb-14">
          <p className="text-xs font-bold tracking-widest text-brand-green uppercase font-sans mb-3">
            FAQ
          </p>
          <h2 className="font-display font-extrabold text-4xl md:text-5xl text-foreground mb-4">
            Frequently Asked Questions
          </h2>
          <p className="text-muted-light text-lg">
            Everything you need to know about Tipss, TipMe, and TipBiz.
          </p>
        </div>

        {/* FAQ Items */}
        <div className="divide-y divide-border-color">
          {FAQS.map((faq, i) => (
            <div key={i}>
              <button
                className="w-full flex items-center justify-between py-5 text-left gap-4"
                onClick={() => setOpen(open === i ? null : i)}
              >
                <span
                  className="font-semibold text-base transition-colors"
                  style={{ color: open === i ? '#0DAF5C' : '#0D2318' }}
                >
                  {faq.q}
                </span>
                <span
                  className="flex-shrink-0 w-8 h-8 rounded-full flex items-center justify-center transition-all duration-200"
                  style={{
                    background: open === i ? '#0DAF5C' : '#ECFAF2',
                    transform: open === i ? 'rotate(45deg)' : 'rotate(0deg)',
                  }}
                >
                  <svg
                    className="w-4 h-4"
                    fill="none"
                    stroke={open === i ? 'white' : '#4A6B56'}
                    viewBox="0 0 24 24"
                  >
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2.5} d="M12 4v16m8-8H4" />
                  </svg>
                </span>
              </button>

              <div
                className="overflow-hidden transition-all duration-300"
                style={{ maxHeight: open === i ? '300px' : '0px' }}
              >
                <p className="text-muted-light leading-relaxed pb-5 pr-12">{faq.a}</p>
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  )
}
