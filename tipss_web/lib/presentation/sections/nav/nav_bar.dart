import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/constants/breakpoints.dart';
import '../../../core/utils/responsive_utils.dart';
import '../../../widgets/buttons/cta_button.dart';
import 'nav_mobile_drawer.dart';

class TipssNavBar extends StatefulWidget {
  final ScrollController scrollController;
  final Map<String, GlobalKey> sectionKeys;

  const TipssNavBar({
    super.key,
    required this.scrollController,
    required this.sectionKeys,
  });

  @override
  State<TipssNavBar> createState() => _TipssNavBarState();
}

class _TipssNavBarState extends State<TipssNavBar> {
  bool _scrolled = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final isScrolled = widget.scrollController.offset > 60;
    if (isScrolled != _scrolled) setState(() => _scrolled = isScrolled);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _scrollTo(String sectionKey) {
    if (sectionKey == 'home') {
      widget.scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
      return;
    }
    final key = widget.sectionKeys[sectionKey];
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveUtils.isDesktop(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: _scrolled
            ? AppColors.white.withOpacity(0.95)
            : AppColors.white,
        boxShadow: [
          BoxShadow(
            color: _scrolled
                ? AppColors.brandGreen.withOpacity(0.10)
                : AppColors.border.withOpacity(0.5),
            blurRadius: _scrolled ? 20 : 0,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ClipRect(
        child: BackdropFilter(
          filter: _scrolled
              ? ImageFilter.blur(sigmaX: 10, sigmaY: 10)
              : ImageFilter.blur(sigmaX: 0, sigmaY: 0),
          child: Padding(
                padding: EdgeInsets.only(
                  left: isDesktop ? 32 : 20,
                  right: isDesktop ? 40 : 20,
                  top: 10,
                  bottom: 10,
                ),
                child: Row(
                  children: [
                    TipssLogoWidget(),
                    const Spacer(),
                    if (isDesktop) ...[
                      _NavLink('Home', () => _scrollTo('home')),
                      const SizedBox(width: 32),
                      _NavLink('About Us', () => _scrollTo('about')),
                      const SizedBox(width: 32),
                      _NavLink('Solutions', () => _scrollTo('solutions')),
                      const SizedBox(width: 32),
                      _NavLink('FAQ', () => _scrollTo('faq')),
                      const SizedBox(width: 40),
                      CtaButton(
                        label: 'Download Apps',
                        accentColor: AppColors.accentGreen,
                        icon: Icons.download_rounded,
                        onTap: () => _scrollTo('download'),
                      ),
                    ] else
                      IconButton(
                        icon: const Icon(Icons.menu_rounded,
                            color: AppColors.foreground),
                        onPressed: () => _openDrawer(context),
                      ),
                  ],
                ),
          ),
        ),
      ),
    );
  }

  void _openDrawer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => NavMobileDrawer(onNavigate: _scrollTo),
    );
  }
}

/// The actual tip$$ logo PNG asset.
class TipssLogoWidget extends StatelessWidget {
  final double height;

  const TipssLogoWidget({super.key, this.height = 44});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Image.asset(
        'assets/images/logo.png',
        height: height,
        fit: BoxFit.contain,
        filterQuality: FilterQuality.high,
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _NavLink(this.label, this.onTap);

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 150),
              style: AppTextStyles.navLink.copyWith(
                color: _hovered ? AppColors.brandGreen : AppColors.muted,
                fontWeight: _hovered ? FontWeight.w600 : FontWeight.w500,
              ),
              child: Text(widget.label),
            ),
            const SizedBox(height: 3),
            AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              height: 2,
              width: _hovered ? 20 : 0,
              decoration: BoxDecoration(
                color: AppColors.brandGreen,
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
