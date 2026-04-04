import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/responsive_utils.dart';
import '../../../data/content/tipme_content.dart';
import '../../../data/content/tipbiz_content.dart';
import '../../../widgets/buttons/store_badge_button.dart';
import '../../../widgets/cards/stat_card.dart';
import '../../../widgets/layout/animated_section.dart';
import '../../../widgets/layout/section_wrapper.dart';

class DownloadsSection extends StatelessWidget {
  const DownloadsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveUtils.isDesktop(context);
    final isMobile = ResponsiveUtils.isMobile(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            AppColors.accentGreen.withOpacity(0.04),
            AppColors.background,
            AppColors.accentPurple.withOpacity(0.04),
          ],
        ),
      ),
      child: SectionWrapper(
        child: AnimatedSection(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('DOWNLOAD', style: AppTextStyles.sectionLabel),
              const SizedBox(height: 12),
              Text('Available on iOS & Android', style: AppTextStyles.displaySmall),
              const SizedBox(height: 16),
              Text(
                'Download the app that\'s right for you — free on both platforms.',
                style: AppTextStyles.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 64),

              // Download columns
              if (isDesktop)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _DownloadColumn(
                      name: 'TipMe',
                      tagline: 'For individuals, freelancers & creators',
                      accentColor: AppColors.accentGreen,
                      appStoreUrl: TipMeContent.product.appStoreUrl,
                      playStoreUrl: TipMeContent.product.playStoreUrl,
                    )),
                    const SizedBox(width: 24),
                    Container(
                      width: 1,
                      height: 200,
                      color: AppColors.border,
                    ),
                    const SizedBox(width: 24),
                    Expanded(child: _DownloadColumn(
                      name: 'TipBiz',
                      tagline: 'For businesses managing tip pools',
                      accentColor: AppColors.accentPurple,
                      appStoreUrl: TipBizContent.product.appStoreUrl,
                      playStoreUrl: TipBizContent.product.playStoreUrl,
                    )),
                  ],
                )
              else
                Column(
                  children: [
                    _DownloadColumn(
                      name: 'TipMe',
                      tagline: 'For individuals, freelancers & creators',
                      accentColor: AppColors.accentGreen,
                      appStoreUrl: TipMeContent.product.appStoreUrl,
                      playStoreUrl: TipMeContent.product.playStoreUrl,
                      centered: true,
                    ),
                    const SizedBox(height: 48),
                    Container(height: 1, color: AppColors.border),
                    const SizedBox(height: 48),
                    _DownloadColumn(
                      name: 'TipBiz',
                      tagline: 'For businesses managing tip pools',
                      accentColor: AppColors.accentPurple,
                      appStoreUrl: TipBizContent.product.appStoreUrl,
                      playStoreUrl: TipBizContent.product.playStoreUrl,
                      centered: true,
                    ),
                  ],
                ),

              const SizedBox(height: 72),

              // Stats row
              Container(
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 32),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.border),
                ),
                child: isMobile
                    ? Column(
                        children: [
                          StatCard(value: '10k+', label: 'Downloads', accentColor: AppColors.accentGreen),
                          const SizedBox(height: 32),
                          StatCard(value: '4.8★', label: 'App Rating', accentColor: AppColors.gold),
                          const SizedBox(height: 32),
                          StatCard(value: '50+', label: 'Countries', accentColor: AppColors.accentPurple),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          StatCard(value: '10k+', label: 'Downloads', accentColor: AppColors.accentGreen),
                          Container(width: 1, height: 60, color: AppColors.border),
                          StatCard(value: '4.8★', label: 'App Rating', accentColor: AppColors.gold),
                          Container(width: 1, height: 60, color: AppColors.border),
                          StatCard(value: '50+', label: 'Countries', accentColor: AppColors.accentPurple),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DownloadColumn extends StatelessWidget {
  final String name;
  final String tagline;
  final Color accentColor;
  final String appStoreUrl;
  final String playStoreUrl;
  final bool centered;

  const _DownloadColumn({
    required this.name,
    required this.tagline,
    required this.accentColor,
    required this.appStoreUrl,
    required this.playStoreUrl,
    this.centered = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: centered ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: accentColor,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              name,
              style: AppTextStyles.headlineMedium,
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(tagline, style: AppTextStyles.bodyMedium,
          textAlign: centered ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: 28),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: centered ? WrapAlignment.center : WrapAlignment.start,
          children: [
            StoreBadgeButton(
              platform: StorePlatform.appStore,
              url: appStoreUrl,
              accentColor: accentColor,
            ),
            StoreBadgeButton(
              platform: StorePlatform.playStore,
              url: playStoreUrl,
              accentColor: accentColor,
            ),
          ],
        ),
      ],
    );
  }
}
