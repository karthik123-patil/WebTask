import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../config/textStyles.dart';

class ResponsiveCabCardWidget extends StatelessWidget {
  const ResponsiveCabCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 161.5 / 135.0,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final w = constraints.maxWidth;
          final h = constraints.maxHeight;
          return Container(
            width: w,
            height: h,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0009, 0.5531, 1.1728],
                colors: [
                  Color.fromRGBO(236, 244, 255, 0.69),
                  Color.fromRGBO(255, 240, 217, 0.69),
                  Color.fromRGBO(142, 146, 153, 0.69),
                ],
              ),
              borderRadius: BorderRadius.circular(w * 0.148),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // === FIX HERE: Background Car Image width and left adjusted ===
                Positioned(
                  left: 0,
                  // Changed from -w * 0.015 to 0
                  top: h * 0.200,
                  width: w,
                  // Changed from w * 1.027 to w (exact fit)
                  height: h * 0.822,
                  child: ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      Colors.transparent,
                      BlendMode.darken,
                    ),
                    child: Image.asset(
                      'assets/images/main.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                // Image 2 (Top Right)
                Positioned(
                  left: w * (0.5 + 0.156 - (0.328 / 2)),
                  top: h * 0.007,
                  width: w * 0.328,
                  height: h * 0.296,
                  child: Image.asset(
                    'assets/images/cloud2.png',
                    fit: BoxFit.contain,
                  ),
                ),

                // Image 3 (Top Left)
                Positioned(
                  left: w * (0.5 - 0.357 - (0.229 / 2)),
                  top: -h * 0.037,
                  width: w * 0.229,
                  height: h * 0.207,
                  child: Image.asset(
                    'assets/images/cloud1.png',
                    fit: BoxFit.contain,
                  ),
                ),

                // Image 4 (Middle Left)
                Positioned(
                  left: w * (0.52 - 0.425 - (0.229 / 2)),
                  top: h * 0.244,
                  width: w * 0.229,
                  height: h * 0.207,
                  child: Image.asset(
                    'assets/images/cloud3.png',
                    fit: BoxFit.contain,
                  ),
                ),

                // Text Content (Affordable & Cab)
                Positioned(
                  left: w * 0.099,
                  top: h * 0.118,
                  width: w * 0.789,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                          'Affordable',
                          style:  AppTextStyles.text1Lable),
                      Text('Cab', style: AppTextStyles.semiBoldTextLable),
                    ],
                  ),
                ),

                // Rectangle 260 (Rotated Element)
                Positioned(
                  left: w * 0.791,
                  top: h * 0.759,
                  child: Transform.rotate(
                    angle: -2.19 * (math.pi / 180),
                    child: Container(
                      width: w * 0.084,
                      height: h * 0.044,
                      decoration: BoxDecoration(
                        color: const Color(0xFFCBC0A9),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
