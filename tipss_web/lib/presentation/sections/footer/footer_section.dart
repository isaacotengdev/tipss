import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/responsive_utils.dart';
import '../../../core/utils/url_launcher_service.dart';
import '../../../core/constants/urls.dart';
import '../../../widgets/decorative/gradient_divider.dart';
import '../nav/nav_bar.dart' show TipssLogoWidget;

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveUtils.isDesktop(context);
    final isMobile = ResponsiveUtils.isMobile(context);

    return Container(
      color: AppColors.surface,
      child: Column(
        children: [
          const GradientDivider(),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1280),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 24 : isDesktop ? 80 : 48,
                  vertical: 56,
                ),
                child: isDesktop
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(flex: 3, child: _FooterBrand()),
                          const SizedBox(width: 40),
                          Expanded(child: _FooterLinks('Products', [
                            _LinkItem('TipMe', null),
                            _LinkItem('TipBiz', null),
                          ])),
                          Expanded(child: _FooterLinks('Company', [
                            _LinkItem('About', null),
                            _LinkItem('Privacy Policy', AppUrls.privacyPolicy),
                            _LinkItem('Terms of Service', AppUrls.termsOfService),
                            _LinkItem('Contact', AppUrls.contactEmail),
                          ])),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _FooterBrand(),
                          const SizedBox(height: 40),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: _FooterLinks('Products', [
                                _LinkItem('TipMe', null),
                                _LinkItem('TipBiz', null),
                              ])),
                              Expanded(child: _FooterLinks('Company', [
                                _LinkItem('About', null),
                                _LinkItem('Privacy Policy', AppUrls.privacyPolicy),
                                _LinkItem('Terms of Service', AppUrls.termsOfService),
                                _LinkItem('Contact', AppUrls.contactEmail),
                              ])),
                            ],
                          ),
                        ],
                      ),
              ),
            ),
          ),
          const GradientDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
            child: Text(
              '© ${DateTime.now().year} Tipss Inc. All rights reserved.',
              style: AppTextStyles.footerCopyright,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class _FooterBrand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TipssLogoWidget(height: 40),
        const SizedBox(height: 12),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 240),
          child: Text(
            'Empowering the service economy.',
            style: AppTextStyles.footerLink,
          ),
        ),
        const SizedBox(height: 20),
        // Social icons
        Row(
          children: [
            _SocialIcon(Icons.alternate_email_rounded, AppUrls.twitter),
            const SizedBox(width: 12),
            _SocialIcon(Icons.linked_camera_rounded, AppUrls.linkedIn),
            const SizedBox(width: 12),
            _SocialIcon(Icons.mail_outline_rounded, AppUrls.contactEmail),
          ],
        ),
      ],
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final IconData icon;
  final String url;
  const _SocialIcon(this.icon, this.url);

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => UrlLauncherService.launch(widget.url),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: _hovered
                ? AppColors.accentGreen.withOpacity(0.12)
                : AppColors.surfaceElevated,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _hovered ? AppColors.accentGreen.withOpacity(0.5) : AppColors.border,
            ),
          ),
          child: Icon(
            widget.icon,
            size: 17,
            color: _hovered ? AppColors.accentGreen : AppColors.muted,
          ),
        ),
      ),
    );
  }
}

class _FooterLinks extends StatelessWidget {
  final String heading;
  final List<_LinkItem> links;

  const _FooterLinks(this.heading, this.links);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.foreground,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        ...links.map((link) => _FooterLinkWidget(link)),
      ],
    );
  }
}

class _LinkItem {
  final String label;
  final String? url;
  const _LinkItem(this.label, this.url);
}

class _FooterLinkWidget extends StatefulWidget {
  final _LinkItem item;
  const _FooterLinkWidget(this.item);

  @override
  State<_FooterLinkWidget> createState() => _FooterLinkWidgetState();
}

class _FooterLinkWidgetState extends State<_FooterLinkWidget> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.item.url != null
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.item.url != null
            ? () => UrlLauncherService.launch(widget.item.url!)
            : null,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 150),
            style: AppTextStyles.footerLink.copyWith(
              color: _hovered ? AppColors.accentGreen : AppColors.muted,
            ),
            child: Text(widget.item.label),
          ),
        ),
      ),
    );
  }
}
