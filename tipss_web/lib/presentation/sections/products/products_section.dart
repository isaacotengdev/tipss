import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/responsive_utils.dart';
import '../../../data/content/tipme_content.dart';
import '../../../data/content/tipbiz_content.dart';
import '../../../data/models/app_product.dart';
import '../../../widgets/buttons/store_badge_button.dart';
import '../../../widgets/decorative/glow_container.dart';
import '../../../widgets/layout/animated_section.dart';
import '../../../widgets/layout/section_wrapper.dart';

class ProductsSection extends StatelessWidget {
  const ProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveUtils.isDesktop(context);
    final tipMe = TipMeContent.product;
    final tipBiz = TipBizContent.product;

    return SectionWrapper(
      child: AnimatedSection(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Section label
            Text('OUR PRODUCTS', style: AppTextStyles.sectionLabel),
            const SizedBox(height: 12),
            Text('Two Apps, One Mission', style: AppTextStyles.displaySmall),
            const SizedBox(height: 16),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 560),
              child: Text(
                'Whether you\'re an individual looking to earn more or a business '
                'wanting to reward your team fairly — we\'ve built the right tool for you.',
                style: AppTextStyles.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 64),
            if (isDesktop)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _ProductCard(product: tipMe)),
                  const SizedBox(width: 24),
                  Expanded(child: _ProductCard(product: tipBiz)),
                ],
              )
            else
              Column(
                children: [
                  _ProductCard(product: tipMe),
                  const SizedBox(height: 24),
                  _ProductCard(product: tipBiz),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final AppProduct product;

  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return GlowContainer(
      glowColor: product.accentColor,
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top accent bar
          Container(
            height: 3,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [product.accentColor, product.accentColor.withOpacity(0.2)],
              ),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // App icon
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    gradient: product.type == AppProductType.tipMe
                        ? AppColors.greenGradient
                        : AppColors.purpleGradient,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(
                    product.type == AppProductType.tipMe
                        ? Icons.person_rounded
                        : Icons.business_rounded,
                    color: AppColors.white,
                    size: 28,
                  ),
                ),
                const SizedBox(height: 20),
                Text(product.name, style: AppTextStyles.headlineMedium),
                const SizedBox(height: 8),
                Text(
                  product.tagline,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: product.accentColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                Text(product.description, style: AppTextStyles.bodyMedium),
                const SizedBox(height: 24),
                // Highlights
                ...product.highlights.map((h) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: product.accentColor.withOpacity(0.15),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.check_rounded,
                              size: 13,
                              color: product.accentColor,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(h, style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.foreground,
                          )),
                        ],
                      ),
                    )),
                const SizedBox(height: 28),
                // Download badges
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    StoreBadgeButton(
                      platform: StorePlatform.appStore,
                      url: product.appStoreUrl,
                      accentColor: product.accentColor,
                    ),
                    StoreBadgeButton(
                      platform: StorePlatform.playStore,
                      url: product.playStoreUrl,
                      accentColor: product.accentColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
