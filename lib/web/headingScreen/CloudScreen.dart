import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CloudScreen extends StatelessWidget {
  const CloudScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1100;

    return Scaffold(
      body: Stack(
        children: [
          // 1. Background Particle / Fiber-Optic Image Effect
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(left: 150, top: 100),
              width: MediaQuery.of(context).size.width * 0.5,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Heading: Illo sint voluptas. Error voluptates culpa eligendi.',
                    style: GoogleFonts.manrope(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                      height: 1.48,
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(height: 30),
                  Image.asset('assets/images/img_5.png', scale: 3),
                  SizedBox(height: 30),
                  SizedBox(
                    width: 700,
                    child: Text(
                      'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo. Non aliquid explicabo necessitatibus unde. Sed exercitationem placeat consectetur nulla deserunt vel. Iusto corrupti dicta.',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Color(0xFF6B7280),
                        height: 1.5,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E6BFF),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {},
                    child: Text(
                      'EXPLORE',
                      style: GoogleFonts.manrope(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            bottom: 0,
            width: MediaQuery.of(context).size.width * 0.5,
            child: Opacity(
              opacity: 0.6,
              child: Image.asset('assets/images/aws.png', fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}
