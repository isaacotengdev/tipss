import 'package:flutter/material.dart';
import '../models/feature_item.dart';
import '../models/app_product.dart';
import '../../core/theme/app_colors.dart';
import '../../core/constants/urls.dart';

class TipBizContent {
  TipBizContent._();

  static const String headline = 'Fair Tips, Happy Teams';
  static const String tagline = 'Automated tip pooling for modern businesses.';
  static const String description =
      'TipBiz gives businesses full control over how tips are collected and distributed. '
      'Set your pooling rules once, and let TipBiz handle the rest — '
      'transparently, fairly, and with a complete audit trail every time.';

  static const List<String> highlights = [
    'Automated pool distribution',
    'Multi-location support',
    'Transparent reporting',
  ];

  static const List<String> businessTypes = [
    'Restaurants & cafes',
    'Hotels & hospitality',
    'Salons & spas',
    'Retail stores',
    'Event venues',
    'Any tipped team',
  ];

  static const List<Map<String, String>> stats = [
    {'value': 'Auto', 'label': 'Distribution'},
    {'value': '100%', 'label': 'Transparent'},
    {'value': 'Multi', 'label': 'Location'},
  ];

  static const List<Map<String, String>> pricing = [
    {
      'plan': 'Starter',
      'price': '\$29',
      'period': '/mo',
      'detail': 'Up to 10 staff · 1 location',
    },
    {
      'plan': 'Growth',
      'price': '\$79',
      'period': '/mo',
      'detail': 'Up to 50 staff · 3 locations',
    },
    {
      'plan': 'Enterprise',
      'price': 'Custom',
      'period': '',
      'detail': 'Unlimited staff & locations',
    },
  ];

  static final List<FeatureItem> features = [
    const FeatureItem(
      iconAssetPath: 'assets/svg/icons/icon_pool.svg',
      title: 'Tip Pool Management',
      description:
          'Define pool rules once. Distribution runs automatically at the end of every shift.',
      accentColor: AppColors.accentPurple,
    ),
    const FeatureItem(
      iconAssetPath: 'assets/svg/icons/icon_people.svg',
      title: 'Staff Roster',
      description:
          'Add, remove, and manage staff across all your locations from one dashboard.',
      accentColor: AppColors.accentPurple,
    ),
    const FeatureItem(
      iconAssetPath: 'assets/svg/icons/icon_chart.svg',
      title: 'Transparent Reporting',
      description:
          'Every transaction logged with timestamped, audit-ready exports for your records.',
      accentColor: AppColors.accentPurple,
    ),
    const FeatureItem(
      iconAssetPath: 'assets/svg/icons/icon_map.svg',
      title: 'Multi-Location Support',
      description:
          'One dashboard for all your venues. Manage rules and staff by location.',
      accentColor: AppColors.accentPurple,
    ),
    const FeatureItem(
      iconAssetPath: 'assets/svg/icons/icon_settings.svg',
      title: 'Custom Distribution Rules',
      description:
          'Split equally, by hours worked, by role, or fully custom weighting — your choice.',
      accentColor: AppColors.accentPurple,
    ),
    const FeatureItem(
      iconAssetPath: 'assets/svg/icons/icon_shield.svg',
      title: 'Subscription Plans',
      description:
          'Predictable monthly pricing that scales with your team. No hidden transaction fees.',
      accentColor: AppColors.accentPurple,
    ),
  ];

  static AppProduct get product => AppProduct(
        type: AppProductType.tipBiz,
        name: 'TipBiz',
        tagline: tagline,
        description: description,
        accentColor: AppColors.accentPurple,
        accentGlow: AppColors.accentPurpleGlow,
        appStoreUrl: AppUrls.tipBizAppStore,
        playStoreUrl: AppUrls.tipBizPlayStore,
        features: features,
        highlights: highlights,
      );
}
