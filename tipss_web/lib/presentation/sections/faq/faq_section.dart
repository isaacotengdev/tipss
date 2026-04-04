import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/responsive_utils.dart';
import '../../../widgets/layout/animated_section.dart';
import '../../../widgets/layout/section_wrapper.dart';

class FaqSection extends StatelessWidget {
  const FaqSection({super.key});

  static const List<Map<String, String>> _faqs = [
    {
      'q': 'What is Tipss?',
      'a': 'Tipss is a digital tipping platform with two products: TipMe for individuals '
          'who want to receive tips cashlessly, and TipBiz for businesses that need '
          'automated, transparent tip pool management for their teams.',
    },
    {
      'q': 'How does TipMe work?',
      'a': 'Download TipMe, set up your profile in under 5 minutes, and share your personal '
          'QR code or link with customers. Tips go directly to your connected bank account '
          'or mobile money — instantly and with zero fees for recipients.',
    },
    {
      'q': 'Who is TipBiz for?',
      'a': 'TipBiz is built for any business with a tipped team — restaurants, hotels, '
          'salons, event venues, and more. It automates tip collection, pooling, and '
          'distribution so owners and managers don\'t have to do it manually.',
    },
    {
      'q': 'Are there fees for receiving tips?',
      'a': 'With TipMe, recipients keep 100% of every tip. Tipss charges a small '
          'convenience fee to the person giving the tip, not the person receiving it. '
          'TipBiz is available on a monthly subscription — no per-transaction fees.',
    },
    {
      'q': 'Is Tipss available in my country?',
      'a': 'Tipss is currently available in 50+ countries across Africa and expanding globally. '
          'Check the App Store or Google Play listing for your region\'s availability.',
    },
    {
      'q': 'How long does it take to receive a payout?',
      'a': 'Payouts through TipMe are processed within minutes to your linked account. '
          'Exact timing depends on your bank or mobile money provider.',
    },
    {
      'q': 'Can TipBiz handle multiple locations?',
      'a': 'Yes. TipBiz supports unlimited locations on the Enterprise plan and up to '
          '3 locations on the Growth plan. Each location can have its own staff roster '
          'and distribution rules.',
    },
    {
      'q': 'How do I get started with TipBiz?',
      'a': 'Download TipBiz from the App Store or Google Play, create your business account, '
          'add your staff roster, set your pool distribution rules, and you\'re live. '
          'Our onboarding wizard walks you through each step.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveUtils.isDesktop(context);

    return SectionWrapper(
      child: AnimatedSection(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('FAQ', style: AppTextStyles.sectionLabel),
            const SizedBox(height: 12),
            Text('Frequently Asked Questions', style: AppTextStyles.displaySmall),
            const SizedBox(height: 16),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 560),
              child: Text(
                'Everything you need to know about Tipss, TipMe, and TipBiz.',
                style: AppTextStyles.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 56),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Column(
                children: _faqs
                    .map((faq) => _FaqItem(question: faq['q']!, answer: faq['a']!))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FaqItem extends StatefulWidget {
  final String question;
  final String answer;

  const _FaqItem({required this.question, required this.answer});

  @override
  State<_FaqItem> createState() => _FaqItemState();
}

class _FaqItemState extends State<_FaqItem> with SingleTickerProviderStateMixin {
  bool _expanded = false;
  late AnimationController _controller;
  late Animation<double> _heightFactor;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 260),
      vsync: this,
    );
    _heightFactor = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() => _expanded = !_expanded);
    if (_expanded) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: _toggle,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 4),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.question,
                    style: AppTextStyles.titleMedium.copyWith(
                      color: _expanded ? AppColors.brandGreen : AppColors.foreground,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                AnimatedRotation(
                  turns: _expanded ? 0.25 : 0,
                  duration: const Duration(milliseconds: 260),
                  curve: Curves.easeOut,
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: _expanded
                          ? AppColors.brandGreen
                          : AppColors.surfaceElevated,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.add_rounded,
                      size: 20,
                      color: _expanded ? AppColors.white : AppColors.muted,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizeTransition(
          sizeFactor: _heightFactor,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20, right: 48),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(widget.answer, style: AppTextStyles.bodyMedium),
            ),
          ),
        ),
        Divider(color: AppColors.border, height: 1),
      ],
    );
  }
}
