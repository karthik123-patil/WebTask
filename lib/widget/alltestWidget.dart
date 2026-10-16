import 'package:flutter/material.dart';

import '../config/colorConstant.dart';
import '../config/textStyles.dart';
import '../main.dart';
import 'dart:math' as math;

void _showMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message), duration: const Duration(seconds: 1)),
  );
}

class NeighborhoodCards extends StatelessWidget {
  const NeighborhoodCards({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 285,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          NeighborhoodCard(
            title: 'Scale your Business\nwith us',
            imageUrl: 'assets/images/img_1.png',
            onTap: () => _showMessage(context, 'Business story tapped'),
          ),
          const SizedBox(width: 16),
          NeighborhoodCard(
            title: 'Connecting and\ngrowing',
            imageUrl: 'assets/images/img_2.png',
            onTap: () => _showMessage(context, 'Community story tapped'),
          ),
        ],
      ),
    );
  }
}

class NeighborhoodCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final VoidCallback onTap;

  const NeighborhoodCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 265,
      child: Material(
        borderRadius: BorderRadius.circular(20),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ColorFiltered(
                colorFilter: const ColorFilter.mode(
                  Colors.transparent,
                  BlendMode.darken,
                ),
                child: Image.asset(imageUrl, fit: BoxFit.fill),
              ),
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Color(0xCC000000)],
                    stops: [0.25, 1],
                  ),
                ),
              ),
              Center(child: Image.asset('assets/images/play.png', scale: 2)),
              Positioned(
                left: 16,
                right: 12,
                bottom: 18,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                    height: 1.0,
                    color: Color(0xFFFFFFFF),
                    letterSpacing: 0.0,
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


class BottomRideItem extends StatelessWidget {
  final String icon;
  final String label;

  const BottomRideItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showMessage(context, '$label selected'),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(icon, style: const TextStyle(fontSize: 25)),
          const SizedBox(height: 3),
          Text(
            label,
            style: const TextStyle(fontSize: 10, color: Color(0xFF444A53)),
          ),
        ],
      ),
    );
  }
}

class CityMapPainter extends CustomPainter {
  const CityMapPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    canvas.drawRect(rect, Paint()..color = RideColors.mapBase);

    // Water channel in the lower-left corner.
    final water = Path()
      ..moveTo(0, size.height * .57)
      ..lineTo(size.width * .22, size.height * .65)
      ..lineTo(size.width * .42, size.height * .88)
      ..lineTo(size.width * .69, size.height)
      ..lineTo(0, size.height);
    canvas.drawPath(water, Paint()..color = RideColors.water);

    // City blocks and pale local roads.
    final blockPaint = Paint()..color = const Color(0xFFE8D8C0);
    final roadPaint = Paint()
      ..color = const Color(0xFFFFFCF6)
      ..strokeWidth = 7
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    final minorRoadPaint = Paint()
      ..color = const Color(0xFFD9C8AF)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    for (int i = -4; i < 10; i++) {
      final x = i * size.width / 6;
      canvas.drawLine(
        Offset(x, 0),
        Offset(x + size.width * .32, size.height),
        roadPaint,
      );
      canvas.drawLine(
        Offset(x + 15, 0),
        Offset(x + size.width * .32 + 15, size.height),
        minorRoadPaint,
      );
    }
    for (int i = 0; i < 9; i++) {
      final y = i * size.height / 7;
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y + size.height * .12),
        roadPaint,
      );
    }

    // A few block-shaped plots.
    for (int row = 0; row < 4; row++) {
      for (int col = 0; col < 4; col++) {
        final x = col * size.width * .29 + (row.isOdd ? 12 : -5);
        final y = row * size.height * .22 + 8;
        final r = Rect.fromLTWH(x, y, size.width * .12, size.height * .09);
        canvas.drawRRect(
          RRect.fromRectAndRadius(r, const Radius.circular(2)),
          blockPaint,
        );
        canvas.drawRRect(
          RRect.fromRectAndRadius(r.deflate(5), const Radius.circular(1)),
          Paint()..color = const Color(0xFFF3E7D4),
        );
      }
    }

    // Main curved road.
    final mainRoad = Path()
      ..moveTo(size.width * .40, -10)
      ..cubicTo(
        size.width * .22,
        size.height * .20,
        size.width * .02,
        size.height * .36,
        size.width * .24,
        size.height * .58,
      )
      ..cubicTo(
        size.width * .40,
        size.height * .76,
        size.width * .54,
        size.height * .87,
        size.width * .78,
        size.height + 10,
      );
    canvas.drawPath(
      mainRoad,
      Paint()
        ..color = const Color(0xFFE86C50)
        ..strokeWidth = 12
        ..style = PaintingStyle.stroke,
    );
    canvas.drawPath(
      mainRoad,
      Paint()
        ..color = const Color(0xFFFFF4E9)
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke,
    );

    // Red dashed route on the right.
    final route = Path()
      ..moveTo(size.width * .84, size.height * .22)
      ..lineTo(size.width * .69, size.height * .65)
      ..lineTo(size.width * .46, size.height * .91);
    _drawDashedPath(
      canvas,
      route,
      Paint()
        ..color = RideColors.red
        ..strokeWidth = 4
        ..style = PaintingStyle.stroke,
    );

    // Tiny parks.
    final parkPaint = Paint()..color = const Color(0xFF8EB78B);
    canvas.drawCircle(
      Offset(size.width * .13, size.height * .43),
      12,
      parkPaint,
    );
    canvas.drawCircle(
      Offset(size.width * .65, size.height * .53),
      10,
      Paint()..color = const Color(0xFF55956B),
    );
    canvas.drawCircle(
      Offset(size.width * .07, size.height * .56),
      8,
      Paint()..color = const Color(0xFF6EA87A),
    );
  }

  void _drawDashedPath(Canvas canvas, Path path, Paint paint) {
    for (final metric in path.computeMetrics()) {
      double distance = 0;
      const dashLength = 7.0;
      const gapLength = 4.0;
      while (distance < metric.length) {
        final end = math.min(distance + dashLength, metric.length);
        canvas.drawPath(metric.extractPath(distance, end), paint);
        distance = end + gapLength;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// class MapHeader extends StatelessWidget {
//   const MapHeader({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       fit: StackFit.expand,
//       children: [
//         const CustomPaint(painter: CityMapPainter()),
//         Positioned(
//           top: MediaQuery.paddingOf(context).top + 20,
//           left: MediaQuery.sizeOf(context).width > 700
//               ? (MediaQuery.sizeOf(context).width - 660) / 2
//               : 20,
//           right: MediaQuery.sizeOf(context).width > 700
//               ? (MediaQuery.sizeOf(context).width - 660) / 2
//               : 20,
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//             decoration: BoxDecoration(
//               color: Colors.white.withValues(alpha: 0.82),
//               borderRadius: BorderRadius.circular(20),
//               border: Border.all(color: Colors.white, width: 1.4),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withValues(alpha: 0.08),
//                   blurRadius: 15,
//                   offset: const Offset(0, 5),
//                 ),
//               ],
//             ),
//             child: Row(
//               children: [
//                 const Icon(Icons.location_on_outlined, color: RideColors.navy),
//                 const SizedBox(width: 10),
//                 const Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text(
//                         'Current location',
//                         style: TextStyle(fontSize: 14, color: RideColors.navy),
//                       ),
//                       Text(
//                         'New City',
//                         style: TextStyle(
//                           fontSize: 19,
//                           fontWeight: FontWeight.w700,
//                           color: Color(0xFF20232A),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const Icon(Icons.person, size: 25, color: Color(0xFF424750)),
//               ],
//             ),
//           ),
//         ),
//         const Positioned(
//           top: 0,
//           bottom: 0,
//           left: 0,
//           right: 0,
//           child: IgnorePointer(child: Center(child: MapPin())),
//         ),
//         Positioned(
//           left: MediaQuery.sizeOf(context).width > 700
//               ? (MediaQuery.sizeOf(context).width - 660) / 2
//               : 20,
//           right: MediaQuery.sizeOf(context).width > 700
//               ? (MediaQuery.sizeOf(context).width - 660) / 2
//               : 20,
//           bottom: 72,
//           child: Container(
//             padding: const EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: Colors.white.withValues(alpha: 0.78),
//               borderRadius: BorderRadius.circular(30),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withValues(alpha: 0.10),
//                   blurRadius: 18,
//                   offset: const Offset(0, 6),
//                 ),
//               ],
//             ),
//             child: Column(
//               children: [
//                 const SearchField(
//                   icon: Icons.circle,
//                   hint: 'Pick Up (Default on map)',
//                 ),
//                 const SizedBox(height: 14),
//                 SearchField(
//                   icon: Icons.circle,
//                   hint: 'Where to?',
//                   // onTap: () =>
//                   //     _showMessage(context, 'Destination search tapped'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Positioned(
//           right: 20,
//           bottom: 18,
//           child: Material(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(13),
//             elevation: 3,
//             child: InkWell(
//               borderRadius: BorderRadius.circular(13),
//               // onTap: () => _showMessage(context, 'Recenter map tapped'),
//               child: const SizedBox(
//                 width: 42,
//                 height: 42,
//                 child: Icon(Icons.navigation_rounded, color: RideColors.navy),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

class MapPin extends StatelessWidget {
  const MapPin({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -18),
      child: const Icon(Icons.location_on, size: 76, color: RideColors.red),
    );
  }
}

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
      borderRadius: BorderRadius.circular(28),
      child: InkWell(
        borderRadius: BorderRadius.circular(28),
        onTap: onTap,
        child: Container(
          height: 52,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Icon(icon, size: 22, color: const Color(0xFFBFC3C8)),
              const SizedBox(width: 22),
              Expanded(
                child: Text(
                  hint,
                  style: const TextStyle(fontSize: 15, color: RideColors.muted),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.boldTextLable,
    );
  }
}
