'use client'
import { useState } from 'react'

const TIPME_FEATURES = [
  { title: 'Instant QR Code', desc: 'Generate your personal tip QR in seconds. Print it, display it, or share it anywhere.', emoji: '📱' },
  { title: 'Custom Profile Link', desc: 'Your own tipping page with your photo, name, and bio. Share it on any platform.', emoji: '🔗' },
  { title: 'Instant Payouts', desc: 'Funds hit your connected account within minutes, not days. No waiting, no holds.', emoji: '⚡' },
  { title: 'Tip History', desc: 'See every tip with timestamps, amounts, and optional messages from tippers.', emoji: '📊' },
  { title: 'Multiple Payment Methods', desc: 'Accept tips via your bank account or mobile money wallet.', emoji: '💳' },
  { title: 'Zero Recipient Fees', desc: "You keep 100% of every tip.", emoji: '🎁' },
]

const TIPBIZ_FEATURES = [
  { title: 'Tip Pool Management', desc: 'Define pool rules once. Distribution runs automatically at the end of every shift.', emoji: '🏊' },
  { title: 'Staff Roster', desc: 'Add, remove, and manage staff across all your locations from one dashboard.', emoji: '👥' },
  { title: 'Transparent Reporting', desc: 'Every transaction logged with timestamped, audit-ready exports for your records.', emoji: '📋' },
  { title: 'Multi-Location Support', desc: 'One dashboard for all your venues. Manage rules and staff by location.', emoji: '📍' },
  { title: 'Custom Distribution Rules', desc: 'Split equally, by hours worked, by role, or fully custom weighting — your choice.', emoji: '⚙️' },
  { title: 'Subscription Plans', desc: 'Predictable monthly pricing that scales with your team. No hidden transaction fees.', emoji: '💼' },
]

export default function FeaturesSection() {
  const [tab, setTab] = useState<'tipme' | 'tipbiz'>('tipme')

  const features = tab === 'tipme' ? TIPME_FEATURES : TIPBIZ_FEATURES
  const accent = tab === 'tipme' ? '#0DAF5C' : '#8B5CF6'

  return (
    <section
      className="relative py-24 px-6 md:px-20"
      style={{
        backgroundImage: "url('/images/african-business-male-people-shaking-hands.jpg')",
        backgroundSize: 'cover',
        backgroundPosition: 'center',
        backgroundRepeat: 'no-repeat',
      }}
    >
      <div className="absolute inset-0 bg-white/85" />
      <div className="relative max-w-6xl mx-auto">
        {/* Header */}
        <div className="text-center mb-12">
          <p className="text-xs font-bold tracking-widest text-brand-green uppercase font-sans mb-3">
            Features
          </p>
          <h2 className="font-display font-extrabold text-4xl md:text-5xl text-foreground mb-4">
            Everything You Need
          </h2>
          <p className="text-muted-light text-lg">
            Powerful tools for both individuals and businesses.
          </p>
        </div>

        {/* Tab Switcher */}
        <div className="flex justify-center mb-12">
          <div className="inline-flex p-1 bg-white rounded-full border border-border-color shadow-sm">
            <button
              onClick={() => setTab('tipme')}
              className="px-7 py-3 rounded-full text-sm font-semibold transition-all duration-200"
              style={
                tab === 'tipme'
                  ? { background: '#0DAF5C', color: 'white' }
                  : { color: '#4A6B56' }
              }
            >
              TipMe
            </button>
            <button
              onClick={() => setTab('tipbiz')}
              className="px-7 py-3 rounded-full text-sm font-semibold transition-all duration-200"
              style={
                tab === 'tipbiz'
                  ? { background: '#8B5CF6', color: 'white' }
                  : { color: '#4A6B56' }
              }
            >
              TipBiz
            </button>
          </div>
        </div>

        {/* Feature Grid */}
        <div className="grid sm:grid-cols-2 lg:grid-cols-3 gap-5">
          {features.map((f) => (
            <div
              key={f.title}
              className="bg-white rounded-2xl border border-border-color p-6 hover:shadow-md transition-shadow"
            >
              <div
                className="w-10 h-10 rounded-xl flex items-center justify-center mb-4 text-xl"
                style={{ background: `${accent}15` }}
              >
                {f.emoji}
              </div>
              <h3 className="font-display font-bold text-lg text-foreground mb-2">
                {f.title}
              </h3>
              <p className="text-muted-light text-sm leading-relaxed">{f.desc}</p>
            </div>
          ))}
        </div>
      </div>
    </section>
  )
}

