'use client'
import { useState } from 'react'

export default function ContactSection() {
  const [form, setForm] = useState({ name: '', email: '', subject: '', message: '' })
  const [status, setStatus] = useState<'idle' | 'sending' | 'sent' | 'error'>('idle')

  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement | HTMLSelectElement>) => {
    setForm({ ...form, [e.target.name]: e.target.value })
  }

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setStatus('sending')
    try {
      const res = await fetch(`https://formsubmit.co/ajax/hello@tipss.tech`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json', Accept: 'application/json' },
        body: JSON.stringify({ ...form, _captcha: 'false' }),
      })
      if (res.ok) {
        setStatus('sent')
        setForm({ name: '', email: '', subject: '', message: '' })
      } else {
        setStatus('error')
      }
    } catch {
      setStatus('error')
    }
  }

  return (
    <section id="contact" className="bg-surface py-24 px-6 md:px-20">
      <div className="max-w-2xl mx-auto">
        {/* Header */}
        <div className="text-center mb-12">
          <p className="text-xs font-bold tracking-widest text-brand-green uppercase font-sans mb-3">
            Contact
          </p>
          <h2 className="font-display font-extrabold text-4xl md:text-5xl text-foreground mb-4">
            Get in Touch
          </h2>
          <p className="text-muted-light text-lg">
            Have a question or want to learn more? We&apos;d love to hear from you.
          </p>
        </div>

        {/* Form */}
        <form onSubmit={handleSubmit} className="space-y-5">
          <div className="grid sm:grid-cols-2 gap-5">
            <div>
              <label className="block text-sm font-medium text-foreground mb-1.5">Name</label>
              <input
                type="text"
                name="name"
                value={form.name}
                onChange={handleChange}
                required
                placeholder="Your name"
                className="w-full px-4 py-3 rounded-xl border border-border-color bg-white text-foreground placeholder-muted-light focus:outline-none focus:ring-2 focus:ring-brand-green/40 focus:border-brand-green transition-colors"
              />
            </div>
            <div>
              <label className="block text-sm font-medium text-foreground mb-1.5">Email</label>
              <input
                type="email"
                name="email"
                value={form.email}
                onChange={handleChange}
                required
                placeholder="your@email.com"
                className="w-full px-4 py-3 rounded-xl border border-border-color bg-white text-foreground placeholder-muted-light focus:outline-none focus:ring-2 focus:ring-brand-green/40 focus:border-brand-green transition-colors"
              />
            </div>
          </div>

          <div>
            <label className="block text-sm font-medium text-foreground mb-1.5">Subject</label>
            <select
              name="subject"
              value={form.subject}
              onChange={handleChange}
              required
              className="w-full px-4 py-3 rounded-xl border border-border-color bg-white text-foreground focus:outline-none focus:ring-2 focus:ring-brand-green/40 focus:border-brand-green transition-colors"
            >
              <option value="">Select a subject</option>
              <option value="TipMe enquiry">TipMe Enquiry</option>
              <option value="TipBiz enquiry">TipBiz Enquiry</option>
              <option value="Partnership">Partnership</option>
              <option value="Support">Support</option>
              <option value="Other">Other</option>
            </select>
          </div>

          <div>
            <label className="block text-sm font-medium text-foreground mb-1.5">Message</label>
            <textarea
              name="message"
              value={form.message}
              onChange={handleChange}
              required
              rows={5}
              placeholder="Tell us how we can help..."
              className="w-full px-4 py-3 rounded-xl border border-border-color bg-white text-foreground placeholder-muted-light focus:outline-none focus:ring-2 focus:ring-brand-green/40 focus:border-brand-green transition-colors resize-none"
            />
          </div>

          <button
            type="submit"
            disabled={status === 'sending'}
            className="w-full bg-brand-green text-white font-semibold py-3.5 rounded-xl hover:bg-green-600 transition-colors disabled:opacity-60 disabled:cursor-not-allowed"
          >
            {status === 'sending' ? 'Sending...' : 'Send Message'}
          </button>

          {status === 'sent' && (
            <p className="text-center text-brand-green font-medium">
              ✓ Message sent! We&apos;ll get back to you soon.
            </p>
          )}
          {status === 'error' && (
            <p className="text-center text-red-500 font-medium">
              Something went wrong. Please email us directly at hello@tipss.tech
            </p>
          )}
        </form>
      </div>
    </section>
  )
}
