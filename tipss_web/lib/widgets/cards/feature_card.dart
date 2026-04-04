import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../data/models/feature_item.dart';
import '../decorative/glow_container.dart';

class FeatureCard extends StatelessWidget {
  final FeatureItem item;

  const FeatureCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final accent = item.accentColor ?? AppColors.accentGreen;

    return GlowContainer(
      glowColor: accent,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon in rounded container
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: accent.withOpacity(0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: SvgPicture.asset(
                item.iconAssetPath,
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(accent, BlendMode.srcIn),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(item.title, style: AppTextStyles.titleMedium),
          const SizedBox(height: 8),
          Text(item.description, style: AppTextStyles.bodySmall),
        ],
      ),
    );
  }
}
