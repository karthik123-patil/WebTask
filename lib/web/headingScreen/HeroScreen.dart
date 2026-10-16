import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/textStyles.dart';

class HeroScreen extends StatelessWidget {
  const HeroScreen({super.key});

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
              child: Image.network(
                'https://images.unsplash.com/photo-1544197150-b99a580bb7a8?q=80&w=2000&auto=format&fit=crop',
                // Replace with your exact asset image
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Gradient overlay to fade background seamlessly into pure dark left/bottom
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF03050A),
                    // Solid dark on the left for text readability
                    Colors.transparent,
                    Color(0xFF03050A),
                  ],
                  stops: [0.35, 0.7, 1.0],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
          ),

          // Top Gradient overlay for Header separation
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                ),
              ),
            ),
          ),

          // 2. Top-Right Decorative Dot Grid Pattern
          Positioned(
            top: 100,
            right: 40,
            child: _buildDotGrid(rows: 8, cols: 14),
          ),

          // 3. Main Screen Layout (Header + Hero Body)
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // NAVBAR / HEADER
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 20.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Brand Logo
                      Text(
                        'TC Teach Company',
                        style: AppTextStyles.tcTeachComp,
                      ),

                      // Right Navigation Items
                      if (isDesktop)
                        Row(
                          children: [
                            _navLink('Products'),
                            _navLink('Solutions'),
                            _navLink('Partnerships'),
                            _navLink('Company'),
                            const SizedBox(width: 20),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1E6BFF),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 14,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                elevation: 0,
                              ),
                              onPressed: () {},
                              child: const Text(
                                'Contact Us',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        )
                      else
                        IconButton(
                          icon: const Icon(Icons.menu, color: Colors.white),
                          onPressed: () {},
                        ),
                    ],
                  ),
                ),

                const Spacer(),
                const Spacer(),
              ],
            ),
          ),

          // HERO CONTENT
          Positioned(
            left: 150,
            top: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Heading Title
                Text(
                  'Heading :',
                  style: TextStyle(
                    fontSize: isDesktop ? 64 : 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: -1.0,
                  ),
                ),
                const SizedBox(height: 20),

                // Paragraph Description
                SizedBox(
                  width: isDesktop ? 540 : double.infinity,
                  child: Text(
                    'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo. '
                    'Non aliquid explicabo necessitatibus unde. Sed exercitationem placeat consectetur '
                    'nulla deserunt vel. Iusto corrupti dicta.',
                    style: GoogleFonts.inter(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                      // Regular weight
                      fontStyle: FontStyle.normal,
                      height: 26.0 / 18.0,
                      // line-height: 26px (Flutter height is a multiplier of fontSize, ~1.444)
                      letterSpacing: 0.0,
                      // letter-spacing: 0%
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            right: 0,
            bottom: 0,
            child: Row(
              children: [
                Image.asset("assets/images/roboticon.png",scale: 4,),
                Image.asset("assets/images/arrowupicon.png",scale: 4,),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _navLink(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: InkWell(
        onTap: () {},
        hoverColor: Colors.transparent,
        child: Text(title, style: AppTextStyles.webIconHeaderText),
      ),
    );
  }

  Widget _buildDotGrid({required int rows, required int cols}) {
    return Column(
      children: List.generate(
        rows,
        (r) => Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Row(
            children: List.generate(
              cols,
              (c) => Container(
                margin: const EdgeInsets.only(right: 5.0),
                width: 2.0,
                height: 2.0,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
