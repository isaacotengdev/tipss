import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../sections/nav/nav_bar.dart';
import '../sections/hero/hero_section.dart';
import '../sections/products/products_section.dart';
import '../sections/features/features_section.dart';
import '../sections/downloads/downloads_section.dart';
import '../sections/about/about_section.dart';
import '../sections/faq/faq_section.dart';
import '../sections/footer/footer_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  final Map<String, GlobalKey> _sectionKeys = {
    AppConstants.sectionAbout: GlobalKey(),
    AppConstants.sectionSolutions: GlobalKey(),
    AppConstants.sectionFaq: GlobalKey(),
    AppConstants.sectionDownload: GlobalKey(),
  };

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(String section) {
    if (section == AppConstants.sectionHome) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
      return;
    }
    final key = _sectionKeys[section];
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
        alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
        alignment: 0.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Scrollable content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // Spacer for sticky nav height
                const SizedBox(height: 68),

                // Hero (Home)
                HeroSection(
                  onDownloadTipMe: () => _scrollToSection(AppConstants.sectionDownload),
                  onTryTipBiz: () => _scrollToSection(AppConstants.sectionDownload),
                ),

                // About Us
                SizedBox(
                  key: _sectionKeys[AppConstants.sectionAbout],
                  child: const AboutSection(),
                ),

                // Solutions (Products + Features)
                SizedBox(
                  key: _sectionKeys[AppConstants.sectionSolutions],
                  child: const ProductsSection(),
                ),
                const FeaturesSection(),

                // FAQ
                SizedBox(
                  key: _sectionKeys[AppConstants.sectionFaq],
                  child: const FaqSection(),
                ),

                // Download Apps
                SizedBox(
                  key: _sectionKeys[AppConstants.sectionDownload],
                  child: const DownloadsSection(),
                ),

                // Footer
                const FooterSection(),
              ],
            ),
          ),

          // Sticky Nav overlay
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: TipssNavBar(
              scrollController: _scrollController,
              sectionKeys: _sectionKeys,
            ),
          ),
        ],
      ),
    );
  }
}
