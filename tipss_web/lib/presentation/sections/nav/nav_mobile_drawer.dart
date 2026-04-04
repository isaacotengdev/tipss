import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../widgets/buttons/cta_button.dart';

class NavMobileDrawer extends StatelessWidget {
  final void Function(String) onNavigate;

  const NavMobileDrawer({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Center(
            child: Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.border,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 28),
          _DrawerLink('Home', () {
            Navigator.pop(context);
            onNavigate('home');
          }),
          _DrawerLink('About Us', () {
            Navigator.pop(context);
            onNavigate('about');
          }),
          _DrawerLink('Solutions', () {
            Navigator.pop(context);
            onNavigate('solutions');
          }),
          _DrawerLink('FAQ', () {
            Navigator.pop(context);
            onNavigate('faq');
          }),
          const SizedBox(height: 24),
          Divider(color: AppColors.border),
          const SizedBox(height: 20),
          CtaButton(
            label: 'Download Apps',
            width: double.infinity,
            accentColor: AppColors.accentGreen,
            icon: Icons.download_rounded,
            onTap: () {
              Navigator.pop(context);
              onNavigate('download');
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _DrawerLink extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _DrawerLink(this.label, this.onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
        child: Text(
          label,
          style: AppTextStyles.titleMedium.copyWith(
            color: AppColors.foreground,
          ),
        ),
      ),
    );
  }
}
