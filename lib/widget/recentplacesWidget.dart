import 'package:flutter/material.dart';
import '../config/colorConstant.dart' show RideColors;
import '../config/textStyles.dart';

class RecentPlaces extends StatelessWidget {
  const RecentPlaces({super.key});

  @override
  Widget build(BuildContext context) {
    const places = [
      (
        'Junwani Rd',
        'near Apollo Hospital, Smriti Nagar, Surya Vi...',
        '4.3 km',
      ),
      ('Bus Stand', 'Civil Lines, Durg, Chhattisgarh 491001, India', '1.3 km'),
      ('Santpali cg', 'Camp 2, Bhanwarpur, Chhattisgarh 493555...', '9 km'),
    ];

    return Column(
      children: [
        for (var i = 0; i < places.length; i++) ...[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Icon and distance column
              SizedBox(
                width: 48,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.history,
                      color: RideColors.muted,
                      size: 22,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      places[i].$3,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.textContent,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              // Title and Subtitle Column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(places[i].$1, style: AppTextStyles.textLable),
                    const SizedBox(height: 4),
                    Text(
                      places[i].$2,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.textContent,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              // Favorite Icon Button
              IconButton(
                visualDensity: VisualDensity.compact,
                icon: const Icon(
                  Icons.favorite_border,
                  color: RideColors.muted,
                  size: 26,
                ),
                onPressed: () {},
              ),
            ],
          ),

          // Custom Dotted Line between items
          Padding(
            padding: const EdgeInsets.only(left: 48, top: 8, bottom: 8),
            child: CustomPaint(
              size: const Size(double.infinity, 1),
              painter: DottedLinePainter(),
            ),
          ),
        ],
      ],
    );
  }
}

// Custom Painter to draw a clean dashed/dotted line
class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 5.0;
    double dashSpace = 4.0;
    double startX = 0;
    final paint = Paint()
      ..color = const Color(0xFFD0D4DC)
      ..strokeWidth = 1.0;

    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
