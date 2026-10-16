import 'package:flutter/material.dart';

import '../config/textStyles.dart';

class ResponsiveMoreCardWidget extends StatelessWidget {
  final VoidCallback onTap;

  const ResponsiveMoreCardWidget({Key? key, required this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final h = constraints.maxHeight;

        return Material(
          color: Color(0xFFEFEFEF), // Pale blue card background
          borderRadius: BorderRadius.circular(24.0),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap,
            child: Stack(
              fit: StackFit.expand,
              children: [
                // 1. Background Scooter/City Illustration Image
                Positioned(
                  left: 0,
                  top: h * 0.50,
                  // Image ko thoda upar-neeche adjust karne ke liye
                  width: w,
                  height: h * 0.40,
                  child: Center(
                    child: Image.asset(
                      width: 48,
                      height: 48,
                      'assets/images/more.png',
                      // Apni bike/scooter image ka path yahan dein
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                // 2. Title: Bike Text Container
                Padding(
                  padding: EdgeInsets.fromLTRB(w * 0.12, h * 0.12, w * 0.12, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'More',
                        style: AppTextStyles.semiBoldTextLable,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
