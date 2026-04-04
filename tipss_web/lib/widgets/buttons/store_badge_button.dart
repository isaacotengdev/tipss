import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/url_launcher_service.dart';

enum StorePlatform { appStore, playStore }

class StoreBadgeButton extends StatefulWidget {
  final StorePlatform platform;
  final String url;
  final Color accentColor;
  final double width;

  const StoreBadgeButton({
    super.key,
    required this.platform,
    required this.url,
    required this.accentColor,
    this.width = 160,
  });

  @override
  State<StoreBadgeButton> createState() => _StoreBadgeButtonState();
}

class _StoreBadgeButtonState extends State<StoreBadgeButton> {
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
          duration: const Duration(milliseconds: 180),
          width: widget.width,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: _hovered
                ? widget.accentColor.withOpacity(0.06)
                : AppColors.surfaceElevated,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: _hovered ? widget.accentColor.withOpacity(0.5) : AppColors.border,
              width: 1,
            ),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: widget.accentColor.withOpacity(0.10),
                      blurRadius: 16,
                    )
                  ]
                : [],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                widget.platform == StorePlatform.appStore
                    ? 'assets/svg/apple_logo.svg'
                    : 'assets/svg/google_play_logo.svg',
                width: 20,
                height: 20,
                colorFilter: ColorFilter.mode(
                  _hovered ? widget.accentColor : AppColors.foreground,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.platform == StorePlatform.appStore
                        ? 'App Store'
                        : 'Google Play',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: _hovered ? widget.accentColor : AppColors.foreground,
                    ),
                  ),
                  Text(
                    widget.platform == StorePlatform.appStore
                        ? 'iOS'
                        : 'Android',
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 11,
                      color: AppColors.muted,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
