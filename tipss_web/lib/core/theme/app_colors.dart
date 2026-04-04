import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Brand green — from logo
  static const Color brandGreen = Color(0xFF0DAF5C);
  static const Color brandGreenDark = Color(0xFF0A8F4A);
  static const Color brandGreenDeep = Color(0xFF076E39);

  // Backgrounds — light mode
  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFF5FAF7);
  static const Color surfaceElevated = Color(0xFFEBF5EF);

  // Borders & dividers
  static const Color border = Color(0xFFD1E8DA);
  static const Color borderSubtle = Color(0xFFE5F2EA);

  // Text
  static const Color foreground = Color(0xFF0D2318);   // near-black with green tint
  static const Color muted = Color(0xFF4A6B56);        // muted green-grey
  static const Color mutedLight = Color(0xFF6B8F78);   // lighter muted

  // TipMe accent — brand green
  static const Color accentGreen = Color(0xFF0DAF5C);
  static const Color accentGreenLight = Color(0xFF3DC27E);
  static Color accentGreenGlow = const Color(0xFF0DAF5C).withOpacity(0.15);
  static Color accentGreenGlowStrong = const Color(0xFF0DAF5C).withOpacity(0.28);

  // TipBiz accent — deep teal-blue (complements green)
  static const Color accentPurple = Color(0xFF1A73E8);
  static const Color accentPurpleLight = Color(0xFF4A95F0);
  static Color accentPurpleGlow = const Color(0xFF1A73E8).withOpacity(0.12);
  static Color accentPurpleGlowStrong = const Color(0xFF1A73E8).withOpacity(0.25);

  // Highlight
  static const Color gold = Color(0xFFE8A020);

  // Utility
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF0D2318);
  static const Color transparent = Colors.transparent;

  // Gradients
  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFF0FAF5), Color(0xFFFFFFFF)],
  );

  static const LinearGradient greenGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF0DAF5C), Color(0xFF076E39)],
  );

  static const LinearGradient purpleGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1A73E8), Color(0xFF1255B5)],
  );

  static const LinearGradient dividerGradient = LinearGradient(
    colors: [transparent, border, transparent],
  );
}
