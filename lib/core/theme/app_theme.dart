import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // ═══════════════════════════════════════════════
  // BRAND COLORS
  // ═══════════════════════════════════════════════

  static const Color primary = Color(0xFFFF8A00);
  static const Color primaryDark = Color(0xFFE66F00);
  static const Color accent = Color(0xFFFFB347);

  // ═══════════════════════════════════════════════
  // DARK THEME — MAIN PORTFOLIO
  // ═══════════════════════════════════════════════

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    scaffoldBackgroundColor: const Color(0xFF070B10),

    colorScheme: const ColorScheme.dark(
      primary: primary,
      secondary: accent,
      surface: Color(0xFF0B1118),
      surfaceContainer: Color(0xFF111821),
      outline: Color(0xFF26313D),
      outlineVariant: Color(0xFF1B252F),
      onSurface: Color(0xFFF5F7FA),
      onSurfaceVariant: Color(0xFF9AA6B2),
    ),

    textTheme: GoogleFonts.interTextTheme(
      ThemeData.dark().textTheme,
    ).copyWith(
      displayLarge: GoogleFonts.inter(
        fontSize: 64,
        fontWeight: FontWeight.w900,
        letterSpacing: -3,
        height: 0.98,
        color: Colors.white,
      ),

      displayMedium: GoogleFonts.inter(
        fontSize: 50,
        fontWeight: FontWeight.w900,
        letterSpacing: -2,
        color: Colors.white,
      ),

      headlineLarge: GoogleFonts.inter(
        fontSize: 40,
        fontWeight: FontWeight.w800,
        color: Colors.white,
      ),

      headlineMedium: GoogleFonts.inter(
        fontSize: 32,
        fontWeight: FontWeight.w800,
        color: Colors.white,
      ),

      headlineSmall: GoogleFonts.inter(
        fontSize: 26,
        fontWeight: FontWeight.w800,
        color: Colors.white,
      ),

      titleLarge: GoogleFonts.inter(
        fontSize: 21,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),

      titleMedium: GoogleFonts.inter(
        fontSize: 17,
        fontWeight: FontWeight.w500,
        color: const Color(0xFFD5DAE0),
      ),

      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        height: 1.7,
        color: const Color(0xFFD0D6DD),
      ),

      bodyMedium: GoogleFonts.inter(
        fontSize: 14,
        height: 1.6,
        color: const Color(0xFF9AA6B2),
      ),

      bodySmall: GoogleFonts.inter(
        fontSize: 12,
        color: const Color(0xFF7F8A96),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.black,
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 15,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        textStyle: const TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 13,
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(
          color: Color(0xFF394550),
          width: 1,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 15,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        textStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 13,
        ),
      ),
    ),
  );

  // ═══════════════════════════════════════════════
  // LIGHT THEME
  // ═══════════════════════════════════════════════

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    scaffoldBackgroundColor: const Color(0xFFF5F7FA),

    colorScheme: const ColorScheme.light(
      primary: primaryDark,
      secondary: primary,
      surface: Colors.white,
      surfaceContainer: Color(0xFFF0F2F5),
      outline: Color(0xFFD0D5DB),
      outlineVariant: Color(0xFFE2E6EA),
      onSurface: Color(0xFF10151B),
      onSurfaceVariant: Color(0xFF66717D),
    ),

    textTheme: GoogleFonts.interTextTheme(
      ThemeData.light().textTheme,
    ).copyWith(
      displayLarge: GoogleFonts.inter(
        fontSize: 64,
        fontWeight: FontWeight.w900,
        letterSpacing: -3,
      ),

      displayMedium: GoogleFonts.inter(
        fontSize: 50,
        fontWeight: FontWeight.w900,
        letterSpacing: -2,
      ),

      headlineLarge: GoogleFonts.inter(
        fontSize: 40,
        fontWeight: FontWeight.w800,
      ),

      headlineMedium: GoogleFonts.inter(
        fontSize: 32,
        fontWeight: FontWeight.w800,
      ),

      headlineSmall: GoogleFonts.inter(
        fontSize: 26,
        fontWeight: FontWeight.w800,
      ),

      titleLarge: GoogleFonts.inter(
        fontSize: 21,
        fontWeight: FontWeight.w700,
      ),

      titleMedium: GoogleFonts.inter(
        fontSize: 17,
        fontWeight: FontWeight.w500,
      ),

      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        height: 1.7,
      ),

      bodyMedium: GoogleFonts.inter(
        fontSize: 14,
        height: 1.6,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryDark,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 15,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}