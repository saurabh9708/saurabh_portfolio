import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Color Tokens
  static const Color bg = Color(0xFF050810);
  static const Color bg2 = Color(0xFF080c18);
  static const Color bg3 = Color(0xFF0d1225);
  static const Color surface = Color.fromRGBO(255, 255, 255, 0.03);
  static const Color surface2 = Color.fromRGBO(255, 255, 255, 0.06);
  static const Color border = Color.fromRGBO(255, 255, 255, 0.08);
  static const Color border2 = Color.fromRGBO(0, 212, 255, 0.2);
  static const Color cyan = Color(0xFF00d4ff);
  static const Color blue = Color(0xFF4f8ef7);
  static const Color purple = Color(0xFF8b5cf6);
  static const Color green = Color(0xFF00ffa3);
  static const Color textColor = Color(0xFFe8eaf6);
  static const Color muted = Color(0xFF6b7aaa);

  // ── Cached TextStyles (avoids repeated GoogleFonts network lookups) ──

  // Syne variants
  static final TextStyle syne80w800 = GoogleFonts.syne(
    fontSize: 80, fontWeight: FontWeight.w800, color: textColor, height: 0.95,
  );
  static final TextStyle syne48w800 = GoogleFonts.syne(
    fontSize: 48, fontWeight: FontWeight.w800, color: textColor, height: 1.05,
  );
  static final TextStyle syne36w800 = GoogleFonts.syne(
    fontSize: 36, fontWeight: FontWeight.w800, color: textColor,
  );
  static final TextStyle syne20w700 = GoogleFonts.syne(
    fontSize: 20, fontWeight: FontWeight.w700, color: textColor,
  );
  static final TextStyle syne48w800bg = GoogleFonts.syne(
    fontSize: 48, fontWeight: FontWeight.w800, color: bg,
  );
  static final TextStyle syne36w800contact = GoogleFonts.syne(
    fontSize: 36, fontWeight: FontWeight.w800, color: textColor,
  );

  // RobotoMono variants
  static final TextStyle mono14cyan = GoogleFonts.robotoMono(
    fontSize: 14, fontWeight: FontWeight.w500, color: cyan, letterSpacing: 0.1,
  );
  static final TextStyle mono12muted = GoogleFonts.robotoMono(
    fontSize: 12, fontWeight: FontWeight.w400, color: muted, letterSpacing: 0.12,
  );
  static final TextStyle mono12cyan = GoogleFonts.robotoMono(
    fontSize: 12, fontWeight: FontWeight.w500, color: cyan, letterSpacing: 0.1,
  );
  static final TextStyle mono11cyan = GoogleFonts.robotoMono(
    fontSize: 11, color: cyan, letterSpacing: 0.2,
  );
  static final TextStyle mono11muted = GoogleFonts.robotoMono(
    fontSize: 11, color: muted, letterSpacing: 0.12,
  );
  static final TextStyle mono11mutedSm = GoogleFonts.robotoMono(
    fontSize: 11, color: muted, letterSpacing: 0.05,
  );
  static final TextStyle mono10cyan = GoogleFonts.robotoMono(
    fontSize: 10, color: cyan, letterSpacing: 0.05,
  );
  static final TextStyle mono10muted = GoogleFonts.robotoMono(
    fontSize: 10, color: muted,
  );
  static final TextStyle mono13w500 = GoogleFonts.robotoMono(
    fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.08,
  );
  static final TextStyle mono13cyan = GoogleFonts.robotoMono(
    fontSize: 13, fontWeight: FontWeight.w500, color: cyan, letterSpacing: 0.1,
  );
  static final TextStyle mono12mutedPlain = GoogleFonts.robotoMono(
    fontSize: 12, color: muted,
  );
  static final TextStyle mono12w500text = GoogleFonts.robotoMono(
    fontSize: 12, fontWeight: FontWeight.w500, color: textColor,
  );
  static final TextStyle mono13cyanLink = GoogleFonts.robotoMono(
    fontSize: 13, color: cyan, fontWeight: FontWeight.w500,
  );
  static final TextStyle mono11cyanLink = GoogleFonts.robotoMono(
    fontSize: 11, color: cyan, letterSpacing: 0.08,
  );
  static final TextStyle mono11mutedLink = GoogleFonts.robotoMono(
    fontSize: 11, color: muted, letterSpacing: 0.08,
  );
  static final TextStyle mono12mutedLink = GoogleFonts.robotoMono(
    fontSize: 12, color: muted, letterSpacing: 0.08,
  );
  static final TextStyle mono10cyanTag = GoogleFonts.robotoMono(
    fontSize: 10, color: cyan, letterSpacing: 0.1,
  );

  // InstrumentSans variants
  static final TextStyle sans16muted = GoogleFonts.instrumentSans(
    fontSize: 16, color: muted, height: 1.7,
  );
  static final TextStyle sans15muted = GoogleFonts.instrumentSans(
    fontSize: 15, color: muted, height: 1.85,
  );
  static final TextStyle sans15textBold = GoogleFonts.instrumentSans(
    fontSize: 15, color: textColor, fontWeight: FontWeight.w600,
  );
  static final TextStyle sans14muted = GoogleFonts.instrumentSans(
    fontSize: 14, color: muted,
  );
  static final TextStyle sans14mutedTall = GoogleFonts.instrumentSans(
    fontSize: 14, color: muted, height: 1.7,
  );
  static final TextStyle sans14mutedTaller = GoogleFonts.instrumentSans(
    fontSize: 14, color: muted, height: 1.75,
  );
  static final TextStyle sans14textColor = GoogleFonts.instrumentSans(
    fontSize: 14, color: textColor,
  );
  static final TextStyle sans13muted = GoogleFonts.instrumentSans(
    fontSize: 13, color: muted, height: 1.6,
  );

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: bg,
      primaryColor: cyan,
      canvasColor: bg,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.syne(
          fontSize: 64,
          fontWeight: FontWeight.w800,
          color: textColor,
          letterSpacing: -0.02,
        ),
        displayMedium: GoogleFonts.syne(
          fontSize: 42,
          fontWeight: FontWeight.w800,
          color: textColor,
        ),
        headlineLarge: GoogleFonts.syne(
          fontSize: 36,
          fontWeight: FontWeight.w800,
          color: textColor,
        ),
        headlineMedium: GoogleFonts.syne(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: textColor,
        ),
        bodyMedium: GoogleFonts.instrumentSans(
          fontSize: 15,
          color: muted,
          height: 1.85,
        ),
        bodySmall: GoogleFonts.robotoMono(
          fontSize: 12,
          color: muted,
          letterSpacing: 0.12,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: cyan,
      ),
    );
  }

  // Gradient definitions
  static const LinearGradient cyanPurpleGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [cyan, blue, purple],
  );

  static const LinearGradient heroBgGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF4f8ef7), Color(0xFF8b5cf6)],
  );

  // ── Responsive Helpers ──

  static double getHorizontalPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width > 1200) return 48;
    if (width > 900) return 40;
    if (width > 600) return 32;
    if (width > 400) return 24;
    return 16; // Even smaller for narrow phones
  }

  static int getGridCrossAxisCount(BuildContext context, {int desktop = 3, int tablet = 2, int mobile = 1}) {
    final width = MediaQuery.of(context).size.width;
    if (width > 900) return desktop;
    if (width > 600) return tablet;
    return mobile;
  }

  static double getVerticalPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width > 900) return 120;
    if (width > 600) return 100;
    return 80;
  }

  static double getResponsiveFontSize(BuildContext context, {required double baseSize, double minFactor = 0.6}) {
    final width = MediaQuery.of(context).size.width;
    if (width > 1200) return baseSize;
    if (width > 900) return baseSize * 0.9;
    if (width > 600) return baseSize * 0.8;
    return (baseSize * 0.7).clamp(baseSize * minFactor, baseSize);
  }
}
