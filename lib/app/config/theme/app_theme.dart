import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/color_constants.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primaryDarkGreen,
      scaffoldBackgroundColor: AppColors.backgroundLight,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryDarkGreen,
        secondary: AppColors.secondaryTeal,
        onPrimary: AppColors.white,
        onSecondary: AppColors.white,
        error: AppColors.redError,
        surface: AppColors.white,
        onSurface: AppColors.darkestText,
      ),
      textTheme:
          GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme).copyWith(
        bodyMedium: GoogleFonts.poppins(color: AppColors.darkestText),
        titleLarge: GoogleFonts.poppins(
            color: AppColors.darkestText, fontWeight: FontWeight.bold),
      ),
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryDarkGreen,
        elevation: 0,
        titleTextStyle: GoogleFonts.poppins(
          color: AppColors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: const IconThemeData(
          color: AppColors.white,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryDarkGreen,
          foregroundColor: AppColors.white,
          textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
