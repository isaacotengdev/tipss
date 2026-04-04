import 'package:flutter/material.dart';
import '../models/feature_item.dart';
import '../models/app_product.dart';
import '../../core/theme/app_colors.dart';
import '../../core/constants/urls.dart';

class TipMeContent {
  TipMeContent._();

  static const String headline = 'Get Tipped Instantly';
  static const String tagline = 'Your personal tipping link, ready in seconds.';
  static const String description =
      'TipMe gives every individual a simple, shareable way to receive tips. '
      'Generate your unique QR code, share your link, and get paid — '
      'with no cash, no awkwardness, and zero fees for recipients.';

  static const List<String> highlights = [
    'Instant payouts to your bank',
    'Share via QR code or link',
    'Zero fees for recipients',
  ];

  static const List<String> useCases = [
    'Freelancers',
    'Street performers',
    'Delivery drivers',
    'Musicians & artists',
    'Content creators',
    'Service workers',
  ];

  static const List<Map<String, String>> stats = [
    {'value': '5 sec', 'label': 'Setup time'},
    {'value': '0%', 'label': 'Recipient fees'},
    {'value': 'Instant', 'label': 'Payouts'},
  ];

  static final List<FeatureItem> features = [
    const FeatureItem(
      iconAssetPath: 'assets/svg/icons/icon_qr.svg',
      title: 'Instant QR Code',
      description:
          'Generate your personal tip QR in seconds. Print it, display it, or share it anywhere.',
      accentColor: AppColors.accentGreen,
    ),
    const FeatureItem(
      iconAssetPath: 'assets/svg/icons/icon_link.svg',
      title: 'Custom Profile Link',
      description:
          'Your own tipping page with your photo, name, and bio. Share it on any platform.',
      accentColor: AppColors.accentGreen,
    ),
    const FeatureItem(
      iconAssetPath: 'assets/svg/icons/icon_wallet.svg',
      title: 'Instant Payouts',
      description:
          'Funds hit your connected account within minutes, not days. No waiting, no holds.',
      accentColor: AppColors.accentGreen,
    ),
    const FeatureItem(
      iconAssetPath: 'assets/svg/icons/icon_chart.svg',
      title: 'Tip History',
      description:
          'See every tip with timestamps, amounts, and optional messages from tippers.',
      accentColor: AppColors.accentGreen,
    ),
    const FeatureItem(
      iconAssetPath: 'assets/svg/icons/icon_mobile.svg',
      title: 'Multiple Payment Methods',
      description:
          'Accept tips via debit card, credit card, Apple Pay, and Google Pay.',
      accentColor: AppColors.accentGreen,
    ),
    const FeatureItem(
      iconAssetPath: 'assets/svg/icons/icon_shield.svg',
      title: 'Zero Recipient Fees',
      description:
          'You keep 100% of every tip. We charge tippers a small convenience fee, not you.',
      accentColor: AppColors.accentGreen,
    ),
  ];

  static AppProduct get product => AppProduct(
        type: AppProductType.tipMe,
        name: 'TipMe',
        tagline: tagline,
        description: description,
        accentColor: AppColors.accentGreen,
        accentGlow: AppColors.accentGreenGlow,
        appStoreUrl: AppUrls.tipMeAppStore,
        playStoreUrl: AppUrls.tipMePlayStore,
        features: features,
        highlights: highlights,
      );
}
