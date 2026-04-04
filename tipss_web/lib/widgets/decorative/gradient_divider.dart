import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class GradientDivider extends StatelessWidget {
  final double height;
  final EdgeInsetsGeometry? margin;

  const GradientDivider({
    super.key,
    this.height = 1,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      decoration: const BoxDecoration(
        gradient: AppColors.dividerGradient,
      ),
    );
  }
}
