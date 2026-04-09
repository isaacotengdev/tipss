import Navbar from '@/components/Navbar'
import HeroSection from '@/components/HeroSection'
import AboutSection from '@/components/AboutSection'
import SolutionsSection from '@/components/SolutionsSection'
import FeaturesSection from '@/components/FeaturesSection'
import FaqSection from '@/components/FaqSection'
import DownloadsSection from '@/components/DownloadsSection'
import Footer from '@/components/Footer'

export default function Home() {
  return (
    <>
      <Navbar />
      <main>
        <HeroSection />
        <AboutSection />
        <SolutionsSection />
        <FeaturesSection />

        <FaqSection />
        <DownloadsSection />
      </main>
      <Footer />
    </>
  )
}
