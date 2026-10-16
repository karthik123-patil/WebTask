import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/textStyles.dart';

class SecondScreen1 extends StatelessWidget {
  const SecondScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 900;

    return Scaffold(
      body: Stack(
        children: [
          // 1. Background Particle / Fiber-Optic Image Effect
          Positioned.fill(
            child: Opacity(
              opacity: 0.6,
              child: Image.asset(
                'assets/images/secbg.png',
                // Replace with your exact asset image
                fit: BoxFit.cover,
              ),
            ),
          ),

          // HERO CONTENT
          Positioned(
            left: 150,
            top: 16,
            child: SizedBox(
              width: isDesktop ? 540 : double.infinity,
              child: Text(
                'Heading : Illo sint voluptas. Error voluptates culpa',
                style: GoogleFonts.manrope(
                  fontSize: 36.0,
                  fontWeight: FontWeight.w600,
                  // SemiBold
                  fontStyle: FontStyle.normal,
                  height: 48.0 / 36.0,
                  // line-height: 48px (Flutter height is a multiplier of fontSize, ~1.333)
                  letterSpacing: 0.0, // letter-spacing: 0%
                ),
              ),
            ),
          ),

          Positioned(
            right: 0,
            bottom: 0,
            child: Row(
              children: [Image.asset("assets/images/viron.png", scale: 4)],
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Row(
              children: [Image.asset("assets/images/abcapp.png", scale: 4)],
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Row(
              children: [Image.asset("assets/images/xyz.png", scale: 4)],
            ),
          ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1100;

    return Scaffold(
      body: Stack(
        children: [
          // 1. Background Particle / Fiber-Optic Image Effect
          Positioned.fill(
            child: Opacity(
              opacity: 0.6,
              child: Image.asset('assets/images/secbg.png', fit: BoxFit.cover),
            ),
          ),
          Positioned.fill(
            bottom: 0,
            child: Opacity(
              opacity: 0.6,
              child: Image.asset(
                'assets/images/secondScreen/img.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 16,
            left: 150,
            child: SizedBox(
              width: isDesktop ? 540 : double.infinity,
              child: Text(
                'Heading : Illo sint voluptas. Error voluptates culpa',
                style: GoogleFonts.manrope(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  height: 40.0 / 32.0,
                  letterSpacing: 0.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 150,
            right: 150,
            child: Container(
              child: Row(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Card 1
                  Container(
                    padding: const EdgeInsets.only(top: 10.0),
                    // FIX: This pushes the ABC Apps card down by 80px
                    child: Center(
                      child: Image.asset(
                        "assets/images/viron.png",
                        height: 380, // Mantains same height constraint
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  // SizedBox(width: 40),
                  // Card 2: Slight vertical offset down
                  Container(
                    padding: const EdgeInsets.only(top: 150.0),
                    // FIX: This pushes the ABC Apps card down by 80px
                    child: Center(
                      child: Image.asset(
                        "assets/images/abcapp.png",
                        height: 380, // Mantains same height constraint
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 0.0),
                    // FIX: This pushes the ABC Apps card down by 80px
                    child: Center(
                      child: Image.asset(
                        "assets/images/xyz.png",
                        height: 380, // Mantains same height constraint
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
