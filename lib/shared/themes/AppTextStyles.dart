import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wikly/shared/themes/AppColors.dart';

class AppTextStyles {
  static final titleHome = GoogleFonts.redHatDisplay(
    fontSize: 24,
    fontWeight: FontWeight.normal,
    color: AppColors.heading,
  );
  static final titleHomeBold = GoogleFonts.redHatDisplay(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.heading,
  );
  static final inputBold = GoogleFonts.redHatDisplay(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.heading,
  );
  static final inputHintBold = GoogleFonts.redHatDisplay(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.heading.withOpacity(0.3),
  );
  static final button = GoogleFonts.redHatDisplay(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.heading,
  );
  static final bottomMenuButton = GoogleFonts.redHatDisplay(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.heading,
  );
  static final item = GoogleFonts.redHatDisplay(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: AppColors.heading,
  );
  static final itemDescription = GoogleFonts.redHatDisplay(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.heading,
  );
  static final itemCompleted = GoogleFonts.redHatDisplay(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.lineThrough,
    color: AppColors.completed,
  );
}
