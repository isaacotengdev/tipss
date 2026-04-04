import 'package:flutter/material.dart';
import '../models/feature_item.dart';

enum AppProductType { tipMe, tipBiz }

class AppProduct {
  final AppProductType type;
  final String name;
  final String tagline;
  final String description;
  final Color accentColor;
  final Color accentGlow;
  final String appStoreUrl;
  final String playStoreUrl;
  final List<FeatureItem> features;
  final List<String> highlights;

  const AppProduct({
    required this.type,
    required this.name,
    required this.tagline,
    required this.description,
    required this.accentColor,
    required this.accentGlow,
    required this.appStoreUrl,
    required this.playStoreUrl,
    required this.features,
    required this.highlights,
  });
}
