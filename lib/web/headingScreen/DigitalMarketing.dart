import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DigitalmarketingScreen extends StatefulWidget {
  const DigitalmarketingScreen({super.key});

  @override
  State<DigitalmarketingScreen> createState() =>
      _DesignAndBrandingSectionState();
}

class _DesignAndBrandingSectionState extends State<DigitalmarketingScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1100;

    return Scaffold(
      // Deep dark theme background
      body: Stack(
        children: [
          Positioned.fill(
            left: 0,
            child: Image.asset('assets/images/img_7.png', fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
