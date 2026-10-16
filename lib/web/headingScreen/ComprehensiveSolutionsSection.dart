import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ComprehensiveSolutionsSection extends StatefulWidget {
  const ComprehensiveSolutionsSection({super.key});

  @override
  State<ComprehensiveSolutionsSection> createState() => _ComprehensiveSolutionsSectionState();
}

class _ComprehensiveSolutionsSectionState extends State<ComprehensiveSolutionsSection> {
  // Track hovered card (Defaults to 'Cloud Services' as the active selection)
  String? hoveredCard = 'Cloud Services';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1200;

    return Scaffold(
      backgroundColor: const Color(0xFF0A0E10), // Exact background color from Figma
      body: Stack(
        children: [
          // 1. Background Network / Hand Graphic Overlay on the Right side
          Positioned(
            right: 0,
            bottom: 0,
            top: 0,
            child: Opacity(
              opacity: 0.45,
              child: Image.asset(
                'assets/images/img_6.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Gradient blend to merge background graphic smoothly into solid dark
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF0A0E10),
                    const Color(0xFF0A0E10).withOpacity(0.8),
                    Colors.transparent,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
          ),

          // 2. Main Scrollable Content
          Positioned(
            left: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100),
                // Section Title & Description
                Text(
                  'Our comprehensive solutions',
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
                    textAlign: TextAlign.start,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.6),
                      height: 1.5,
                    ),
                  ),
                ),
                const SizedBox(height: 60),

                // Grid of 6 Cards (3 columns layout matching Figma)
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1200),
                    child: Wrap(
                      spacing: 30,
                      runSpacing: 30,
                      alignment: WrapAlignment.center,
                      children: [
                        // Card 1: Data Engineering
                        _buildSolutionCard(
                          title: 'Data\nEngineering',
                          icon: Icons.local_fire_department,
                          description: 'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo. Non aliquid explicabo necessitatibus unde. Sed exercitationem placeat consectetur nulla deserunt vel. Iusto corrupti dicta.',
                          bulletPoints: ['ETL & ELT Pipelines', 'Data Warehousing', 'Database Design'],
                          cardKey: 'Data Engineering',
                        ),

                        // Card 2: Cloud Services
                        _buildSolutionCard(
                          title: 'Cloud\nServices',
                          icon: Icons.rocket_launch,
                          description: 'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo. Non aliquid explicabo necessitatibus unde. Sed exercitationem placeat consectetur nulla deserunt vel. Iusto corrupti dicta.',
                          bulletPoints: ['Microsoft Azure Architecture', 'Amazon Server Management', 'Operational Resilience'],
                          cardKey: 'Cloud Services',
                        ),

                        // Card 3: Intelligence & BI
                        _buildSolutionCard(
                          title: 'Intelligence &\nBI',
                          icon: Icons.hub,
                          description: 'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo. Non aliquid explicabo necessitatibus unde. Sed exercitationem placeat consectetur nulla deserunt vel. Iusto corrupti dicta.',
                          bulletPoints: ['Power BI Reporting', 'Data Analytics', 'Predictive Modeling'],
                          cardKey: 'Intelligence & BI',
                        ),

                        // Card 4: Social Media
                        _buildSolutionCard(
                          title: 'Social\nMedia',
                          icon: Icons.camera_alt_outlined,
                          description: 'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo. Non aliquid explicabo necessitatibus unde. Sed exercitationem placeat consectetur nulla deserunt vel. Iusto corrupti dicta.',
                          bulletPoints: ['Digital Flyer Design', 'Social Assets & Campaign Visuals', 'Strategic Advisory'],
                          cardKey: 'Social Media',
                        ),

                        // Card 5: Digital Marketing
                        _buildSolutionCard(
                          title: 'Digital\nMarketing',
                          icon: Icons.edit_outlined,
                          description: 'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo. Non aliquid explicabo necessitatibus unde. Sed exercitationem placeat consectetur nulla deserunt vel. Iusto corrupti dicta.',
                          bulletPoints: [
                            'Custom eCommerce Development',
                            'Mobile Commerce',
                            'Platform Migration',
                            'Marketplace Development',
                            'Payment Integration',
                            'Third-Party Integration',
                          ],
                          cardKey: 'Digital Marketing',
                        ),

                        // Card 6: Explore All (Special Action Card)
                        _buildExploreAllCard(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Standard Solution Card with Hover-to-Blue State & Explore Button
  Widget _buildSolutionCard({
    required String title,
    required IconData icon,
    required String description,
    required List<String> bulletPoints,
    required String cardKey,
  }) {
    final bool isHovered = hoveredCard == cardKey;

    return MouseRegion(
      onEnter: (_) => setState(() => hoveredCard = cardKey),
      onExit: (_) => setState(() => hoveredCard = null),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 360,
        height: 520,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: isHovered ? const Color(0xFF1E6BFF) : const Color(0xFF161A23),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isHovered ? Colors.blueAccent : Colors.white.withOpacity(0.08),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: isHovered ? Colors.blue.withOpacity(0.3) : Colors.black.withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.manrope(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.1,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: Colors.white, size: 22),
                ),
              ],
            ),
            Text(
              description,
              style: GoogleFonts.inter(
                fontSize: 12.5,
                color: Colors.white.withOpacity(0.85),
                height: 1.5,
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: bulletPoints
                  .map(
                    (point) => Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: Row(
                    children: [
                      Container(
                        width: 5,
                        height: 5,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          point,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: Colors.white.withOpacity(0.9),
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              )
                  .toList(),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: isHovered ? 1.0 : 0.0,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF1E6BFF),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'EXPLORE',
                        style: GoogleFonts.manrope(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Icon(Icons.arrow_outward, size: 16),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 6th Card: "Explore All" Action Card as seen in Figma
  Widget _buildExploreAllCard() {
    return Container(
      width: 360,
      height: 520,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFF11151F).withOpacity(0.6),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white.withOpacity(0.05),
          width: 1.5,
        ),
      ),
      child: Center(
        child: InkWell(
          onTap: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Explore All',
                style: GoogleFonts.manrope(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF3B82F6),
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.arrow_forward, color: Color(0xFF3B82F6), size: 18),
            ],
          ),
        ),
      ),
    );
  }
}