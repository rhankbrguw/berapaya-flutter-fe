import 'package:berapaya_fe_flutter/app/config/theme/semantic_colors.dart';
import 'package:berapaya_fe_flutter/app/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    final textTheme = GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme);

    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primaryDarkGreen,
      scaffoldBackgroundColor: AppColors.backgroundLight,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryDarkGreen,
        secondary: AppColors.secondaryTeal,
        tertiary: AppColors.accentBlue,
        surface: AppColors.white,
        error: AppColors.redError,
        onPrimary: AppColors.white,
        onSecondary: AppColors.white,
        onSurface: AppColors.darkestText,
        onError: AppColors.white,
      ),
      fontFamily: GoogleFonts.poppins().fontFamily,
      textTheme: textTheme.copyWith(
        titleLarge: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
      ),
      extensions: const <ThemeExtension<dynamic>>[
        lightSemanticColors,
      ],
    );
  }

  static ThemeData get darkTheme {
    final textTheme = GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme);

    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.accentBlue,
      scaffoldBackgroundColor: const Color(0xFF001F25),
      colorScheme: const ColorScheme.dark(
        primary: AppColors.accentBlue,
        secondary: AppColors.secondaryTeal,
        tertiary: AppColors.accentBlue,
        surface: Color.fromARGB(255, 2, 40, 46),
        error: AppColors.redError,
        onPrimary: AppColors.darkestText,
        onSecondary: AppColors.white,
        onSurface: AppColors.white,
        onError: AppColors.white,
      ),
      fontFamily: GoogleFonts.poppins().fontFamily,
      textTheme: textTheme.copyWith(
        titleLarge: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
      ),
      extensions: const <ThemeExtension<dynamic>>[
        darkSemanticColors,
      ],
    );
  }
}
