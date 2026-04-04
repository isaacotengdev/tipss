import 'package:flutter/material.dart';

class FeatureItem {
  final String iconAssetPath;
  final String title;
  final String description;
  final Color? accentColor;

  const FeatureItem({
    required this.iconAssetPath,
    required this.title,
    required this.description,
    this.accentColor,
  });
}
