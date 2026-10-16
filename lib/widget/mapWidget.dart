import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../config/colorConstant.dart';

class MapHeader extends StatelessWidget {
  final VoidCallback? onPickUpTap;
  final VoidCallback? onWhereToTap;
  final VoidCallback? onRecenterTap;

  const MapHeader({
    super.key,
    this.onPickUpTap,
    this.onWhereToTap,
    this.onRecenterTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final horizontalMargin = screenWidth > 700 ? (screenWidth - 660) / 2 : 20.0;

    return Stack(
      fit: StackFit.expand,
      children: [
        // 1. Map Background Painter
        Image.asset(
          'assets/images/map.png',
          // Apni map background image ka path yahan dein
          fit: BoxFit.cover,
        ),

        // 2. Top "Current Location" Glass Card
        Positioned(
          top: MediaQuery.paddingOf(context).top + 16,
          left: horizontalMargin,
          right: horizontalMargin,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(22),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.5),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Current location',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          // Agar font register nahi hai toh default dikhega
                          fontWeight: FontWeight.w400,
                          // Weight 400 (Regular)
                          fontSize: 12.0,
                          // Size 12px
                          height: 1.0,
                          // Line height 100%
                          color: Color(0xFF1C1D1F),
                          // Figma Text Color
                          letterSpacing: 0.0,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            color: RideColors.navy,
                            size: 26,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'New City',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              // Agar font register nahi hai toh default dikhega
                              fontWeight: FontWeight.w700,
                              // Weight 400 (Regular)
                              fontSize: 14.0,
                              // Size 12px
                              height: 1.0,
                              // Line height 100%
                              color: Color(0xFF1C1D1F),
                              // Figma Text Color
                              letterSpacing: 0.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200.withValues(alpha: 0.5),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 22,
                    color: Color(0xFF424750),
                  ),
                ),
              ],
            ),
          ),
        ),

        // 4. Bottom Search Fields Container (Glass Box)
        Positioned(
          left: horizontalMargin,
          right: horizontalMargin,
          bottom: 60,
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(32),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.2),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.12),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              children: [
                SearchField(
                  icon: Icons.circle_outlined,
                  hint: 'Pick Up (Default on map)',
                  onTap: onPickUpTap,
                ),
                const SizedBox(height: 12),
                SearchField(
                  icon: Icons.circle_outlined,
                  hint: 'Where to?',
                  onTap: onWhereToTap,
                ),
              ],
            ),
          ),
        ),

        // 5. Recenter Navigation Button (Bottom Right)
        Positioned(
          right: 20,
          bottom: 12, // Search container ke upar float karega
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: onRecenterTap,
              child: Center(
                child: SizedBox(
                  width: 14,
                  // Yahan se aap icon ka size apne mutabiq chota ya bada kar sakte hain
                  height: 14,
                  child: Image.asset(
                    'assets/images/sharemap.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Individual Search Box Widget inside the Glass Container
class SearchField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final VoidCallback? onTap;

  const SearchField({
    super.key,
    required this.icon,
    required this.hint,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(26),
      child: InkWell(
        borderRadius: BorderRadius.circular(26),
        onTap: onTap,
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            children: [
              Icon(icon, size: 16, color: const Color(0xFFBFC3C8)),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  hint,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF8C939E),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
