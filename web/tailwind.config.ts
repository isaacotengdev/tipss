import type { Config } from 'tailwindcss'

const config: Config = {
  content: [
    './src/pages/**/*.{js,ts,jsx,tsx,mdx}',
    './src/components/**/*.{js,ts,jsx,tsx,mdx}',
    './src/app/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {
      colors: {
        'brand-green': '#0DAF5C',
        'brand-purple': '#8B5CF6',
        'foreground': '#0D2318',
        'muted': '#4A6B56',
        'muted-light': '#6B8C76',
        'surface': '#F5FAF7',
        'surface-elevated': '#ECFAF2',
        'border-color': '#E2EBE6',
      },
      fontFamily: {
        sans: ['var(--font-inter)', 'sans-serif'],
        display: ['var(--font-nunito)', 'sans-serif'],
      },
    },
  },
  plugins: [],
}

export default config
