import Navbar from '@/components/Navbar'
import HeroSection from '@/components/HeroSection'
import AboutSection from '@/components/AboutSection'
import SolutionsSection from '@/components/SolutionsSection'
import FeaturesSection from '@/components/FeaturesSection'
import FaqSection from '@/components/FaqSection'
import DownloadsSection from '@/components/DownloadsSection'
import Footer from '@/components/Footer'
import Image from 'next/image'

export default function Home() {
  return (
    <>
      <Navbar />
      <main>
        <HeroSection />
        <AboutSection />
        <SolutionsSection />
        <FeaturesSection />

        {/* Feature section image */}
        <div className="w-full">
          <Image
            src="/images/african-business-male-people-shaking-hands.jpg"
            alt="African business people shaking hands"
            width={1920}
            height={800}
            style={{ width: '100%', height: 'auto', display: 'block' }}
            sizes="100vw"
          />
        </div>

        <FaqSection />
        <DownloadsSection />
      </main>
      <Footer />
    </>
  )
}
