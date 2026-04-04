import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/responsive_utils.dart';
import '../../../widgets/buttons/cta_button.dart';
import '../../../widgets/decorative/grid_background.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onDownloadTipMe;
  final VoidCallback onTryTipBiz;

  const HeroSection({
    super.key,
    required this.onDownloadTipMe,
    required this.onTryTipBiz,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveUtils.isDesktop(context);
    final isMobile = ResponsiveUtils.isMobile(context);

    // Nav bar is 68px; hero fills the rest of the viewport on desktop
    final double heroHeight = isDesktop
        ? (MediaQuery.of(context).size.height - 68).clamp(560.0, 900.0)
        : 0;

    return GridBackground(
      glowColor: AppColors.accentGreen,
      child: Container(
        color: const Color(0xFFF0FAF5),
        // Fixed height on desktop so Row children have a bounded axis to stretch into
        height: isDesktop ? heroHeight : null,
        child: isDesktop
            // ── Desktop: text left, image fills right box ──
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Left: padded text column — centred vertically
                  Expanded(
                    flex: 5,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 80, vertical: 60),
                        child: _HeroText(onDownloadTipMe, onTryTipBiz),
                      ),
                    ),
                  ),
                  // Right: image fills full height with uniform padding
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 36, 48, 36),
                      child: _HeroImage(),
                    ),
                  ),
                ],
              )
            // ── Mobile/tablet: stack vertically ──
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 24 : 48, vertical: 64),
                    child:
                        _HeroText(onDownloadTipMe, onTryTipBiz, centered: true),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 24 : 48),
                    child: _HeroImage(height: 260),
                  ),
                  const SizedBox(height: 48),
                ],
              ),
      ),
    );
  }
}

/// Hero photo — fills its parent completely, rounded corners, no fading.
class _HeroImage extends StatelessWidget {
  /// Fixed height for mobile. On desktop, null = expands to fill the Row height.
  final double? height;

  const _HeroImage({this.height});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height: height,   // null on desktop → inherits stretch height from Row
        width: double.infinity,
        child: Image.asset(
          'assets/images/cs-psi-pay-thumbnail.jpg',
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        ),
      ),
    )
        .animate()
        .fadeIn(delay: 200.ms, duration: 700.ms)
        .scale(
          begin: const Offset(1.03, 1.03),
          end: const Offset(1.0, 1.0),
          delay: 200.ms,
          duration: 700.ms,
          curve: Curves.easeOut,
        );
  }
}

class _HeroText extends StatelessWidget {
  final VoidCallback onDownloadTipMe;
  final VoidCallback onTryTipBiz;
  final bool centered;

  const _HeroText(this.onDownloadTipMe, this.onTryTipBiz,
      {this.centered = false});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);
    final headlineStyle =
        isMobile ? AppTextStyles.displaySmall : AppTextStyles.displayLarge;

    return Column(
      crossAxisAlignment:
          centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Eyebrow label
        Container(
          padding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.accentGreen.withOpacity(0.10),
            borderRadius: BorderRadius.circular(100),
            border:
                Border.all(color: AppColors.accentGreen.withOpacity(0.3)),
          ),
          child: Text(
            '✦  Empowering the service economy',
            style: AppTextStyles.sectionLabel.copyWith(fontSize: 11),
          ),
        )
            .animate()
            .fadeIn(duration: 600.ms)
            .slideY(
                begin: 0.15,
                end: 0,
                duration: 600.ms,
                curve: Curves.easeOut),
        const SizedBox(height: 24),

        // Headline
        RichText(
          textAlign: centered ? TextAlign.center : TextAlign.start,
          text: TextSpan(
            style: headlineStyle,
            children: const [
              TextSpan(text: 'Tipping for the\n'),
              TextSpan(
                text: 'Modern Economy',
                style: TextStyle(color: AppColors.accentGreen),
              ),
            ],
          ),
        )
            .animate()
            .fadeIn(delay: 100.ms, duration: 600.ms)
            .slideY(
                begin: 0.15,
                end: 0,
                delay: 100.ms,
                duration: 600.ms,
                curve: Curves.easeOut),
        const SizedBox(height: 20),

        // Subheadline
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Text(
            'Two apps. One platform. Whether you\'re a solo creator or a '
            'growing business — Tipss makes tipping seamless, fair, and instant.',
            style: AppTextStyles.bodyLarge,
            textAlign: centered ? TextAlign.center : TextAlign.start,
          ),
        )
            .animate()
            .fadeIn(delay: 200.ms, duration: 600.ms)
            .slideY(
                begin: 0.15,
                end: 0,
                delay: 200.ms,
                duration: 600.ms,
                curve: Curves.easeOut),
        const SizedBox(height: 40),

        // CTA Buttons
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment:
              centered ? WrapAlignment.center : WrapAlignment.start,
          children: [
            CtaButton(
              label: 'Download TipMe',
              accentColor: AppColors.accentGreen,
              icon: Icons.download_rounded,
              onTap: onDownloadTipMe,
            ),
            CtaButton(
              label: 'Try TipBiz',
              variant: CtaButtonVariant.outline,
              accentColor: AppColors.accentPurple,
              icon: Icons.business_rounded,
              onTap: onTryTipBiz,
            ),
          ],
        )
            .animate()
            .fadeIn(delay: 300.ms, duration: 600.ms)
            .slideY(
                begin: 0.15,
                end: 0,
                delay: 300.ms,
                duration: 600.ms,
                curve: Curves.easeOut),
        const SizedBox(height: 40),

        // Trust badges
        Wrap(
          spacing: 24,
          runSpacing: 12,
          alignment:
              centered ? WrapAlignment.center : WrapAlignment.start,
          children: [
            _TrustBadge(
                Icons.star_rounded, 'iOS & Android', AppColors.accentGreen),
            _TrustBadge(Icons.security_rounded, 'Secure Payments',
                AppColors.accentGreen),
            _TrustBadge(Icons.flash_on_rounded, 'Instant Payouts',
                AppColors.accentGreen),
          ],
        ).animate().fadeIn(delay: 400.ms, duration: 600.ms),
      ],
    );
  }
}

class _TrustBadge extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _TrustBadge(this.icon, this.label, this.color);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: 6),
        Text(label,
            style: AppTextStyles.bodySmall
                .copyWith(color: AppColors.mutedLight)),
      ],
    );
  }
}
