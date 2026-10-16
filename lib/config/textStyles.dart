import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  // Current Location label ke liye custom style
  static const TextStyle currentLocationLabel = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    fontSize: 12.0,
    height: 1.0,
    color: Color(0xFF1C1D1F),
    letterSpacing: 0.0,
  );

  // New City title ke liye custom style
  static const TextStyle cityName = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w800,
    fontSize: 18.0,
    color: Color(0xFF1C1D1F),
  );

  static const TextStyle textLable = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    fontSize: 12.0,
    height: 1.0,
    color: Color(0xFF1C1D1F),
    letterSpacing: 0.0,
  );

  static const TextStyle boldTextLable = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    fontSize: 18.0,
    height: 1.28,
    color: Color(0xFF1F2937),
    letterSpacing: 0.0,
  );

  static const TextStyle semiBoldTextLable = TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w800,
    fontSize: 14.0,
    height: 1.2,
    color: Color(0xFF1F2937),
    letterSpacing: 0.0,
  );

  static const TextStyle textContent = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    fontSize: 10.0,
    height: 1.0,
    color: Color(0xFF8A8E96),
    letterSpacing: 0.0,
  );

  static const TextStyle newTextContent = TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w900,
    // weight 900 (Black / Heavy)
    fontSize: 10.0,
    // font-size 10px
    height: 1.5,
    // line-height 15px (15 / 10 = 1.5)
    letterSpacing: 0.0, // letter-spacing 0px
  );

  static const TextStyle text1Lable = TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w700,
    // weight 900 (Black / Heavy)
    fontSize: 10.0,
    // font-size 10px
    height: 1.5,
    // line-height 15px (15 / 10 = 1.5)
    letterSpacing: 0.0,
    color: Color(0xFF6B7280), // letter-spacing 0px
  );

  static final TextStyle tcTeachComp = GoogleFonts.orbitron(
    fontSize: 24.0,
    fontWeight: FontWeight.w400,
    // Regular weight
    fontStyle: FontStyle.normal,
    height: 1.0,
    // line-height: 100%
    letterSpacing: 24.0 * 0.10, // letter-spacing: 10% (10% of 24px = 2.4px)
  );

  static final TextStyle webIconHeaderText = GoogleFonts.inter(
    fontSize: 14.0,
    color: const Color(0xFF94A3B8),
    fontWeight: FontWeight.w600,
    // Semi Bold
    fontStyle: FontStyle.normal,
    height: 24.0 / 14.0,
    // line-height: 24px (Flutter height is a multiplier of fontSize)
    letterSpacing: 0.0, // letter-spacing: 0%
  );

  static final TextStyle figmaManropeStyle = GoogleFonts.manrope(
    fontSize: 12.0,
    fontWeight: FontWeight.w500, // Medium
    fontStyle: FontStyle.normal,
    height: 16.0 / 12.0,       // line-height: 16px (Flutter height is a multiplier of fontSize)
    letterSpacing: -0.1,       // letter-spacing: -0.1px
  );
}
