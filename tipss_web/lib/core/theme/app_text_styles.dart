import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  // Display — hero headlines (Nunito ExtraBold, matches logo style)
  static TextStyle displayLarge = GoogleFonts.nunito(
    fontSize: 72,
    fontWeight: FontWeight.w800,
    color: AppColors.foreground,
    letterSpacing: -2.0,
    height: 1.05,
  );

  static TextStyle displayMedium = GoogleFonts.nunito(
    fontSize: 52,
    fontWeight: FontWeight.w800,
    color: AppColors.foreground,
    letterSpacing: -1.5,
    height: 1.1,
  );

  static TextStyle displaySmall = GoogleFonts.nunito(
    fontSize: 40,
    fontWeight: FontWeight.w800,
    color: AppColors.foreground,
    letterSpacing: -1.0,
    height: 1.15,
  );

  // Headlines — section / card titles
  static TextStyle headlineLarge = GoogleFonts.nunito(
    fontSize: 32,
    fontWeight: FontWeight.w800,
    color: AppColors.foreground,
    letterSpacing: -0.5,
    height: 1.2,
  );

  static TextStyle headlineMedium = GoogleFonts.nunito(
    fontSize: 26,
    fontWeight: FontWeight.w700,
    color: AppColors.foreground,
    letterSpacing: -0.3,
    height: 1.25,
  );

  // Title — feature card titles
  static TextStyle titleLarge = GoogleFonts.nunito(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.foreground,
    height: 1.3,
  );

  static TextStyle titleMedium = GoogleFonts.nunito(
    fontSize: 17,
    fontWeight: FontWeight.w700,
    color: AppColors.foreground,
    height: 1.4,
  );

  // Body — Inter for readability
  static TextStyle bodyLarge = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.muted,
    height: 1.75,
  );

  static TextStyle bodyMedium = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.muted,
    height: 1.7,
  );

  static TextStyle bodySmall = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.muted,
    height: 1.6,
  );

  // Label — monospace section labels
  static TextStyle sectionLabel = GoogleFonts.jetBrainsMono(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.accentGreen,
    letterSpacing: 2.5,
  );

  static TextStyle sectionLabelBlue = GoogleFonts.jetBrainsMono(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.accentPurple,
    letterSpacing: 2.5,
  );

  // Nav
  static TextStyle navLink = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.muted,
    letterSpacing: 0.1,
  );

  // Stat numbers
  static TextStyle statNumber = GoogleFonts.nunito(
    fontSize: 42,
    fontWeight: FontWeight.w800,
    color: AppColors.foreground,
    letterSpacing: -1.0,
  );

  static TextStyle statLabel = GoogleFonts.inter(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.muted,
    letterSpacing: 0.2,
  );

  // Footer
  static TextStyle footerLink = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.muted,
    height: 2.0,
  );

  static TextStyle footerCopyright = GoogleFonts.inter(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.muted,
  );
}
