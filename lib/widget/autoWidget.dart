import 'package:flutter/material.dart';

import '../config/colorConstant.dart';
import '../config/textStyles.dart';

class ResponsiveAutoCardWidget extends StatelessWidget {
  final VoidCallback onTap;

  const ResponsiveAutoCardWidget({Key? key, required this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Figma/UI design ke aspect ratio ko maintain karne ke liye
    return AspectRatio(
      aspectRatio: 161.5 / 367.0, // Aapke grid card ka approximate aspect ratio
      child: LayoutBuilder(
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
            ), // Rounded corners
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: onTap,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // 1. Background 3D Illustration Image (Autorickshaw, Park, Road)
                  Positioned(
                    left: 0,
                    top: h * 0.55,
                    // Image ko thoda niche se start kiya hai
                    width: w,
                    height: h * 0.40,
                    child: Image.asset(
                      'assets/images/auto.png', // Apni image ka path yahan dein
                      fit: BoxFit.fill,
                    ),
                  ),

                  // 2. Text aur Badge Container
                  Padding(
                    padding: EdgeInsets.all(w * 0.12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // "NEW" Badge
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: w * 0.08,
                            vertical: h * 0.012,
                          ),
                          decoration: BoxDecoration(
                            color: RideColors.orange, // Yellow color
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'NEW',
                            style: AppTextStyles.newTextContent,
                          ),
                        ),
                        SizedBox(height: h * 0.025),

                        // Title: Autorickshaw
                        Text(
                          'Autorickshaw',
                          style: AppTextStyles.semiBoldTextLable,
                        ),
                        SizedBox(height: h * 0.01),

                        // Subtitle: Book Auto Rides with Us ›
                        Text(
                          'Book Auto Rides\nwith Us  ›',
                          style: AppTextStyles.text1Lable,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
