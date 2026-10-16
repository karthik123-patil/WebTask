import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DiscoverMoreExploreSection extends StatefulWidget {
  const DiscoverMoreExploreSection({super.key});

  @override
  State<DiscoverMoreExploreSection> createState() =>
      _DiscoverMoreExploreSectionState();
}

class _DiscoverMoreExploreSectionState
    extends State<DiscoverMoreExploreSection> {
  // Track hovered card key
  String? hoveredCard;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Exact Figma light background
      body: Padding(
        padding: const EdgeInsets.only(left: 150,top: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              'Discover more: Explore',
              style: GoogleFonts.manrope(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF111827),
              ),
            ),
            const SizedBox(height: 40),

            // Top Row (2 Split Cards Side-by-Side)
            Row(
              children: [
                Expanded(
                  child: _buildSplitCard(
                    cardKey: 'careers',
                    tag: 'CAREERS',
                    title: 'Join our team',
                    description:
                    'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo. Non aliquid explicabo',
                    actionText: 'EXPLORE CAREERS',
                    imageUrl: 'assets/images/img_9.png',
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: _buildSplitCard(
                    cardKey: 'partners',
                    tag: 'PARTNERS',
                    title: 'Collaborate for growth:',
                    description:
                    'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo. Non aliquid explicabo',
                    actionText: 'BECOME A PARTNER',
                    imageUrl: 'assets/images/img_10.png',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Bottom Full-Width Split Card
            _buildSplitCard(
              cardKey: 'resources',
              tag: 'RESOURCES',
              title: 'Beyond the firewall: Resources from Obbian',
              description:
              'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo. Non aliquid explicabo',
              actionText: 'ACCESS RESOURCES',
              imageUrl: 'assets/images/img_11.png',
              isFullWidth: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSplitCard({
    required String cardKey,
    required String tag,
    required String title,
    required String description,
    required String actionText,
    required String imageUrl,
    bool isFullWidth = false,
  }) {
    final bool isHovered = hoveredCard == cardKey;

    return Container(
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          // Left Half: Image (Independent container)
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              width: isFullWidth ? 380 : 220,
              height: double.infinity,
              child: Image.asset(imageUrl, fit: BoxFit.cover),
            ),
          ),

          const SizedBox(width: 16),

          // Right Half: Text & Action Link Container wrapped with MouseRegion
          Expanded(
            child: MouseRegion(
              onEnter: (_) => setState(() => hoveredCard = cardKey),
              onExit: (_) => setState(() => hoveredCard = null),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: const Color(0xFFF1F5F9),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 20.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Tag
                        Text(
                          tag,
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF64748B),
                            letterSpacing: 1.1,
                          ),
                        ),
                        const SizedBox(height: 6),

                        // Title
                        Text(
                          title,
                          style: GoogleFonts.manrope(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF0F172A),
                            height: 1.2,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),

                        // Description
                        Text(
                          description,
                          style: GoogleFonts.inter(
                            fontSize: 12.5,
                            color: const Color(0xFF475569),
                            height: 1.4,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 16),

                        // Action Button Link with Animated Underline & Arrow
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  actionText,
                                  style: GoogleFonts.manrope(
                                    fontSize: 12.5,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF1E6BFF),
                                  ),
                                ),
                                const SizedBox(height: 2),
                                // Underline line expanding on text section hover
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  height: 1.5,
                                  width: isHovered ? 120.0 : 0.0, // Smoothly reveals line width on hover
                                  color: const Color(0xFF1E6BFF),
                                ),
                              ],
                            ),
                            const SizedBox(width: 6),
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 200),
                              child: isHovered
                                  ? const Icon(
                                Icons.arrow_outward,
                                // ↗ when text section is hovered[cite: 4, 5]
                                key: ValueKey('arrow_outward'),
                                color: Color(0xFF1E6BFF),
                                size: 16,
                              )
                                  : const Icon(
                                Icons.arrow_forward, // → normal state[cite: 4, 5]
                                key: ValueKey('arrow_forward'),
                                color: Color(0xFF1E6BFF),
                                size: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}