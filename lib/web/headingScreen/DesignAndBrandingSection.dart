import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DesignAndBrandingSection extends StatefulWidget {
  const DesignAndBrandingSection({super.key});

  @override
  State<DesignAndBrandingSection> createState() =>
      _DesignAndBrandingSectionState();
}

class _DesignAndBrandingSectionState extends State<DesignAndBrandingSection> {
  // Track hovered card in Section 1 (Defaults to 'UI/UX Design' as shown in design)
  String? hoveredDesignCard = 'UI/UX Design';

  // Track hovered card in Section 2 (Defaults to 'Python' as shown in design)
  String? hoveredDevCard = 'Python';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1100;

    return Scaffold(
      // Deep dark theme background
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.6,
              child: Image.asset(
                'assets/images/branding.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 120.0 : 30.0,
              vertical: 80.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ==========================================
                // SECTION 1: Design & Branding
                // ==========================================
                Text(
                  'Design & Branding',
                  style: GoogleFonts.manrope(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: 700,
                  child: Text(
                    'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo. Non aliquid explicabo necessitatibus unde. Sed exercitationem placeat consectetur nulla deserunt vel. Iusto corrupti dicta.',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.7),
                      height: 1.5,
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                // 3 Cards Row for Design & Branding
                Wrap(
                  spacing: 30,
                  runSpacing: 30,
                  children: [
                    _buildDesignHoverCard(
                      title: 'UI/UX Design',
                      description:
                          'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo. Non aliquid explicabo necessitatibus unde. Sed exercitationem placeat consectetur nulla deserunt vel. Iusto corrupti dicta.',
                      cardKey: 'UI/UX Design',
                      icon: Icons.local_fire_department,
                    ),
                    _buildDesignHoverCard(
                      title: 'Visual Branding',
                      description:
                          'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo. Non aliquid explicabo necessitatibus unde. Sed exercitationem placeat consectetur nulla deserunt vel. Iusto corrupti dicta.',
                      cardKey: 'Visual Branding',
                      icon: Icons.palette_outlined,
                    ),
                    _buildDesignHoverCard(
                      title: 'Brand Materials',
                      description:
                          'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo. Non aliquid explicabo necessitatibus unde. Sed exercitationem placeat consectetur nulla deserunt vel. Iusto corrupti dicta.',
                      cardKey: 'Brand Materials',
                      icon: Icons.layers_outlined,
                    ),
                  ],
                ),

                const SizedBox(height: 200),

                // ==========================================
                // SECTION 2: Advanced Development Stack
                // ==========================================
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Left Text Information
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Advanced Development\nStack',
                            style: GoogleFonts.manrope(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo. Non aliquid explicabo necessitatibus unde. Sed exercitationem placeat consectetur nulla deserunt vel. Iusto corrupti dicta.',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: Colors.white.withOpacity(0.7),
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Text(
                            'Web Development',
                            style: GoogleFonts.manrope(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo. Non aliquid explicabo necessitatibus unde. Sed exercitationem placeat consectetur nulla deserunt vel. Iusto corrupti dicta.',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: Colors.white.withOpacity(0.6),
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Mobile App Development',
                            style: GoogleFonts.manrope(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo. Non aliquid explicabo necessitatibus unde. Sed exercitationem placeat consectetur nulla deserunt vel. Iusto corrupti dicta.',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: Colors.white.withOpacity(0.6),
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(height: 30),
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
                              'LEARN MORE',
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

                    const SizedBox(width: 50),

                    // Right Tech Stack Grid (3x2)
                    Expanded(
                      flex: 1,
                      child: Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: [
                          _buildDevStackCard(
                            'Figma',
                            'DESIGN',
                            'assets/images/brand/figma.jpeg',
                          ),
                          _buildDevStackCard(
                            'Python',
                            'LOGIC',
                            'assets/images/brand/python.jpeg',
                          ),
                          _buildDevStackCard(
                            'Node.js',
                            'BACKEND',
                            'assets/images/brand/node.jpeg',
                          ),
                          _buildDevStackCard(
                            'React',
                            'FRONTEND',
                            'assets/images/brand/react.jpeg',
                          ),
                          _buildDevStackCard(
                            'Flutter',
                            'CROSS-PLATFORM',
                            'assets/images/brand/flutter.jpeg',
                          ),
                          _buildDevStackCard(
                            'Dart',
                            'LANGUAGE',
                            'assets/images/brand/dart.jpeg',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget for Section 1: Design & Branding Cards (Turns Blue on Hover)
  Widget _buildDesignHoverCard({
    required String title,
    required String description,
    required String cardKey,
    required IconData icon,
  }) {
    final bool isHovered = hoveredDesignCard == cardKey;

    return MouseRegion(
      onEnter: (_) => setState(() => hoveredDesignCard = cardKey),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 350,
        height: 340,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: isHovered ? const Color(0xFF1E6BFF) : Colors.white,
          // Blue when hovered, White otherwise
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: isHovered
                  ? Colors.blue.withOpacity(0.3)
                  : Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Top Row: Title + Icon
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (isHovered) Icon(icon, color: Colors.white, size: 28),
              ],
            ),

            // Description text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.manrope(
                    fontSize: 36,
                    height: 1.48,
                    fontWeight: FontWeight.w600,
                    color: isHovered ? Colors.white : const Color(0xFF000000),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  description,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: isHovered
                        ? Color(0xFFFFFFFF)
                        : const Color(0xFF4B5563),
                    height: 1.26,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget for Section 2: Advanced Development Stack Cards (Glows & Highlights on Hover)
  Widget _buildDevStackCard(String name, String category, String image) {
    final bool isHovered = hoveredDevCard == name;

    return MouseRegion(
      onEnter: (_) => setState(() => hoveredDevCard = name),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 140,
        height: 140,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF0D121F),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isHovered ? Colors.white : Colors.white.withOpacity(0.1),
            width: isHovered ? 1.5 : 1.0,
          ),
          boxShadow: [
            if (isHovered)
              BoxShadow(
                color: Colors.white.withOpacity(0.15),
                blurRadius: 15,
                spreadRadius: 2,
              ),
          ],
        ),
        child: isHovered
            ? Image.asset(image)
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    category,
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.4),
                      letterSpacing: 1.0,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    name,
                    style: GoogleFonts.manrope(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
      ),
    );
  }
}
