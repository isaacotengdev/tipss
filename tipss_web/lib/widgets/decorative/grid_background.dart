import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class GridBackground extends StatelessWidget {
  final Widget child;
  final Color? glowColor;

  const GridBackground({
    super.key,
    required this.child,
    this.glowColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Dot grid pattern
        Positioned.fill(
          child: CustomPaint(
            painter: _DotGridPainter(),
          ),
        ),
        // Radial glow
        if (glowColor != null)
          Positioned(
            top: -200,
            left: 0,
            right: 0,
            child: Container(
              height: 600,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.topCenter,
                  radius: 0.8,
                  colors: [
                    glowColor!.withOpacity(0.12),
                    AppColors.transparent,
                  ],
                ),
              ),
            ),
          ),
        child,
      ],
    );
  }
}

class _DotGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const spacing = 28.0;
    const dotRadius = 1.0;
    final paint = Paint()
      ..color = const Color(0xFF0DAF5C).withOpacity(0.10)
      ..style = PaintingStyle.fill;

    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), dotRadius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(_DotGridPainter oldDelegate) => false;
}
