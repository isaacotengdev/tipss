import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';

enum CtaButtonVariant { primary, secondary, outline }

class CtaButton extends StatefulWidget {
  final String label;
  final VoidCallback? onTap;
  final CtaButtonVariant variant;
  final Color accentColor;
  final IconData? icon;
  final double? width;

  const CtaButton({
    super.key,
    required this.label,
    this.onTap,
    this.variant = CtaButtonVariant.primary,
    this.accentColor = AppColors.accentGreen,
    this.icon,
    this.width,
  });

  @override
  State<CtaButton> createState() => _CtaButtonState();
}

class _CtaButtonState extends State<CtaButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          width: widget.width,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          decoration: _decoration(),
          child: Row(
            mainAxisSize: widget.width != null ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.icon != null) ...[
                Icon(widget.icon, size: 18, color: _textColor()),
                const SizedBox(width: 8),
              ],
              Text(
                widget.label,
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: _textColor(),
                  letterSpacing: 0.1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _decoration() {
    switch (widget.variant) {
      case CtaButtonVariant.primary:
        return BoxDecoration(
          gradient: LinearGradient(
            colors: _hovered
                ? [widget.accentColor, widget.accentColor.withOpacity(0.8)]
                : [
                    widget.accentColor,
                    widget.accentColor == AppColors.accentGreen
                        ? const Color(0xFF00A86B)
                        : const Color(0xFF5A3ED4),
                  ],
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: widget.accentColor.withOpacity(0.35),
                    blurRadius: 20,
                    offset: const Offset(0, 6),
                  )
                ]
              : [],
        );
      case CtaButtonVariant.outline:
        return BoxDecoration(
          color: _hovered ? widget.accentColor.withOpacity(0.08) : AppColors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: _hovered ? widget.accentColor : widget.accentColor.withOpacity(0.5),
            width: 1.5,
          ),
        );
      case CtaButtonVariant.secondary:
        return BoxDecoration(
          color: _hovered ? AppColors.surfaceElevated : AppColors.surface,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.border),
        );
    }
  }

  Color _textColor() {
    switch (widget.variant) {
      case CtaButtonVariant.primary:
        return widget.accentColor == AppColors.accentGreen
            ? AppColors.background
            : AppColors.white;
      case CtaButtonVariant.outline:
        return widget.accentColor;
      case CtaButtonVariant.secondary:
        return AppColors.foreground;
    }
  }
}
