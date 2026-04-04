import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/responsive_utils.dart';
import '../../../data/content/tipme_content.dart';
import '../../../data/content/tipbiz_content.dart';
import '../../../widgets/cards/feature_card.dart';
import '../../../widgets/layout/animated_section.dart';
import '../../../widgets/layout/section_wrapper.dart';

class FeaturesSection extends StatefulWidget {
  const FeaturesSection({super.key});

  @override
  State<FeaturesSection> createState() => _FeaturesSectionState();
}

class _FeaturesSectionState extends State<FeaturesSection> {
  int _selectedTab = 0; // 0 = TipMe, 1 = TipBiz

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveUtils.isDesktop(context);
    final isMobile = ResponsiveUtils.isMobile(context);
    final features = _selectedTab == 0
        ? TipMeContent.features
        : TipBizContent.features;
    final accent = _selectedTab == 0
        ? AppColors.accentGreen
        : AppColors.accentPurple;

    return SectionWrapper(
      backgroundColor: AppColors.surface,
      child: AnimatedSection(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('FEATURES', style: AppTextStyles.sectionLabel),
            const SizedBox(height: 12),
            Text('Everything You Need', style: AppTextStyles.displaySmall),
            const SizedBox(height: 16),
            Text(
              'Powerful tools for both individuals and businesses.',
              style: AppTextStyles.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            // Tab switcher
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.surfaceElevated,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _TabPill(
                    label: 'TipMe',
                    selected: _selectedTab == 0,
                    accentColor: AppColors.accentGreen,
                    onTap: () => setState(() => _selectedTab = 0),
                  ),
                  const SizedBox(width: 4),
                  _TabPill(
                    label: 'TipBiz',
                    selected: _selectedTab == 1,
                    accentColor: AppColors.accentPurple,
                    onTap: () => setState(() => _selectedTab = 1),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 56),

            // Feature grid
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: LayoutBuilder(
                key: ValueKey(_selectedTab),
                builder: (context, constraints) {
                  final crossAxisCount = isMobile ? 1 : isDesktop ? 3 : 2;
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: isMobile ? 2.2 : isDesktop ? 1.4 : 1.6,
                    ),
                    itemCount: features.length,
                    itemBuilder: (_, i) => FeatureCard(item: features[i]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TabPill extends StatelessWidget {
  final String label;
  final bool selected;
  final Color accentColor;
  final VoidCallback onTap;

  const _TabPill({
    required this.label,
    required this.selected,
    required this.accentColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
        decoration: BoxDecoration(
          color: selected ? accentColor : AppColors.transparent,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: selected
                ? (accentColor == AppColors.accentGreen
                    ? AppColors.background
                    : AppColors.white)
                : AppColors.muted,
          ),
        ),
      ),
    );
  }
}
