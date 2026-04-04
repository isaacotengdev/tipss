import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/responsive_utils.dart';
import '../../../core/utils/url_launcher_service.dart';
import '../../../core/constants/urls.dart';
import '../../../data/content/company_content.dart';
import '../../../widgets/layout/animated_section.dart';
import '../../../widgets/layout/section_wrapper.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveUtils.isDesktop(context);

    return SectionWrapper(
      backgroundColor: AppColors.surface,
      child: AnimatedSection(
        child: isDesktop
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex: 5, child: _AboutText()),
                  const SizedBox(width: 80),
                  Expanded(flex: 4, child: _CompanyStatsPanel()),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _AboutText(),
                  const SizedBox(height: 48),
                  _CompanyStatsPanel(),
                ],
              ),
      ),
    );
  }
}

class _AboutText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('ABOUT', style: AppTextStyles.sectionLabel),
        const SizedBox(height: 12),
        Text(CompanyContent.missionHeadline, style: AppTextStyles.displaySmall),
        const SizedBox(height: 24),
        Text(CompanyContent.mission, style: AppTextStyles.bodyLarge),
        const SizedBox(height: 24),
        Text(CompanyContent.aboutBody, style: AppTextStyles.bodyMedium),
        const SizedBox(height: 32),

        // Value pills
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: CompanyContent.values.map((v) => _ValuePill(v)).toList(),
        ),
        const SizedBox(height: 36),

        // Contact link
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => UrlLauncherService.launch(AppUrls.contactEmail),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.mail_outline_rounded,
                    size: 18, color: AppColors.accentGreen),
                const SizedBox(width: 8),
                Text(
                  CompanyContent.email,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.accentGreen,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Founded ${CompanyContent.founded}',
          style: AppTextStyles.bodySmall,
        ),
      ],
    );
  }
}

class _ValuePill extends StatelessWidget {
  final String label;
  const _ValuePill(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.accentGreen.withOpacity(0.10),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: AppColors.accentGreen.withOpacity(0.3)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.accentGreen,
        ),
      ),
    );
  }
}

class _CompanyStatsPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(36),
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.accentGreen.withOpacity(0.06),
            blurRadius: 40,
          ),
        ],
      ),
      child: Column(
        children: [
          ...CompanyContent.companyStats.map((stat) {
            final isLast = stat == CompanyContent.companyStats.last;
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      stat['label']!,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.mutedLight,
                      ),
                    ),
                    Text(
                      stat['value']!,
                      style: AppTextStyles.statNumber.copyWith(fontSize: 36),
                    ),
                  ],
                ),
                if (!isLast) ...[
                  const SizedBox(height: 20),
                  const Divider(color: AppColors.border, height: 1),
                  const SizedBox(height: 20),
                ],
              ],
            );
          }),
        ],
      ),
    );
  }
}
