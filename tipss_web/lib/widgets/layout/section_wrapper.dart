import 'package:flutter/material.dart';
import '../../core/constants/breakpoints.dart';
import '../../core/utils/responsive_utils.dart';

class SectionWrapper extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final double maxWidth;

  const SectionWrapper({
    super.key,
    required this.child,
    this.backgroundColor,
    this.padding,
    this.maxWidth = Breakpoints.maxContentWidth,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveUtils.isDesktop(context);
    final isMobile = ResponsiveUtils.isMobile(context);

    final horizontalPadding = isMobile ? 24.0 : isDesktop ? 80.0 : 48.0;
    final verticalPadding = isMobile ? 64.0 : 96.0;

    return Container(
      color: backgroundColor,
      width: double.infinity,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Padding(
            padding: padding ??
                EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding,
                ),
            child: child,
          ),
        ),
      ),
    );
  }
}
