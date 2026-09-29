import 'package:flutter/material.dart';

class AppTheme {
  // ============================================================
  // PACHAPP ENVIRONMENT GREEN PALETTE
  // ============================================================

  // Main dark greens
  static const Color darkGreen = Color(0xFF064E2A);
  static const Color forestGreen = Color(0xFF087F3F);
  static const Color primaryGreen = Color(0xFF0B8F47);

  // Bright environmental greens
  static const Color leafGreen = Color(0xFF39B54A);
  static const Color brightGreen = Color(0xFF5BCB65);

  // Soft environmental backgrounds
  static const Color softGreen = Color(0xFFE8F7E9);
  static const Color mintGreen = Color(0xFFF1FAF2);
  static const Color background = Color(0xFFF7FBF7);

  // White surfaces/cards
  static const Color cardWhite = Color(0xFFFFFFFF);

  // Text
  static const Color textDark = Color(0xFF123524);
  static const Color textMedium = Color(0xFF52665A);
  static const Color textLight = Color(0xFF7B8B81);

  // Borders
  static const Color border = Color(0xFFD8EBDD);

  // Reward / highlight colour
  static const Color rewardOrange = Color(0xFFF2A51A);
  static const Color rewardLight = Color(0xFFFFF3D8);

  // ============================================================
  // THEME
  // ============================================================

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    scaffoldBackgroundColor: background,

    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryGreen,
      brightness: Brightness.light,
    ).copyWith(
      primary: primaryGreen,
      secondary: leafGreen,
      surface: cardWhite,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: textDark,
    ),

    // ==========================================================
    // APP BAR
    // ==========================================================

    appBarTheme: const AppBarTheme(
      backgroundColor: darkGreen,
      foregroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
    ),

    // ==========================================================
    // TEXT
    // ==========================================================

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w900,
        color: darkGreen,
      ),

      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w800,
        color: darkGreen,
      ),

      headlineSmall: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.w800,
        color: darkGreen,
      ),

      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w800,
        color: textDark,
      ),

      titleMedium: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w700,
        color: textDark,
      ),

      bodyLarge: TextStyle(
        fontSize: 17,
        color: textDark,
      ),

      bodyMedium: TextStyle(
        fontSize: 15,
        color: textMedium,
      ),

      bodySmall: TextStyle(
        fontSize: 13,
        color: textLight,
      ),
    ),

    // ==========================================================
    // TEXT FIELDS
    // ==========================================================

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,

      contentPadding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 17,
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: border,
        ),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: border,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: primaryGreen,
          width: 2,
        ),
      ),

      labelStyle: const TextStyle(
        color: textMedium,
      ),

      hintStyle: const TextStyle(
        color: textLight,
      ),
    ),

    // ==========================================================
    // GREEN BUTTONS
    // ==========================================================

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: forestGreen,
        foregroundColor: Colors.white,

        minimumSize: const Size.fromHeight(54),

        elevation: 3,

        shadowColor: primaryGreen.withOpacity(0.25),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),

        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),

    // ==========================================================
    // OUTLINED BUTTONS
    // ==========================================================

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: forestGreen,

        minimumSize: const Size.fromHeight(54),

        side: const BorderSide(
          color: primaryGreen,
          width: 1.5,
        ),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),

        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),

    // ==========================================================
    // CARDS
    // ==========================================================

    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 1,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(
          color: border,
        ),
      ),
    ),

    // ==========================================================
    // BOTTOM NAVIGATION
    // ==========================================================

    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: Colors.white,
      indicatorColor: softGreen,

      labelTextStyle: WidgetStatePropertyAll(
        TextStyle(
          color: primaryGreen,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
  );
}
