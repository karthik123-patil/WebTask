import 'package:flutter/material.dart';

import '../config/textStyles.dart';

class ResponsiveBikeCardWidget extends StatelessWidget {
  final VoidCallback onTap;

  const ResponsiveBikeCardWidget({Key? key, required this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final h = constraints.maxHeight;

        return Container(
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
          child: InkWell(
            onTap: onTap,
            child: Stack(
              fit: StackFit.expand,
              children: [
                // 1. Background Scooter/City Illustration Image
                Positioned(
                  left: 0,
                  top: h * 0.28,
                  // Image ko thoda upar-neeche adjust karne ke liye
                  width: w,
                  height: h * 0.72,
                  child: Image.asset(
                    'assets/images/bike.png',
                    // Apni bike/scooter image ka path yahan dein
                    fit: BoxFit.fill,
                  ),
                ),

                // 2. Title: Bike Text Container
                Padding(
                  padding: EdgeInsets.fromLTRB(w * 0.12, h * 0.12, w * 0.12, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Bike', style: AppTextStyles.semiBoldTextLable),
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
